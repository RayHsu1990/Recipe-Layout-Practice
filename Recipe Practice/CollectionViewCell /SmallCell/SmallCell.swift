//
//  SmallCell.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/17.
//

import UIKit

class SmallCell: UICollectionViewCell {
    static let id = "SmallCell"
    static func nib()-> UINib{ UINib(nibName: "SmallCell", bundle: nil)}
    
    @IBOutlet weak var contentImage : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var bottomView : UIView!
    @IBOutlet weak var topView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        contentView.layer.cornerRadius = 30
        bottomView.layer.cornerRadius = 30
        topView.layer.cornerRadius = 30
        topView.layer.shadowOffset = CGSize(width: 0, height: 30)
        topView.layer.shadowOpacity = 0.8
        topView.layer.shadowRadius = 40
        topView.layer.shadowColor = CGColor(red:     0,
                                    green:   0,
                                    blue:    0,
                                    alpha:   1)
    }
    
    func configure(model: Content) {
        contentImage.image = model.contentImage
        titleLabel.text = model.type
    }
    
}
