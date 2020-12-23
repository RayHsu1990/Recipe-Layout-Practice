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
    
    
//    let fullHatImage = UIImageView(image: UIImage(named: "hatfull")!)
    let fullHatImage : UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 11, height: 9))
        imageView.image = UIImage(named: "hatfull")!
        return imageView
    }()

    let emptyHatImage : UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 11, height: 9))
        imageView.image = UIImage(named: "hatempty")!
        return imageView
    }()

//    let emptyHatImage = UIImageView(image: UIImage(named: "hatempty")!)


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
        hatRateLabel.text = "\(model.hatFloat)"
        starImage.image = model.difficaulty.image
        difficalityLabel.text = model.difficaulty.capStr
        
        addHat(count: model.hatRate)
        print(hatStackView.subviews)
    }
    
    private func btnSetting(){
        checkRecipeBtn.layer.cornerRadius = checkRecipeBtn.frame.height * 0.25
        rectangleBtn.layer.cornerRadius = rectangleBtn.frame.height * 0.25
        shareBtn.layer.cornerRadius = shareBtn.frame.height * 0.25

    }
    
    private func addHat(count:Int){
        let fullHats = Array(repeating: fullHatImage, count: count)
        let emptyHats = Array(repeating: emptyHatImage, count: 5 - count )

        let imageViews = [fullHats, emptyHats].flatMap{$0}
        print("-------------------------------\(imageViews.count)")

        for i in imageViews {
            hatStackView.addArrangedSubview(i)
        }
        print("==============\(hatStackView.subviews.count) ========")

    }


}
