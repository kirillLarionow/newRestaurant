//
//  IngredientModel.swift
//  Restaurant
//
//  Created by кирилл ларионов on 12.10.2022.
//

import Foundation

struct IngredientModel: Identifiable {
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
}
