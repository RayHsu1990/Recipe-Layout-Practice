//
//  ViewForPreparedRecipe.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/22.
//

import UIKit


class ViewForPreparedVC: UIView {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        tableViewSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var tableView : UITableView = {
        let tableView = UITableView()
        
        tableView.register(RecipeTableViewCell.nib(), forCellReuseIdentifier: RecipeTableViewCell.id)
        return tableView
    }()
    
    
    
    //MARK:- setting func
    private func tableViewSetting(){
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true

    }
    
}
