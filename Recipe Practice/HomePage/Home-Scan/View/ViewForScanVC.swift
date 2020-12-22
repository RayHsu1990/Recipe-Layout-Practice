//
//  ViewForScanVC.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/21.
//

import UIKit


class ViewForScan : UIView {
    
    //MARK:- init
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        backgroundViewSetting()
        imgaeViewSetting()
        titleSetting()
        typeLabelSetting()
        seperatorSetting()
        collectionViewHeaderSetting()
        collectionViewSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK:- properties
    
    var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 82,
                                 height: 170)
        layout.sectionInset = UIEdgeInsets(top: 0,
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
    
    var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.lightOrange
        view.layer.cornerRadius = 100
        return view
        
    }()
    
    var productImage : UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    var productTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "HEINZ BBQ Sauce Smokey"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    var productTypeLabel : UILabel = {
        let label = EdgeInsetLabel()
        label.text = "BBQ Sauce"
        label.textInsets = UIEdgeInsets(top: 7, left: 10, bottom: 7, right: 10)
        label.font = UIFont.systemFont(ofSize: 9)
        label.textAlignment = .center
        label.textColor = Color.mainOrange
        label.backgroundColor = Color.lightOrange
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    var seperatorView : UIView = {
       let seperateView = UIView()
        seperateView.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
        return seperateView
    }()
    
    var collectionHeader : UILabel = {
        let label = UILabel()
        label.text = "Similar products"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .left
        label.textColor = .black

        return label
    }()
    
    
    //MARK:- layout setting func
    
    private func backgroundViewSetting(){
        addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        backgroundView.heightAnchor.constraint(equalToConstant: 300).isActive = true

    }
    private func imgaeViewSetting(){
        addSubview(productImage)
        
        productImage.image = UIImage(named: "heinzBBQSauce")
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        productImage.heightAnchor.constraint(equalToConstant: 240).isActive = true
        productImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

    }
    
    private func titleSetting(){
        addSubview(productTitleLabel)
        productTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        productTitleLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 20).isActive = true
        productTitleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        productTitleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        productTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func typeLabelSetting(){
        
        addSubview(productTypeLabel)
        productTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        productTypeLabel.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor, constant: 12).isActive = true
        productTypeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        productTypeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

    }
    
    private func seperatorSetting(){
        addSubview(seperatorView)
        seperatorView.translatesAutoresizingMaskIntoConstraints = false
        seperatorView.topAnchor.constraint(equalTo: productTypeLabel.bottomAnchor, constant: 20).isActive = true
        seperatorView.leftAnchor.constraint(equalTo: leftAnchor,constant: 20).isActive = true
        seperatorView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        seperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true

    }
    
    private func collectionViewHeaderSetting() {
        addSubview(collectionHeader)
        collectionHeader.translatesAutoresizingMaskIntoConstraints = false
        collectionHeader.topAnchor.constraint(equalTo: seperatorView.bottomAnchor , constant: 20).isActive = true
        collectionHeader.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        collectionHeader.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        
    }
    
    private func collectionViewSetting() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: collectionHeader.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 180).isActive = true

    }
    
}

