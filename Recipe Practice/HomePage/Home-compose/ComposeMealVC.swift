//
//  ComposeMealVC.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/17.
//

import UIKit

class ComposeMealVC: UIViewController {
    
    private var baseView : ViewForComposeVC!
    
    //tableview model
    private var ingredients: [Ingredient] = Ingredient.getIngredients()
    
    //collectionview model
    private var searchedIngredient: [Ingredient] = Ingredient.getSearchedIngrents()
    
//    var chosenIngredients: [Ingredient] = []{
//        didSet{
//            baseView.countView.btn.setTitle("\(chosenIngredients.count)", for: .normal)
//        }
//    }
    
    var chosenIngredients: [Ingredient] {
        ingredients.filter({$0.isSelected})
    }

    
    //MARK:- LifeCycle
    
    override func loadView() {
        super.loadView()
        baseView = ViewForComposeVC()
        view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "COMPOSE YOUR MEAL"
        navigationItem.backButtonTitle = ""
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: baseView.countView )
        viewSetting()
    }
    
    //MARK:- func
    
    private func viewSetting(){
        baseView.searchView.btn.addTarget(self,
                                          action: #selector(searchBtnTapped),
                                          for: .touchUpInside)
        baseView.scanView.btn.addTarget(self,
                                        action: #selector(scanBtnTapped),
                                        for: .touchUpInside)
        baseView.checklistBtnView.btn.addTarget(self,
                                                action: #selector(checkListBtnTapped) ,
                                                for: .touchUpInside)
        baseView.countView.btn.addTarget(self,
                                         action: #selector(checkListBtnTapped) ,
                                         for: .touchUpInside)
        
        baseView.collectionView.delegate = self
        baseView.collectionView.dataSource = self
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = self
        baseView.searchView.serchTextfield.delegate = self
        

    }
    
    @objc func checkListBtnTapped (_ sender: UIButton){
        navigationController?.pushViewController(IngredientListVC(ingredients: chosenIngredients),
                                                 animated: true)
    }
    
    @objc func searchBtnTapped (_ sender: UIButton){
        baseView.stackView.subviews.last?.isHidden.toggle()
        baseView.tableView.isHidden.toggle()
        baseView.collectionView.isHidden.toggle()
        baseView.countView.isHidden.toggle()
        
        UIViewPropertyAnimator(duration: 0.3, curve: .linear) {
            self.baseView.layoutIfNeeded()
            self.baseView.checklistBtnView.isHidden.toggle()
        }.startAnimation()

    }
    
    @objc func scanBtnTapped(_ sender: UIButton){
        navigationController?.pushViewController(ScanVC(),
                                                 animated: true)

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
        
        cell.configure(ingredients[indexPath.row], index: indexPath.row)
        cell.buttonStyleConfigure(style: .add)
        cell.delegate = self

        return cell
    }
    
    
}

//MARK:- Collectionview Delegate + DataSource


extension ComposeMealVC : UICollectionViewDelegate {
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
extension ComposeMealVC : UITextFieldDelegate {
}


//MARK:- Cell Button Delegate
extension ComposeMealVC : ButtonTapedDelegate {
    func cellBtnTapped(index: Int) {
        
        ingredients[index].isSelected.toggle()
        baseView.tableView.reloadData()
        baseView.countView.btn.setTitle("\(chosenIngredients.count)", for: .normal)
//        if add {
//            chosenIngredients.append(ingredients[index])
//        }else{
////            chosenIngredients.remove(at: index)
//            let ingredient = ingredients[index]
//            if let index = chosenIngredients.firstIndex(where: {$0.ingredienttitle == ingredient.ingredienttitle}) {
//                chosenIngredients.remove(at: index)
//            }
//        }
    }
    
}



