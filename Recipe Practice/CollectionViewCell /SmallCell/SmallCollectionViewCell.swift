//
//  SmallCollectionViewCell.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/16.
//

import UIKit

class SmallCollectionViewCell: UICollectionViewCell {
    static let id = "SmallCollectionViewCell"
    static func nib() -> UINib { UINib(nibName: "SmallCollectionViewCell", bundle: nil) }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
