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
        baseView.headerView.popularBtn.addTarget(self, action: #selector(popularBtnTapped), for: .touchUpInside)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
        navigationItem.title = "PREPARED RECIPES"

    }
    
    @objc func popularBtnTapped (){
        baseView.headerView.nameBtn.isHidden.toggle()
        baseView.headerView.timeBtn.isHidden.toggle()
        baseView.headerView.stackView.backgroundColor = baseView.headerView.nameBtn.isHidden ? .clear : Color.tfBackgroundColor
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

