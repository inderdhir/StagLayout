//
//  StagLayout.swift
//  StagLayout
//
//  Created by Inder Dhir on 12/24/18.
//

import Foundation

public class StagLayout: UICollectionViewLayout {

    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        let sectionInsets = collectionView.contentInset
        return collectionView.bounds.width - (sectionInsets.left + sectionInsets.right)
    }

    private var frameHolder: StagLayoutFrameHolder!

    public init(ratios: [CGFloat], itemSpacing: CGFloat) {
        super.init()
        frameHolder = StagLayoutFrameHolder(
            ratios: ratios,
            itemSpacing: itemSpacing
        )
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public var collectionViewContentSize: CGSize {
        return frameHolder.collectionViewContentSize
    }

    override public func prepare() {
        super.prepare()
        guard frameHolder.prepared, let collectionView = collectionView else { return }
        frameHolder.prepare(itemCount: collectionView.numberOfItems(inSection: 0), contentWidth: contentWidth)
    }

    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return frameHolder.layoutAttributesForElements(in: rect)
    }

    override public func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return frameHolder.layoutAttributesForItem(at: indexPath)
    }

    override public func invalidateLayout() {
        super.invalidateLayout()
        frameHolder.invalidateLayout()
    }
}
