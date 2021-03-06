//
//  CategoryCollectionViewController.swift
//  eShopMarket
//
//  Created by yeonBlue on 2021/05/26.
//

import UIKit

private let reuseIdentifier = "CategoryCell"
private let categoryToItemSegueIdentifier = "categoryToItemSegue"
private let itemForRow = 3
private let sectionInsets = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 20.0, right: 10.0)

class CategoryCollectionViewController: UICollectionViewController {

    // MARK: - Properties
    var categoryArray = [Category]() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DEBUG: CategoryCollectionViewController - viewDidLoad()")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("DEBUG: CategoryCollectionViewController - viewDidAppear()")
        
        loadCategories()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == categoryToItemSegueIdentifier {
            print("DEBUG: CategoryCollectionViewController - prepare(ItemsTableViewController)")
            let vc = segue.destination as! ItemsTableViewController
            vc.category = sender as? Category
        }
    }
}

// MARK: - UICollectionViewDataSource
extension CategoryCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! CategoryCollectionViewCell
        cell.generateCell(categoryArray[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension CategoryCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: categoryToItemSegueIdentifier,
                     sender: categoryArray[indexPath.row])
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CategoryCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * CGFloat((itemForRow + 1))
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = floor(availableWidth / CGFloat(itemForRow))
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

// MARK: - Helper
extension CategoryCollectionViewController {
    private func loadCategories() {
        downloadCategoryFromFirebase { [weak self] categoryArray in
            print("DEBUG: current categoryCnt: \(categoryArray.count)")
            self?.categoryArray = categoryArray
        }
    }
}
