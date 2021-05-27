//
//  CategoryCollectionViewController.swift
//  eShopMarket
//
//  Created by yeonBlue on 2021/05/26.
//

import UIKit

private let reuseIdentifier = "CategoryCell"

class CategoryCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        generateCategorySet()
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}
