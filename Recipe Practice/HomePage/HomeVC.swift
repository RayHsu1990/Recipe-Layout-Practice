//
//  ViewController.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/15.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var largeContents = [
        Content(style: .large(UIImage(named: "bitmap1")!, "Soup with cooked mushroms", .soup)),
        Content(style: .large(UIImage(named: "bitmap1")!, "Soup with cooked mushroms", .soup)),
        Content(style: .large(UIImage(named: "bitmap1")!, "Soup with cooked mushroms", .soup))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionSetting()
    }
    
    
    private func collectionSetting(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(LargeCollectionViewCell.nib(), forCellWithReuseIdentifier: LargeCollectionViewCell.id)
        collectionView.register(MediumCollectionViewCell.nib(), forCellWithReuseIdentifier: MediumCollectionViewCell.id)
        collectionView.register(SmallCollectionViewCell.nib(), forCellWithReuseIdentifier: SmallCollectionViewCell.id)
    }
    
    
}
extension HomeVC : UICollectionViewDelegate{
    
}
extension HomeVC : UICollectionViewDelegateFlowLayout {
}

extension HomeVC : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let section = MainPageContentStyle(rawValue: section) else { return 0 }
        
        switch section {
        case .largeContent:
            return largeContents.count
        case .smallContent:
            return 0
        case .mediumContent:
            return 0
        case .recipeWithRate:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let section = MainPageContentStyle(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }
        
        switch section {
        case .largeContent:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LargeCollectionViewCell.id, for: indexPath) as! LargeCollectionViewCell
            cell.configure(largeContents[indexPath.row])
            return cell
        case .smallContent:
            return UICollectionViewCell()
        case .mediumContent:
            return UICollectionViewCell()
        case .recipeWithRate:
            return UICollectionViewCell()
        }

    }
    
    
}




