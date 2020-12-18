//
//  SmallCell.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/17.
//

import UIKit

class SmallCell: UICollectionViewCell, Reusable {
//    
    @IBOutlet weak var contentImage : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var bottomView : UIView!
    @IBOutlet weak var topView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clipsToBounds = false
        contentView.clipsToBounds = false
        
        topView.layer.cornerRadius = 10
        topView.layer.masksToBounds = true
        bottomView.layer.cornerRadius = 10
        bottomView.layer.masksToBounds = false
        bottomView.layer.shadowOffset = CGSize(width: 0, height: 5)
        bottomView.layer.shadowOpacity = 0.5
        bottomView.layer.shadowRadius = 4
        bottomView.layer.shadowColor = CGColor(red:     0,
                                               green:   0,
                                               blue:    0,
                                               alpha:   1)
    }
    
    func configure(model: Content) {
        contentImage.image = model.contentImage
        titleLabel.text = model.type
    }
    
}
