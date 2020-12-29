//
//  CollectionReusableHeader.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/19.
//

import UIKit

//MARK:- collectionview header

class ReuseCollectionViewHeader : UICollectionReusableView, Reusable {
    
    func configure(){
        let label = UILabel(frame: CGRect(x: 20,
                                          y: 0,
                                          width: 200,
                                          height: 40))
        label.textAlignment = .left
        label.text = "Last search"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .black

        self.addSubview(label)

    }
    
}
