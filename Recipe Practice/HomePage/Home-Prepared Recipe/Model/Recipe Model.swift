//
//  Recipe Model.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/22.
//

import UIKit

struct Recipe {
    enum Difficaulty : String{
       case easy, intermediate, hard
        
        var image : UIImage {
            switch self {
            
            case .easy: return UIImage(named: "onestar")!
                
            case .intermediate: return UIImage(named: "twostar")!
                
            case .hard: return UIImage(named: "threestar")!
                
            }
        }
        
        var capStr : String{
            switch self {
            
            case .easy: return "Easy"
                
            case .intermediate: return "Intermediate"
                
            case .hard: return "Hard"
                
            }
        }
    }
    
    let recipeImage : UIImage
    let recipeName : String
    let hatRate: Int
    let hatFloat : Float
    let difficaulty : Difficaulty
    let cookTime : (Int,Int)
    
}

extension Recipe {
    
    static func getRecipes() -> [Recipe] {
        return [
            Recipe(recipeImage: UIImage(named: "recipe1")!, recipeName: "Recipe 1", hatRate: 4, hatFloat: 9.0, difficaulty: .easy, cookTime: (0,20)),
            
            Recipe(recipeImage: UIImage(named: "recipe2")!, recipeName: "Recipe 2", hatRate: 3, hatFloat: 8.0, difficaulty: .easy, cookTime: (0,35)),
            
            Recipe(recipeImage: UIImage(named: "recipe3")!, recipeName: "Recipe 3", hatRate: 4, hatFloat: 9.0, difficaulty: .intermediate, cookTime: (1,20)),
            
            Recipe(recipeImage: UIImage(named: "recipe4")!, recipeName: "Recipe 4", hatRate: 2, hatFloat: 9.0, difficaulty: .hard, cookTime: (2,0)),
            
            Recipe(recipeImage: UIImage(named: "recipe1")!, recipeName: "Recipe 1", hatRate: 4, hatFloat: 9.0, difficaulty: .easy, cookTime: (0,20)),
            
            Recipe(recipeImage: UIImage(named: "recipe2")!, recipeName: "Recipe 2", hatRate: 3, hatFloat: 8.0, difficaulty: .easy, cookTime: (0,35)),
            
            Recipe(recipeImage: UIImage(named: "recipe3")!, recipeName: "Recipe 3", hatRate: 4, hatFloat: 9.0, difficaulty: .intermediate, cookTime: (1,20)),
            
            Recipe(recipeImage: UIImage(named: "recipe4")!, recipeName: "Recipe 4", hatRate: 2, hatFloat: 9.0, difficaulty: .hard, cookTime: (2,0)),
            
            Recipe(recipeImage: UIImage(named: "recipe1")!, recipeName: "Recipe 1", hatRate: 4, hatFloat: 9.0, difficaulty: .easy, cookTime: (0,20)),
            
            Recipe(recipeImage: UIImage(named: "recipe2")!, recipeName: "Recipe 2", hatRate: 3, hatFloat: 8.0, difficaulty: .easy, cookTime: (0,35)),
            
            Recipe(recipeImage: UIImage(named: "recipe3")!, recipeName: "Recipe 3", hatRate: 4, hatFloat: 9.0, difficaulty: .intermediate, cookTime: (1,20)),
            
            Recipe(recipeImage: UIImage(named: "recipe4")!, recipeName: "Recipe 4", hatRate: 2, hatFloat: 9.0, difficaulty: .hard, cookTime: (2,0))

        ]
        
    }
}
