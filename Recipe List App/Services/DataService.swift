//
//  DataService.swift
//  Recipe List App
//
//  Created by Wayne on 2021/10/18.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        // Parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with JSON decoder
            let decoder = JSONDecoder()
            
            do {
                
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add unique IDs
                for r in recipeData {
                    r.id = UUID()
                }
                
                // Return the recipes
                return recipeData
            }
            catch {
                // error with parsing json
                print(error)
            }

            
        }
        catch {
            // error with getting data
            print(error)
        }
        
        return [Recipe]()
    }
}
