//
//  IngredientModel.swift
//  Restaurant
//
//  Created by кирилл ларионов on 12.10.2022.
//

import Foundation
import FirebaseFirestore

struct IngredientModel {
    var id: String = UUID().uuidString
    var name: String
    var calories: Int
    
    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["name"] = self.name
        repres["calories"] = self.calories
        
        return repres
    }
    
    init(id: String = UUID().uuidString, name: String, calories: Int) {
        self.id = id
        self.name = name
        self.calories = calories
    }
    
    init?(queryDocumentSnapshot: QueryDocumentSnapshot) {
        let data = queryDocumentSnapshot.data()
        
        guard let id = data["id"] as? String else { return nil }
        guard let name = data["name"] as? String else { return nil }
        guard let calories = data["calories"] as? Int else { return nil }
        
        self.id = id
        self.name = name
        self.calories = calories
    }
}
