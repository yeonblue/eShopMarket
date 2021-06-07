//
//  ItemsTableViewController.swift
//  eShopMarket
//
//  Created by yeonBlue on 2021/06/02.
//

import UIKit

private let itemToAddItemSegueIdentifier = "itemToAddItemSegue"

class ItemsTableViewController: UITableViewController {

    // MARK: - Properties
    var category: Category?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DEBUG: ItemsTableViewController - viewDidLoad()")
        print("DEBUG: \(category?.id ?? "no value in category")")
    }
}

// MARK: - Navigaiton
extension ItemsTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == itemToAddItemSegueIdentifier {
            let vc = segue.destination as? AddItemViewController
            guard let category = self.category else { return }
            vc?.category = category
        }
    }
}


// MARK: - UITableViewDatasource
extension ItemsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
