//
//  MediumCollectionViewCell.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/16.
//

import UIKit



struct Content {
    let contentImage: UIImage
    let type: String?
    let title: String?
    
    init(style:ContentStyle) {
        
        switch style {
        case .large(let image, let title, let type):
            self.contentImage = image
            self.type = type.rawValue
            self.title = title
        case .medium(let image, let title):
            self.contentImage = image
            self.type = nil
            self.title = title

        case .small(let image, let type):
            self.contentImage = image
            self.type = type.rawValue
            self.title = nil

        }
    }
}
enum ContentStyle {
    case large(_ image:UIImage, _ title:String, _ type: FoodType)
    case medium(_ image: UIImage, _ title: String)
    case small(_ image: UIImage, _ type: FoodType)
}


class MediumCollectionViewCell: UICollectionViewCell {
    static let id = "MediumCollectionViewCell"
    static func nib() -> UINib { UINib(nibName: "MediumCollectionViewCell", bundle: nil) }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public func configure(){
        
    }

}
