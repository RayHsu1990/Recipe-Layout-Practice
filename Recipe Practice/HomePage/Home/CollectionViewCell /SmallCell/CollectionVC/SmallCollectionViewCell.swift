//
//  SmallCollectionViewCell.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/16.
//

import UIKit

class SmallCollectionViewCell: UICollectionViewCell, Reusable {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var contents: [Content]!

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SmallCell.nib(), forCellWithReuseIdentifier: SmallCell.id)
    }
    
    public func configure(contents: [Content]) {
        self.contents = contents
    }

}


extension SmallCollectionViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SmallCell.id, for: indexPath) as! SmallCell
        cell.configure(model: contents[indexPath.item])
        return cell
    }
    
    
}

