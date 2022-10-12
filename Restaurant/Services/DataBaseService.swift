//
//  DataBaseService.swift
//  Restaurant
//
//  Created by кирилл ларионов on 11.10.2022.
//

import Foundation
import FirebaseFirestore

class DataBaseService {
    static let shared = DataBaseService()
    
    private let firestore = Firestore.firestore()
    
    private var ingredientsReference: CollectionReference {
        return firestore.collection("ingredients")
    }
    
    private init() { }
    
    func createIngredient(ingredient: IngredientModel, completion: @escaping (Result<IngredientModel, Error>) -> ()) {
        ingredientsReference.document(ingredient.name).setData(ingredient.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(ingredient))
            }
        }
    }
}
