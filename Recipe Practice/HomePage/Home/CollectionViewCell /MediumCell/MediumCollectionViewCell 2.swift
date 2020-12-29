//
//  MediumCollectionViewCell.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/16.
//

import UIKit



class MediumCollectionViewCell: UICollectionViewCell, Reusable {
    
    @IBOutlet weak var contentImage : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var composeBtn : UIButton!
    
    var delegate : PagingDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        backgroundColor = Color.mainOrange
        composeBtn.layer.cornerRadius = composeBtn.frame.height / 2
        composeBtn.setTitle("Compose meal!", for: .normal)
        composeBtn.layer.borderWidth = 2
        composeBtn.layer.borderColor = CGColor(red: 1,
                                               green: 1,
                                               blue: 1,
                                               alpha: 0.8)
        
    }
    
    public func configure(model: Content){
        contentImage.image = model.contentImage
        titleLabel.text = model.title
        
    }
    @IBAction func coppseBtnTapped(_ sender : UIButton) {
        let vc = ComposeMealVC()
        delegate?.changePage(vc: vc)
    }

}

