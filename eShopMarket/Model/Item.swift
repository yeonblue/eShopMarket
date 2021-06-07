//
//  Item.swift
//  eShopMarket
//
//  Created by yeonBlue on 2021/06/02.
//

import UIKit

struct Item {
    
    var id: String!
    var categoryId: String!
    
    var name: String!
    var description: String!
    var price: Double!
    var imageLinks: [String]!
    
    init(_ dictionary: NSDictionary) {
        self.id = dictionary[Constants.Item.kOBJECTID] as? String
        self.categoryId = dictionary[Constants.Item.kCATEGORY_ID] as? String
        self.name = dictionary[Constants.Item.kNAME] as? String
        self.description = dictionary[Constants.Item.kDESCRIPTION] as? String
        self.price = dictionary[Constants.Item.kPRICE] as? Double
        self.imageLinks = dictionary[Constants.Item.kIMAGELINKS] as? [String]
    }
    
    init() {
        
    }
}

// MARK: - Helpers
func itemDictionaryFromDictionary(_ item: Item) -> NSDictionary {
    return NSDictionary(objects: [item.id ?? "",
                                  item.categoryId ?? "",
                                  item.name ?? "",
                                  item.description ?? "",
                                  item.price ?? 0,
                                  item.imageLinks ?? []],
                        forKeys: [Constants.Item.kOBJECTID as NSCopying,
                                  Constants.Item.kCATEGORY_ID as NSCopying,
                                  Constants.Item.kNAME as NSCopying,
                                  Constants.Item.kDESCRIPTION as NSCopying,
                                  Constants.Item.kPRICE as NSCopying,
                                  Constants.Item.kIMAGELINKS as NSCopying])
}

func saveItemToFirestore(_ item: Item) {
    FirebaseReference(.Items)
        .document(item.id)
        .setData(itemDictionaryFromDictionary(item) as! [String : Any])
}
