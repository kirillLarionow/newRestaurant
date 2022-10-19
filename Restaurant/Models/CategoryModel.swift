//
//  CategoryModel.swift
//  Restaurant
//
//  Created by кирилл ларионов on 19.10.2022.
//

import Foundation
import FirebaseFirestore

struct CategoryModel {
    var id: String = UUID().uuidString
    var name: String
   
    
    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["name"] = self.name
        
        return repres
    }
    
    init(id: String = UUID().uuidString, name: String) {
        self.id = id
        self.name = name
    }
    
    init?(queryDocumentSnapshot: QueryDocumentSnapshot) {
        let data = queryDocumentSnapshot.data()
        
        guard let id = data["id"] as? String else { return nil }
        guard let name = data["name"] as? String else { return nil }
        
        self.id = id
        self.name = name
    }
}
