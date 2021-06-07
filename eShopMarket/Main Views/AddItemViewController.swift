//
//  AddItemViewController.swift
//  eShopMarket
//
//  Created by yeonBlue on 2021/06/07.
//

import UIKit

class AddItemViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var cameraButton: UIButton!
    
    // MARK: - Vars
    var category: Category?
    var itemImages: [UIImage?] = []
    
    // MARK: - IBActions
    @IBAction func cameraButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        if allFieldAreCompleted() {
            saveToFirebase()
        } else {
            print("DEBUG: All Fields are required")
        }
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        dismissKeyboard()
    }
    
    // MARK: - Helpers
    private func dismissKeyboard() {
        self.view.endEditing(false)
    }
    
    private func allFieldAreCompleted() -> Bool {
        return (!titleTextField.text!.isEmpty &&
                    !priceTextField.text!.isEmpty &&
                    !descriptionTextView.text.isEmpty)
    }
    
    private func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("DEBUG: AddItemViewController - viewDidLoad()")
        print("DEBUG: \(category?.id ?? "no value in category")")
    }
}

// MARK: - Save Item
extension AddItemViewController {
    func saveToFirebase() {
        print("DEBUG: AddItemViewController - saveToFirebase()")
        
        guard let category = self.category else { return }
        
        var item = Item()
        item.id = UUID().uuidString
        item.name = titleTextField.text!
        item.categoryId = category.id
        item.price = Double(priceTextField.text!)
        
        if itemImages.count > 0 {
            
        } else {
            saveItemToFirestore(item)
            popViewController()
        }
        
    }
}
