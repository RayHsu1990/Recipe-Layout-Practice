//
//  PreparedRecipeVC.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/22.
//

import UIKit


class PreparedRecipeVC: UIViewController {
    
    var baseView = ViewForPreparedVC()
    
    var recipes : [Recipe] = Recipe.getRecipes()
    
    override func loadView() {
        super.loadView()
        view = baseView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = self

    }
    


}

extension PreparedRecipeVC : UITableViewDelegate{
    
}

extension PreparedRecipeVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeTableViewCell.id, for: indexPath) as! RecipeTableViewCell
        cell.configure(model: recipes[indexPath.row])
        return cell
    }
    
    
}

