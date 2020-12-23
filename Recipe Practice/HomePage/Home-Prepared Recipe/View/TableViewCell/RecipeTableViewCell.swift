//
//  RecipeTableViewCell.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/22.
//

import UIKit

class RecipeTableViewCell: UITableViewCell, Reusable {
    @IBOutlet weak var recipeImage : UIImageView!
    @IBOutlet weak var recipeName : UILabel!
    @IBOutlet weak var hatStackView: UIStackView!
    @IBOutlet weak var hatRateLabel: UILabel!
    
    @IBOutlet weak var starImage : UIImageView!
    @IBOutlet weak var difficalityLabel : UILabel!
    @IBOutlet weak var cookTimeLabel : UILabel!
    
    @IBOutlet weak var checkRecipeBtn : UIButton!
    @IBOutlet weak var rectangleBtn : UIButton!
    @IBOutlet weak var shareBtn : UIButton!
    

    @IBOutlet var hatImages: [UIImageView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnSetting()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    
    //MARK:- configure
    
    public func configure(model: Recipe){
        recipeImage.image = model.recipeImage
        recipeName.text = model.recipeName
        starImage.image = model.difficaulty.image
        difficalityLabel.text = model.difficaulty.capStr
        hatImageSetting(rate: model.hatRate)
        hatRateLabel.text = "\(model.hatFloat)"
        cookTimeLabel.text = cookTimeLabelSetting(time: model.cookTime)
        
    }
    
    private func btnSetting(){
        checkRecipeBtn.layer.cornerRadius = checkRecipeBtn.frame.height * 0.25
        rectangleBtn.layer.cornerRadius = rectangleBtn.frame.height * 0.25
        shareBtn.layer.cornerRadius = shareBtn.frame.height * 0.25

    }
    
    private func cookTimeLabelSetting(time: (Int,Int)) -> String{
        
        if time.0 <= 0 {
            return "\(time.1) m"
        }else if time.1 <= 0 {
            return "\(time.0) h"
        }else {
            return "\(time.0) h \(time.1) m"
        }
        
    }
    
    private func hatImageSetting(rate: Int){
        for i in 0...(rate - 1){
            hatImages[i].image = UIImage(named: "hatfull")
        }
    }


}

