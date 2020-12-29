//
//  IngredientCollectionViewCell.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/19.
//

import UIKit

class IngredientCollectionViewCell: UICollectionViewCell, Reusable {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var ingredientImage: UIImageView!
    @IBOutlet weak var ingredientTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.backgroundColor = Color.tfBackgroundColor
        view.layer.cornerRadius = 15
    }

    
    func configurr(_ model: Ingredient){
        ingredientImage.image = model.ingredientImage
        ingredientTitle.text = model.ingredienttitle
    }
}
