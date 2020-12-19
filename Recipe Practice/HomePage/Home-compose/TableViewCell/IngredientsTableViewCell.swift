//
//  IngredientsTableViewCell.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/18.
//

import UIKit

class IngredientsTableViewCell: UITableViewCell , Reusable{
    
    @IBOutlet weak var ingredientImage : UIImageView!
    @IBOutlet weak var ingredientName : UILabel!
    @IBOutlet weak var addBtn : UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        addBtn.setTitle("", for: .normal)
        addBtn.setTitle("   Added to list  ", for: .selected)
        addBtn.setImage(UIImage(named: "add"), for: .normal)
        addBtn.setImage(UIImage(), for: .selected)
        addBtn.tintColor = #colorLiteral(red: 0.7176470588, green: 0.7176470588, blue: 0.7176470588, alpha: 1)
        addBtn.setTitleColor(Color.mainOrange, for: .selected)
        addBtn.setBackgroundColor(color: Color.lightOrange, forState: .selected)
        addBtn.setBackgroundColor(color: Color.tfBackgroundColor, forState: .normal)
        addBtn.layer.cornerRadius = addBtn.frame.height * 0.25

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func configure(_ model: Ingredient){
        ingredientImage.image = model.ingredientImage
        ingredientName.text = model.ingredienttitle
    }
    
    @IBAction func addBtnTapped(_ sender: UIButton) {
        self.addBtn.isSelected.toggle()

    }
}


