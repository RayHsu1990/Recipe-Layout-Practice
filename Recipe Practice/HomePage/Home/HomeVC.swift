//
//  ViewController.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/15.
//

import UIKit



class HomeVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tabBar : CustomTabbar!
    
    var largeContents : [Content] = Content.getLargeContents()
    var smallContents : [Content] = Content.getSmallContents()
    var mediumContents : [Content] = Content.getMediumContents()
    
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionSetting()
        
    }
    
    
    private func collectionSetting(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(LargCollectionViewCellVC.nib(),
                                forCellWithReuseIdentifier: LargCollectionViewCellVC.id)
        collectionView.register(SmallCollectionViewCell.nib(),
                                forCellWithReuseIdentifier: SmallCollectionViewCell.id)
        collectionView.register(MediumCollectionViewCell.nib(),
                                forCellWithReuseIdentifier: MediumCollectionViewCell.id)

    }
    
    
}

//MARK:- CollectionView
extension HomeVC : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 2,indexPath.item == 0{
            navigationController?.pushViewController(ComposeMealVC(), animated: true)

        }
    }
    
}
extension HomeVC : UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let section = MainPageContentStyle(rawValue: indexPath.section) else { return CGSize() }
        switch section {
        
        case .largeContent:
            return CGSize(width: view.frame.width, height: 228)
        case .smallContent:
            return CGSize(width: view.frame.width - 10 , height: 275)
        case .mediumContent:
            return CGSize(width: view.frame.width - 40 , height: 200)
        case .recipeWithRate:
            return CGSize()
        }
    }
    
}

extension HomeVC : UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let section = MainPageContentStyle(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }
        
        switch section {
        case .largeContent:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: LargCollectionViewCellVC.id,
                for: indexPath) as! LargCollectionViewCellVC
            
            cell.configure(contents: largeContents)
            
            return cell
            
        case .smallContent:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SmallCollectionViewCell.id,
                for: indexPath) as! SmallCollectionViewCell
            
            cell.configure(contents: smallContents)
            
            return cell
        case .mediumContent:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MediumCollectionViewCell.id,
                for: indexPath) as! MediumCollectionViewCell
            
            cell.configure(model: mediumContents.first!)
            
            cell.delegate = self
            
            return cell
        case .recipeWithRate:
            return UICollectionViewCell()
        }

    }
    
    
}
extension HomeVC : PagingDelegate{
    func changePage(vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}




