//
//  ProductModel.swift
//  Restaurant
//
//  Created by кирилл ларионов on 25.10.2022.
//

import Foundation
import FirebaseFirestore
import ObjectMapper

struct ProductModel {
    var id: String = UUID().uuidString
    var name: String
    var description: String
    var calories: Int
    var category: CategoryModel
    var ingredients: [IngredientModel]
   
   
    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["name"] = self.name
        repres["description"] = self.description
        repres["calories"] = self.calories
        repres["category"] = self.category.representation
        repres["ingredients"] = self.ingredients.map({ $0.representation })
        return repres
    }
    
    init(id: String = UUID().uuidString, name: String,
         description: String, calories: Int,
         category: CategoryModel, ingredients: [IngredientModel]) {
        
        self.id = id
        self.name = name
        self.description = description
        self.calories = calories
        self.category = category
        self.ingredients = ingredients
    }
    
    init?(queryDocumentSnapshot: QueryDocumentSnapshot) {
        let data = queryDocumentSnapshot.data()
        
        guard let id = data["id"] as? String else { return nil }
        guard let name = data["name"] as? String else { return nil }
        guard let description = data["description"] as? String else { return nil }
        guard let calories = data["calories"] as? Int else { return nil }
        guard let category = data["category"] as? [String: Any] else { return nil }
        guard let ingredients = data["ingredients"] as? [[String: Any]] else { return nil }
        
        var appendIngredients: [IngredientModel] = [IngredientModel]()
        
        for ingredient in ingredients {
            appendIngredients.append(IngredientModel(id: ingredient["id"] as! String,
                                                    name: ingredient["name"] as! String,
                                                    calories: ingredient["calories"] as! Int)
            )
        }
        
        self.id = id
        self.name = name
        self.description = description
        self.calories = calories
        self.category = CategoryModel(id: category["id"] as! String,
                                      name: category["name"] as! String)
        self.ingredients = appendIngredients
    }
}
