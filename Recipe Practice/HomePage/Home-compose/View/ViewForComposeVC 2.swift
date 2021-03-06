//
//  View.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/18.
//

import UIKit


class ViewForComposeVC: UIView {
        
    //MARK:- init()
    init(){
        super.init(frame: .zero)
        self.backgroundColor = .systemBackground
        setTitleLabel()
        setStackView()
        setSeperator()
        setTableView()
        setCollectionView()
        setCheckBtn()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    //MARK:- Properties
    
    //MARK: tableview
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: -20)
        tableView.allowsSelection = false
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = headerView
        tableView.register(IngredientsTableViewCell.nib(),
                           forCellReuseIdentifier: IngredientsTableViewCell.id)

        return tableView
    }()
    //MARK: collectionview
    
    lazy var collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 82,
                                 height: 160)
        layout.sectionInset = UIEdgeInsets(top: 10,
                                           left: 20,
                                           bottom: 0,
                                           right: 0)
        layout.minimumLineSpacing = 20
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal

        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ReuseCollectionViewHeader.self,
                                  forSupplementaryViewOfKind:
                                    UICollectionView.elementKindSectionHeader,
                                  withReuseIdentifier: ReuseCollectionViewHeader.id)

        
        collectionView.register(IngredientCollectionViewCell.nib(),
                                forCellWithReuseIdentifier: IngredientCollectionViewCell.id)

        return collectionView
    }()
    
    lazy var headerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        let label = UILabel()
        label.frame = view.frame
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.text = "Results"
        view.addSubview(label)
        
        return view
    }()
    
    ///stackView (searchview + scanview)
    lazy var stackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [searchView, scanView])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 20
        
        return stackView
    }()
    
    ///section title
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        label.textAlignment = .left
        label.text = "Add ingredient"
        return label
    }()
    
    lazy var scanView = CustomViewFactory.buildButtonView(
        buttonStyle: .btnWithLeftIcon(UIImage(named: "barcode")!),
        title: "Scan EAN code",
        backgroundColor: Color.lightOrange,
        textColor: Color.mainOrange)
    
    lazy var seperatorView : UIView = {
       let seperateView = UIView()
        seperateView.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
        return seperateView
    }()

    var checklistBtnView = CustomViewFactory.buildButtonView(
        buttonStyle: .btnWithLeftIcon(UIImage(named: "list")!),
        title: "Check my list",
        backgroundColor: Color.mainOrange,
        textColor: .systemBackground)
    
    ///searchView with textfield
    var searchView = CustomViewFactory.buildTextFieldView()
    
    ///navigationItem rightItem
    var countView = CountView(isHidden: true)
    

    

    
    //MARK:- Properties setting function
    func setCollectionView(){
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: seperatorView.bottomAnchor, constant: 10).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 180).isActive = true

    }
    
    private func setTableView(){
        addSubview(tableView)
        tableView.isHidden = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: seperatorView.bottomAnchor, constant: 10).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func setStackView(){
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        searchView.translatesAutoresizingMaskIntoConstraints = false
        scanView.translatesAutoresizingMaskIntoConstraints = false
        searchView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        scanView.heightAnchor.constraint(equalToConstant: 50).isActive = true

    }
    
    private func setSeperator(){
        addSubview(seperatorView)
        seperatorView.translatesAutoresizingMaskIntoConstraints = false
        seperatorView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20).isActive = true
        seperatorView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        seperatorView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        seperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true

    }
    
    private func setTitleLabel(){
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    
    private func setCheckBtn() {
        addSubview(checklistBtnView)
        checklistBtnView.isHidden = true
        checklistBtnView.translatesAutoresizingMaskIntoConstraints = false
        checklistBtnView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        checklistBtnView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        checklistBtnView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        checklistBtnView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

}


class CountView : UIView {
    
    var btn = UIButton()
    
    init(isHidden: Bool){
        super.init(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        addSubview(btn)
        self.isHidden = isHidden
        btn.frame = frame
        layer.cornerRadius = 8
        backgroundColor = Color.lightOrange
        btn.setTitle("0", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        btn.titleLabel?.textAlignment = .center
        btn.setTitleColor(Color.mainOrange, for: .normal)
        btn.setTitleColor(.red, for: .highlighted)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

