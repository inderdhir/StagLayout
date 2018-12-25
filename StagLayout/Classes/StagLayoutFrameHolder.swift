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

public class StagLayoutFrameHolder {

    var cache = [UICollectionViewLayoutAttributes]()

    private let ratios: [CGFloat]
    private var contentWidth: CGFloat = 0
    private var contentHeight: CGFloat = 0
    private let itemSpacing: CGFloat

    var prepared: Bool { return cache.isEmpty }

    var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }

    public init(ratios: [CGFloat], itemSpacing: CGFloat) {
        self.ratios = ratios
        self.itemSpacing = itemSpacing
    }

    public func prepare(itemCount: Int, contentWidth: CGFloat) {
        self.contentWidth = contentWidth
        
        var xOffset: CGFloat = 0
        var yOffset: CGFloat = 0
        //        var previousItemFrame: CGRect?

        var ratioIndex = 0
        for item in 0 ..< itemCount {
            if ratioIndex >= ratios.count { ratioIndex = 0 }

            let widthHeight = contentWidth * ratios[ratioIndex]
            let itemSize = CGSize(width: widthHeight, height: widthHeight)
            let frame = CGRect(
                x: xOffset,
                y: yOffset,
                width: widthHeight,
                height: widthHeight
            )

            let indexPath = IndexPath(item: item, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame
            cache.append(attributes)

            contentHeight = max(contentHeight, frame.maxY)

            //            xOffset += itemSize.width + itemSp
            yOffset += itemSize.height + itemSpacing

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
