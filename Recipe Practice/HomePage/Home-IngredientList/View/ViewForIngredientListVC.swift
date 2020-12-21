//
//  ViewForIngredientListVC.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/21.
//

import UIKit

class ViewForIngredientListVC: UIView {
    
    init(){
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        setTableView()
        setCheckBtn()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: tableview
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: -20)
        tableView.allowsSelection = false
        tableView.tableFooterView = footerView
        tableView.tableHeaderView = headerView
        tableView.register(IngredientsTableViewCell.nib(),
                           forCellReuseIdentifier: IngredientsTableViewCell.id)

        return tableView
    }()
    ///tableview header
    lazy var headerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        let label = UILabel()
        label.frame = view.frame
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "My ingredients"
        view.addSubview(label)
        
        return view
    }()
    
    ///tableview footer
    lazy var footerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: center.y, width: 374, height: 50))
        let button = UIButton(frame: view.bounds)
        button.setTitle("Add ingredient", for: .normal)
        button.setTitleColor(Color.mainOrange, for: .normal)
        view.addSubview(button)
        addSubview(view)
        
        view.addDashedBorder(bordercolor: Color.mainOrange)
        return view
    }()
    
    ///navigationItem rightItem
    var countView = CountView(isHidden: false)
    
    var searchRecipeBtn = CustomViewFactory.buildButtonView(
        buttonStyle: .btnWithLeftIcon(UIImage(named: "shape")!),
        title: "Search recipes",
        backgroundColor: Color.mainOrange,
        textColor: .systemBackground)



    
    //MARK:- layout func
    
    private func setTableView(){
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func setCheckBtn() {
        addSubview(searchRecipeBtn)
        searchRecipeBtn.translatesAutoresizingMaskIntoConstraints = false
        searchRecipeBtn.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        searchRecipeBtn.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        searchRecipeBtn.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        searchRecipeBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    public func countChanged (count:Int) {
        tableView.reloadData()
        countView.btn.setTitle("\(count)", for: .normal)
    }
    
    
}
