//
//  Category.swift
//  eShopMarket
//
//  Created by yeonBlue on 2021/05/27.
//

import UIKit

class Category {
    
    var id: String
    var name: String
    var image: UIImage?
    var imageName: String?
    
    init(_ name: String, _ imageName: String) {
        self.id = ""
        self.name = name
        self.imageName = imageName
        self.image = UIImage(named: imageName)
    }
    
    init(_ dictionary: NSDictionary) {
        self.id = dictionary[Constants.Category.kOBJECTID] as! String
        self.name = dictionary[Constants.Category.kNAME] as! String
        self.imageName = dictionary[Constants.Category.kIMAGENAME] as? String ?? ""
        self.image = UIImage(named: self.imageName ?? "")
    }
}

// MARK: - Save Category Functions

func saveCategoryToFirebase(_ category: Category) {
    
    let id = UUID().uuidString
    category.id = id
    
    FirebaseReference(.Category)
        .document(id)
        .setData(makeCategoryFromDictionary(category) as! [String: Any])
}

// MARK: - Download Category
func downloadCategoryFromFirebase(completion: @escaping (_ categoryArray: [Category]) -> Void) {
    var categoryArray = [Category]()
    
    FirebaseReference(.Category).getDocuments { snapshot, err in
        guard let snapshot = snapshot else {
            completion(categoryArray)
            return
        }
        
        if snapshot.isEmpty {
            completion(categoryArray)
            return
        } else {
            for categoryDict in snapshot.documents {
                categoryArray.append(Category(categoryDict.data() as NSDictionary))
            }
            
            completion(categoryArray)
        }
    }
}

// MARK: - Helpers
// reference 데이터를 바로 dictionary로는 변경 불가하므로 NSDictionrary 사용
func makeCategoryFromDictionary(_ category: Category) -> NSDictionary {
    return NSDictionary(objects: [category.id,
                                  category.name,
                                  category.imageName ?? ""]
                        , forKeys: [Constants.Category.kOBJECTID as NSCopying,
                                    Constants.Category.kNAME as NSCopying,
                                    Constants.Category.kIMAGENAME as NSCopying])
}

// 처음 한 번만 실행하여 Firebase에 저장
func generateCategorySet() {

    let womenClothing = Category("Women's Clothing & Accessories", "womenCloth")
    let footWaer = Category("Footwaer", "footWaer")
    let electronics = Category("Electronics", "electronics")
    let menClothing = Category("Men's Clothing & Accessories" , "menCloth")
    let health = Category("Health & Beauty", "health")
    let baby = Category("Baby Stuff", "baby")
    let home = Category("Home & Kitchen", "home")
    let car = Category("Automobiles & Motorcyles", "car")
    let luggage = Category("Luggage & bags", "luggage")
    let jewelery = Category("Jewelery", "jewelery")
    let hobby =  Category("Hobby, Sport, Traveling", "hobby")
    let pet = Category("Pet products", "pet")
    let industry = Category("Industry & Business", "industry")
    let garden = Category("Garden supplies", "garden")
    let camera = Category("Cameras & Optics", "camera")

    let categories = [womenClothing, footWaer, electronics, menClothing, health, baby, home, car, luggage, jewelery, hobby, pet, industry, garden, camera]

    for category in categories {
        saveCategoryToFirebase(category)
    }
}
