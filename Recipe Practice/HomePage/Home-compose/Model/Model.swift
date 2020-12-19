//
//  Model.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/18.
//

import UIKit

struct Ingredient{
    let ingredientImage : UIImage
    let ingredienttitle : String
    
}

extension Ingredient{
    
    static func getIngredients()-> [Ingredient]{
        
        return[
            Ingredient(ingredientImage: UIImage(named: "tomato") ?? UIImage(systemName: "photo")!, ingredienttitle: "Tomato"),
            
            Ingredient(ingredientImage: UIImage(named: "tomatosauce") ?? UIImage(systemName: "photo")!, ingredienttitle: "Tomato sauce"),
            
            Ingredient(ingredientImage: UIImage(named: "tomatojuice") ?? UIImage(systemName: "photo")!, ingredienttitle: "Tomato juice"),

        ]
        
    }
}
