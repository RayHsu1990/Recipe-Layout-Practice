//
//  LargeCollectionViewCell.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/16.
//

import UIKit

class LargeCollectionViewCell: UICollectionViewCell, Reusable {
    
    @IBOutlet weak var contentImage : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var typeLabel : UILabel!

    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
    }
    
    public func configure(_ model: Content){
        contentImage.image = model.contentImage
        typeLabel.text = model.type
        titleLabel.text = model.title
    }

}
