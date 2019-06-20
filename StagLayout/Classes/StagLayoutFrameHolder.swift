//
//  StagLayoutFrameHolder.swift
//  StagLayout
//
//  Created by Inder Dhir on 12/25/18.
//

extension Array {
    subscript (safe index: Int) -> Element? {
        return Int(index) < count ? self[Int(index)] : nil
    }
}

class StagLayoutFrameHolder {

    var cache = [UICollectionViewLayoutAttributes]()

    private let widthHeightRatios: [(CGFloat, CGFloat)]
    private var contentWidth: CGFloat = 0
    private var contentHeight: CGFloat = 0
    private let itemSpacing: CGFloat

    var prepared: Bool { return !cache.isEmpty }

    var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }

    public init(widthHeightRatios: [(CGFloat, CGFloat)], itemSpacing: CGFloat) {
        self.widthHeightRatios = widthHeightRatios
        self.itemSpacing = itemSpacing
    }

    public func prepare(itemCount: Int, contentWidth: CGFloat) {
        self.contentWidth = contentWidth
        
        var xOffset: CGFloat = 0
        var yOffset: CGFloat = 0
        var previousItemFrame: CGRect?
        var ratioIndex = 0

        for index in 0..<itemCount {
            if ratioIndex >= widthHeightRatios.count { ratioIndex = 0 }

            let ratios = widthHeightRatios[ratioIndex]
            precondition(
                ratios.0 >= 0.0 && ratios.1 >= 0.0 && ratios.0 <= 1.0,
                "Width ratio should be in [0.0, 1.0], with height ratio being in [0.0, ∞)"
            )

            let isFullWidth = ratios.0 == 1.0
            let halfItemSpacing = itemSpacing * 0.5
            let (width, height) = (
                (contentWidth * ratios.0) - (isFullWidth ? 0 : halfItemSpacing),
                contentWidth * ratios.1
            )

            var frame = CGRect(x: xOffset, y: yOffset, width: width, height: height)

            let indexPath = IndexPath(item: index, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame
            cache.append(attributes)

            contentHeight = max(contentHeight, frame.maxY)

            let hasReachedEnd = xOffset + width >= contentWidth
            let isItemNextToIt: Bool
            if let previousItemFrame = previousItemFrame {
                // check whether there's still room to place another item to the right of it
                let isThereSpaceNextToIt = frame.maxY <= previousItemFrame.maxY
                // Make sure there's no item next to it
                isItemNextToIt = !isFullWidth && (frame.maxY - itemSpacing) <= previousItemFrame.maxY

                // If there's an item next to it and no space, the next item should have an xOffset of 0
                // and height will auto correct to not include spacing so that it is perfectly aligned
                if !isThereSpaceNextToIt && isItemNextToIt {
                    frame = CGRect(x: xOffset, y: yOffset, width: width, height: height - itemSpacing)
                    attributes.frame = frame
                    cache.removeLast()
                    cache.append(attributes)
                }
            } else {
                isItemNextToIt = false
            }

            if isFullWidth || hasReachedEnd || isItemNextToIt {
                xOffset = 0
            } else {
                xOffset += frame.width + itemSpacing
            }

            if isFullWidth {
                yOffset = frame.maxY + itemSpacing
            } else {
                if let previousItemFrame = previousItemFrame {
                    yOffset = min(frame.maxY, previousItemFrame.maxY) + itemSpacing
                }
            }

            previousItemFrame = frame
            ratioIndex += 1
        }
    }

    public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        for attributes in cache where attributes.frame.intersects(rect) {
            visibleLayoutAttributes.append(attributes)
        }
        return visibleLayoutAttributes
    }

    public func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[safe: indexPath.item]
    }

    public func invalidateLayout() { cache.removeAll() }
}
