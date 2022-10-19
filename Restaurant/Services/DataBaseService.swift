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
    
    private var categoriesReference: CollectionReference {
        return firestore.collection("categories")
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
    
    func getIngredients(completion: @escaping (Result<[IngredientModel], Error>) -> ()) {
        ingredientsReference.getDocuments { querySnapshot, error in
            if let querySnapshots = querySnapshot?.documents {
                var ingredients = [IngredientModel]()
                
                for querySnapshot in querySnapshots {
                    
                    if let ingredient = IngredientModel(queryDocumentSnapshot: querySnapshot) {
                        ingredients.append(ingredient)
                    }
                }
                completion(.success(ingredients))
            } else  if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func udpateIngredient(ingredient: IngredientModel,
                          oldIngredient: IngredientModel,
                          completion: @escaping (Result<IngredientModel, Error>) -> ()) {
        do {
            
            ingredientsReference.document(oldIngredient.name).delete()
            
            ingredientsReference.document(ingredient.name).setData([
               "id" :  oldIngredient.id,
               "name" : ingredient.name,
               "calories" : ingredient.calories
           ])

            completion(.success(ingredient))
        } catch {
            completion(.failure("хз че тут сделать " as! Error))
        }
    }
    
    func createCategory(category: CategoryModel, completion: @escaping (Result<CategoryModel, Error>) -> ()) {
        categoriesReference.document(category.name).setData(category.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(category))
            }
        }
    }
    
    func getCategories(completion: @escaping (Result<[CategoryModel], Error>) -> ()) {
        categoriesReference.getDocuments { querySnapshot, error in
            if let querySnapshots = querySnapshot?.documents {
                var categories = [CategoryModel]()
                
                for querySnapshot in querySnapshots {
                    
                    if let category = CategoryModel(queryDocumentSnapshot: querySnapshot) {
                        categories.append(category)
                    }
                }
                completion(.success(categories))
            } else  if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func udpateCategory(category: CategoryModel,
                          oldCategory: CategoryModel,
                          completion: @escaping (Result<CategoryModel, Error>) -> ()) {
        do {
            
            categoriesReference.document(oldCategory.name).delete()
            
            
            categoriesReference.document(category.name).setData([
               "id" :  oldCategory.id,
               "name" : category.name
            ])
            
        

            completion(.success(category))
        } catch {
            completion(.failure("хз че тут сделать " as! Error))
        }
    }
}
