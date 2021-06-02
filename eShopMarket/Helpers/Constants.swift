//
//  Constants.swift
//  eShopMarket
//
//  Created by yeonBlue on 2021/05/27.
//

import Foundation

// MARK: - Category

struct Constants {
    
    struct FPath {
        static let kUSER_PATH = "User"
        static let kCATEGORY_PATH = "Category"
        static let kITEMS_PATH = "Items"
        static let kBASKET_PATH = "Basket"
    }
    
    struct Category {
        static let kNAME = "name"
        static let kIMAGENAME = "imageName"
        static let kOBJECTID = "objectId"
    }
    
    struct Item {
        static let kOBJECTID = "objectId"
        static let kCATEGORY_ID = "categoryID"
        static let kNAME = "name"
        static let kDESCRIPTION = "description"
        static let kPRICE = "price"
        static let kIMAGELINKS = "imageLinks"
    }
}
