//
//  LargCollectionViewCellVC.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/16.
//

import UIKit

class LargCollectionViewCellVC: UICollectionViewCell {
    static let id = "LargCollectionViewCellVC"
    static func nib () -> UINib { UINib(nibName: "LargCollectionViewCellVC", bundle: nil)}
    
    @IBOutlet weak var collectionView : UICollectionView!
    var contents : [Content] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(LargeCollectionViewCell.nib(), forCellWithReuseIdentifier: LargeCollectionViewCell.id)
        
    }
    public func configure (contents: [Content]) {
        self.contents = contents
    }

}

extension LargCollectionViewCellVC : UICollectionViewDelegate {
    
}
extension LargCollectionViewCellVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 296, height: 180)
    }
}

extension LargCollectionViewCellVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LargeCollectionViewCell.id, for: indexPath) as! LargeCollectionViewCell
        cell.configure(contents[indexPath.row])
        return cell
    }
    

    
    
}


