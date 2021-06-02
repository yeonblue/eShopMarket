//
//  ItemsTableViewController.swift
//  eShopMarket
//
//  Created by yeonBlue on 2021/06/02.
//

import UIKit

class ItemsTableViewController: UITableViewController {

    // MARK: - Properties
    var category: Category?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(category?.name)
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
