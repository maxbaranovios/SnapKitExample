//
//  CustomFlowLayout.swift
//  SnapKitExample
//
//  Created by Maxim Baranov on 14.01.23.
//

import UIKit

protocol CustomFlotLayoutProtocol {
    func numberOfItemsInCollection() -> Int
}


//
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        let attributesForElementsInRect = super.layoutAttributesForElements(in: rect)
//        var newAttributesForElementsInRect = [UICollectionViewLayoutAttributes]()
//
//        var leftMargin: CGFloat = 0.0;
//
//        for attributes in attributesForElementsInRect! {
//            if (attributes.frame.origin.x == self.sectionInset.left) {
//                leftMargin = self.sectionInset.left
//            } else {
//                var newLeftAlignedFrame = attributes.frame
//                newLeftAlignedFrame.origin.x = leftMargin
//                attributes.frame = newLeftAlignedFrame
//            }
//            leftMargin += attributes.frame.size.width + 8 // Makes the space between cells
//            newAttributesForElementsInRect.append(attributes)
//        }
//
//        return newAttributesForElementsInRect
//    }


final class CustomFlowLayout: UICollectionViewFlowLayout {
    
    var cache = [UICollectionViewLayoutAttributes]()
    
    fileprivate let numberOfColumns = 3
    
    fileprivate var contentHeight: CGFloat = 0
    fileprivate var contentWidth: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        return collectionView.bounds.width
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }

    
    override init() {
        super.init()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        guard let collectionView = collectionView else { return }
        let columnWidth = contentWidth // CGFloat(numberOfColumns)
        
        let xOffset: [CGFloat] = [10, columnWidth]
        let yOffset: CGFloat = 100
        let labelHeight: CGFloat = 100

        let indexPathOne = IndexPath(item: 1, section: 0)
        let frameOne = CGRect(x: xOffset[0], y: yOffset, width: columnWidth, height: labelHeight)
        
        let attribOne = UICollectionViewLayoutAttributes(forCellWith: indexPathOne)
        attribOne.frame = frameOne
        self.cache.append(attribOne)
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            print(item)
        }
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        
//        let width = UIScreen.main.bounds.width / 2
//        let rect = CGRect(x: 0, y: 0, width: width, height: 100)
//        let indexPath = IndexPath(item: 0, section: 0)
//        let attributeOne = UICollectionViewLayoutAttributes(forCellWith: indexPath)
//        attributeOne.frame = rect
//        visibleLayoutAttributes.append(attributeOne)
//
//        let rectTwo = CGRect(x: 0, y: 150, width: width, height: 100)
//        let indexPath2 = IndexPath(item: 1, section: 0)
//        let attributeTwo = UICollectionViewLayoutAttributes(forCellWith: indexPath2)
//        attributeTwo.frame = rectTwo
//        visibleLayoutAttributes.append(attributeTwo)
        
        return cache
    }
    
}

extension CustomFlotLayoutProtocol {
    
    func heighForContentInItem(at indexPath: IndexPath) -> CGFloat {
        return 0
    }
}
