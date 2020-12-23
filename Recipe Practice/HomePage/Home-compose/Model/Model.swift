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
    
    var isSelected: Bool = false
    
}

extension Ingredient{
    
    static func getIngredients()-> [Ingredient]{
        
        return[
            Ingredient(ingredientImage: UIImage(named: "tomato") ?? UIImage(systemName: "photo")!, ingredienttitle: "Tomato"),
            
            Ingredient(ingredientImage: UIImage(named: "tomatosauce") ?? UIImage(systemName: "photo")!, ingredienttitle: "Tomato sauce"),
            
            Ingredient(ingredientImage: UIImage(named: "tomatojuice") ?? UIImage(systemName: "photo")!, ingredienttitle: "Tomato juice"),

        ]
        
    }
    
    static func getSearchedIngrents()-> [Ingredient] {
        return [
            Ingredient(ingredientImage: UIImage(named: "corn") ?? UIImage(systemName: "photo")!, ingredienttitle: "Corn"),
            
            Ingredient(ingredientImage: UIImage(named: "lecture") ?? UIImage(systemName: "photo")!, ingredienttitle: "Lecture"),
            
            Ingredient(ingredientImage: UIImage(named: "bbqsauce") ?? UIImage(systemName: "photo")!, ingredienttitle: "Kinder’s Organicmild BBQ Sauce"),
            Ingredient(ingredientImage: UIImage(named: "blackpepper") ?? UIImage(systemName: "photo")!, ingredienttitle: "Black pepper"),
            Ingredient(ingredientImage: UIImage(named: "tomato") ?? UIImage(systemName: "photo")!, ingredienttitle: "Tomato"),
            
            Ingredient(ingredientImage: UIImage(named: "tomatosauce") ?? UIImage(systemName: "photo")!, ingredienttitle: "Tomato sauce"),
            
            Ingredient(ingredientImage: UIImage(named: "tomatojuice") ?? UIImage(systemName: "photo")!, ingredienttitle: "Tomato juice")

        ]
        
    }
    
    
    static func getSimilarProduct() -> [Ingredient] {
        return [
            Ingredient(ingredientImage: UIImage(named: "bbq1") ?? UIImage(systemName: "photo")!, ingredienttitle: "Biggs’Famous BBQ Suace"),
            
            Ingredient(ingredientImage: UIImage(named: "bbq2") ?? UIImage(systemName: "photo")!, ingredienttitle: "Kinder’s Organic mild BBQ Sauce"),
            
            Ingredient(ingredientImage: UIImage(named: "bbq3") ?? UIImage(systemName: "photo")!, ingredienttitle: "Biggs’ Famous BBQ Suace"),
            
            Ingredient(ingredientImage: UIImage(named: "bbq4") ?? UIImage(systemName: "photo")!, ingredienttitle: "Kinder’s Organic mild BBQ Sauce"),
            
            Ingredient(ingredientImage: UIImage(named: "bbq1") ?? UIImage(systemName: "photo")!, ingredienttitle: "Biggs’Famous BBQ Suace"),
            
            Ingredient(ingredientImage: UIImage(named: "bbq2") ?? UIImage(systemName: "photo")!, ingredienttitle: "Kinder’s Organic mild BBQ Sauce"),
            
            Ingredient(ingredientImage: UIImage(named: "bbq3") ?? UIImage(systemName: "photo")!, ingredienttitle: "Biggs’ Famous BBQ Suace"),
            
            Ingredient(ingredientImage: UIImage(named: "bbq4") ?? UIImage(systemName: "photo")!, ingredienttitle: "Kinder’s Organic mild BBQ Sauce"),
            
            Ingredient(ingredientImage: UIImage(named: "bbq1") ?? UIImage(systemName: "photo")!, ingredienttitle: "Biggs’Famous BBQ Suace"),
            
            Ingredient(ingredientImage: UIImage(named: "bbq2") ?? UIImage(systemName: "photo")!, ingredienttitle: "Kinder’s Organic mild BBQ Sauce"),
            
            Ingredient(ingredientImage: UIImage(named: "bbq3") ?? UIImage(systemName: "photo")!, ingredienttitle: "Biggs’ Famous BBQ Suace"),
            
            Ingredient(ingredientImage: UIImage(named: "bbq4") ?? UIImage(systemName: "photo")!, ingredienttitle: "Kinder’s Organic mild BBQ Sauce")

        ]
        
    }
    
    
}
