//
//  IngredientsTableViewCell.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/18.
//

import UIKit

class IngredientsTableViewCell: UITableViewCell , Reusable{
    
    enum BtnStyle {
        case add, delete
    }
    
    @IBOutlet weak var ingredientImage : UIImageView!
    @IBOutlet weak var ingredientName : UILabel!
    @IBOutlet weak var addBtn : UIButton!
    
    var index : Int!
    var delegate : ButtonTapedDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    public func buttonStyleConfigure(style:BtnStyle) {
        addBtn.tintColor = #colorLiteral(red: 0.7176470588, green: 0.7176470588, blue: 0.7176470588, alpha: 1)
        addBtn.setTitle("", for: .normal)
        addBtn.layer.cornerRadius = addBtn.frame.height * 0.25
        addBtn.setBackgroundColor(color: Color.tfBackgroundColor, forState: .normal)

        switch style {
        case .add:
            addBtn.setTitle("   Added to list  ", for: .selected)
            addBtn.setImage(UIImage(named: "add"), for: .normal)
            addBtn.setImage(UIImage(), for: .selected)
            addBtn.setTitleColor(Color.mainOrange, for: .selected)
            addBtn.setBackgroundColor(color: Color.lightOrange, forState: .selected)

        case .delete:
            addBtn.setImage(UIImage(named: "trash"), for: .normal)
            
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func configure(_ model: Ingredient, index: Int){
        self.index = index
        ingredientImage.image = model.ingredientImage
        ingredientName.text = model.ingredienttitle
    }
    
    @IBAction func addBtnTapped(_ sender: UIButton) {
        self.addBtn.isSelected.toggle()
        delegate?.cellBtnTapped(index: index)
    }
}


