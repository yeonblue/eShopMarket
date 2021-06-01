//
//  CategoryCollectionViewCell.swift
//  eShopMarket
//
//  Created by yeonBlue on 2021/05/26.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    // MARK: - Lifecycle
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func generateCell( _ data: Category) {
        self.nameLabel.text = data.name
        self.imageView.image = data.image
    }
}
