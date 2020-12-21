//
//  IngredientListVC.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/20.
//

import UIKit

class IngredientListVC: UIViewController {
    
    var ingredients : [Ingredient] = []{
        didSet{
            baseView.countChanged(count: ingredients.count)
        }
    }
    
    private var baseView = ViewForIngredientListVC()

    
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    convenience init(ingredients: [Ingredient]){
        self.init()
        self.ingredients = ingredients
        
    }
    
    override func loadView() {
        super.loadView()
        view = baseView
        
        navigationItem.title = "COMPOSE YOUR MEAL"
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: baseView.countView )
        baseView.countChanged(count: ingredients.count)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = self

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    

}

extension IngredientListVC : UITableViewDelegate {
}

extension IngredientListVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IngredientsTableViewCell.id, for: indexPath) as! IngredientsTableViewCell
        cell.configure(ingredients[indexPath.row], index: indexPath.row)
        cell.buttonStyleConfigure(style: .delete)
        cell.delegate = self
        return cell
    }
    
    
}

extension IngredientListVC : ButtonTapedDelegate {
    func cellBtnTapped(index: Int) {
        ingredients.remove(at: index)
    }
    
    
}


protocol ButtonTapedDelegate {
    
    func cellBtnTapped (index:Int)
    
}
