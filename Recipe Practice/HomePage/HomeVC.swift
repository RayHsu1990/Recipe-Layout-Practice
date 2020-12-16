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
        collectionView.register(LargCollectionViewCellVC.nib(), forCellWithReuseIdentifier: LargCollectionViewCellVC.id)
    }
    
    
}
extension HomeVC : UICollectionViewDelegate{
    
}
extension HomeVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let section = MainPageContentStyle(rawValue: indexPath.section) else { return CGSize() }
        switch section {
        
        case .largeContent:
            return CGSize(width: view.frame.width, height: 228)
        case .smallContent:
            return CGSize()
        case .mediumContent:
            return CGSize()
        case .recipeWithRate:
            return CGSize()
        }
    }
    
}

extension HomeVC : UICollectionViewDataSource {
    
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        2
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let section = MainPageContentStyle(rawValue: section) else { return 0 }

        switch section {
        case .largeContent:
            return 1
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LargCollectionViewCellVC.id, for: indexPath) as! LargCollectionViewCellVC
            cell.configure(content: largeContents)
            return cell
            
        case .smallContent:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LargCollectionViewCellVC.id, for: indexPath) as! LargCollectionViewCellVC
            cell.configure(content: largeContents)
            return cell
        case .mediumContent:
            return UICollectionViewCell()
        case .recipeWithRate:
            return UICollectionViewCell()
        }

    }
    
    
}




