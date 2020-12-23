//
//  ScanVC.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/21.
//

import UIKit

class ScanVC: UIViewController {
    
    private var baseView = ViewForScan()
    
    private var searchedIngredient: [Ingredient] = Ingredient.getSimilarProduct()

    
    
    override func loadView() {
        super.loadView()
        view = baseView
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "SCANED PRODUCT"
        baseView.collectionView.delegate = self
        baseView.collectionView.dataSource = self

    }
    

}

extension ScanVC : UICollectionViewDelegate{
    
}
extension ScanVC : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        searchedIngredient.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = baseView.collectionView.dequeueReusableCell(withReuseIdentifier: IngredientCollectionViewCell.id, for: indexPath) as! IngredientCollectionViewCell
        cell.configurr(searchedIngredient[indexPath.item])
        return cell
    }

    
}

