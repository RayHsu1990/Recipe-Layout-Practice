//
//  LargeCollectionViewCell.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/16.
//

import UIKit

enum FoodType: String {
    case soup , noodle , rice , veg , meat
}

struct LargeCellContent {
    let contentImage : UIImage
    let title : String
    let type : FoodType
    
}

class LargeCollectionViewCell: UICollectionViewCell {
    static let id = "LargeCollectionViewCell"
    static func nib() -> UINib { UINib(nibName: "LargeCollectionViewCell", bundle: nil) }
    
    @IBOutlet weak var contentImage : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var typeLabel : UILabel!

    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
    }
    
    public func configure(_ model: Content){
//        let image = model.contentImage.scale(newWidth: self.contentView.bounds.width)
//        contentImage.image = image
        contentImage.image = model.contentImage
        typeLabel.text = model.type
        titleLabel.text = model.title
    }

}
