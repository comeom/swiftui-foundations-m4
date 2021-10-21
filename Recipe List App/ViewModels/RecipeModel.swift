//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Wayne on 2021/10/18.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of data service and get data
        self.recipes = DataService.getLocalData()
        
    }
}
