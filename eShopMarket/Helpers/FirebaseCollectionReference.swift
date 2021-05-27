//
//  FirebaseCollectionReference.swift
//  eShopMarket
//
//  Created by yeonBlue on 2021/05/26.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String {
    case User
    case Category
    case Items
    /// user wants to buy
    case Basket
}

func FirebaseReference(_ collectionRef: FCollectionReference) -> CollectionReference {
    return Firestore.firestore().collection(collectionRef.rawValue)
}
