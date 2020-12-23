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
        headerViewSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.separatorStyle = .none
    }
    
    var tableView : UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        let header = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
        tableView.tableHeaderView = header
        tableView.register(RecipeTableViewCell.nib(), forCellReuseIdentifier: RecipeTableViewCell.id)
        return tableView
    }()
    
    var headerView = HeaderView()
    

    
    //MARK:- setting func
    
    private func headerViewSetting(){
        addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 20).isActive = true
        headerView.leftAnchor.constraint(equalTo: tableView.leftAnchor).isActive = true
        headerView.rightAnchor.constraint(equalTo: tableView.rightAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func tableViewSetting(){
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true

    }
    
}


class HeaderView : UIView{
    
    init() {
        super.init(frame: .zero)
        resultLabelSetting()
        rightViewSetting()
        sortLabelSetting()
        stackViewSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    var resultLabel = UILabel()
    
    var rightView = UIView()
    
    var sortByLabel = UILabel()
    
    var popularBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("Popular", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        btn.titleLabel?.textAlignment = .left
        btn.setTitleColor(Color.mainOrange, for: .normal)
        return btn
    }()
    
    var nameBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("name", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        btn.titleLabel?.textAlignment = .left
        btn.isHidden = true

        btn.setTitleColor(Color.mainOrange, for: .normal)
        return btn
    }()
    
    var timeBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("time", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        btn.titleLabel?.textAlignment = .left
        btn.isHidden = true
        btn.setTitleColor(Color.mainOrange, for: .normal)
        return btn
    }()
    
    var hideBtn : UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    lazy var stackView : UIStackView={
        let stackview = UIStackView(arrangedSubviews: [popularBtn, nameBtn, timeBtn])
        stackview.layer.cornerRadius = 8
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.spacing = 30
        stackview.distribution = .fill
        return stackview
    }()
    
    
    
    
    private func resultLabelSetting(){
        addSubview(resultLabel)
        resultLabel.text = "Results: 14 recipes"
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        resultLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        resultLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        resultLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true

    }
    
    private func rightViewSetting(){
        addSubview(rightView)
        rightView.backgroundColor = Color.tfBackgroundColor
        rightView.layer.cornerRadius = 10
        rightView.translatesAutoresizingMaskIntoConstraints = false
        rightView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        rightView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        rightView.widthAnchor.constraint(equalToConstant: 146).isActive = true
        rightView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
 
    }
    
    private func sortLabelSetting(){
        sortByLabel.text = "Sort by:"
        sortByLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        sortByLabel.textAlignment = .left
        rightView.addSubview(sortByLabel)
        
        sortByLabel.translatesAutoresizingMaskIntoConstraints = false
        sortByLabel.topAnchor.constraint(equalTo: rightView.topAnchor, constant: 0).isActive = true
        sortByLabel.leftAnchor.constraint(equalTo: rightView.leftAnchor, constant: 11).isActive = true
//        sortByLabel.widthAnchor.constraint(equalToConstant: 45).isActive = true
        sortByLabel.bottomAnchor.constraint(equalTo: rightView.bottomAnchor, constant: 0).isActive = true
    }
    
    private func stackViewSetting(){
        rightView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: rightView.topAnchor, constant: 7).isActive = true
        stackView.leftAnchor.constraint(equalTo: sortByLabel.rightAnchor, constant: 5).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightView.rightAnchor, constant: -20).isActive = true

        

        
        popularBtn.heightAnchor.constraint(equalToConstant: 16).isActive = true
        timeBtn.heightAnchor.constraint(equalToConstant: 16).isActive = true
        nameBtn.heightAnchor.constraint(equalToConstant: 16).isActive = true

        
    }
    
    
    
}
