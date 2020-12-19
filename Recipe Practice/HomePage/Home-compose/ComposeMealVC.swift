//
//  ComposeMealVC.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/17.
//

import UIKit

class ComposeMealVC: UIViewController {
    
    private var baseView = ViewForComposeVC()
    
    //tableview model
    private var ingredients: [Ingredient] = Ingredient.getIngredients()
    
    private var searchedIngredient: [Ingredient] = Ingredient.getSearchedIngrents()
    
    
    
    //MARK:- LifeCycle
    
        override func loadView() {
        super.loadView()
        self.view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "COMPOSE YOUR MEAL"
        baseView.searchView.btn.addTarget(self,
                                          action: #selector(searchBtnTapped),
                                          for: .touchUpInside)
        baseView.scanView.btn.addTarget(self,
                                        action: #selector(scanBtnTapped),
                                        for: .touchUpInside)
        baseView.collectionView.delegate = self
        baseView.collectionView.dataSource = self
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = self
        baseView.searchView.serchTextfield.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: baseView.countView )


        
    }
    
    //MARK:- func
    @objc func searchBtnTapped (_ sender: UIButton){
        baseView.stackView.subviews.last?.isHidden.toggle()
        baseView.tableView.isHidden.toggle()
        baseView.collectionView.isHidden.toggle()
        baseView.countView.isHidden.toggle()
        
        UIViewPropertyAnimator(duration: 0.3, curve: .linear) {
            self.baseView.layoutIfNeeded()
            self.baseView.checklistBtn.isHidden.toggle()
        }.startAnimation()

    }
    
    @objc func scanBtnTapped(_ sender: UIButton){
        
    }

    

    
}
//MARK:- Tableview Delegate + DataSource
extension ComposeMealVC : UITableViewDelegate{
}

extension ComposeMealVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IngredientsTableViewCell.id, for: indexPath) as! IngredientsTableViewCell
        
        cell.configure(ingredients[indexPath.row])
        return cell
    }
    
    
}

//MARK:- Collectionview Delegate + DataSource


extension ComposeMealVC : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
}


extension ComposeMealVC : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: 1, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reusableHeader = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader
            , withReuseIdentifier: ReuseCollectionViewHeader.id
            , for: indexPath) as! ReuseCollectionViewHeader
        reusableHeader.configure()
        
        return reusableHeader
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        searchedIngredient.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = baseView.collectionView.dequeueReusableCell(withReuseIdentifier: IngredientCollectionViewCell.id, for: indexPath) as! IngredientCollectionViewCell
        cell.configurr(searchedIngredient[indexPath.item])
        return cell
    }
    
    
}

//MARK:- Textfield Delegate
extension ComposeMealVC : UICollectionViewDelegateFlowLayout {
}



