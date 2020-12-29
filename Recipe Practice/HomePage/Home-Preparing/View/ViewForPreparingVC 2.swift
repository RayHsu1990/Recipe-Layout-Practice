//
//  ViewForPreparingVC.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/22.
//

import UIKit

class ViewForPreparingVC: UIView {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        backgroundViewSetting()
        imgaeViewSetting()
        progressBarSetting()
        titleLabelSetting()
        waitLabelSetting ()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- properties
    
    var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.lightOrange
        view.layer.cornerRadius = 100
        return view
    }()
    
    var productImage = UIImageView()

    
    var progressBar : UIProgressView = {
       let progressBar = UIProgressView()
        progressBar.progressViewStyle = .default
        progressBar.progressTintColor = Color.mainOrange
        progressBar.trackTintColor = Color.lightOrange
        progressBar.progress = 0.5
        progressBar.layer.cornerRadius = 10
        progressBar.layer.masksToBounds = true
        return progressBar
    }()
    
    var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Looking for your recipes"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.textColor = Color.mainOrange
        return label
    }()
    
    var waitLabel : UILabel = {
        let label = UILabel()
        label.text = "Please wait a moment..."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        return label
    }()

    
    
    //MARK:- layout func
    
    private func backgroundViewSetting(){
        addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.topAnchor.constraint(equalTo: topAnchor,constant: -100).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        backgroundView.heightAnchor.constraint(equalToConstant: 400).isActive = true

    }
    
    private func imgaeViewSetting(){
        addSubview(productImage)
        
        productImage.image = UIImage(named: "sandfilter")
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        productImage.heightAnchor.constraint(equalToConstant: 180).isActive = true
        productImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

    }
    
    private func progressBarSetting(){
        addSubview(progressBar)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 80).isActive = true
        progressBar.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        progressBar.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        progressBar.heightAnchor.constraint(equalToConstant: 20).isActive = true

    }
    
    private func titleLabelSetting(){
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 30).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true

    }
    
    private func waitLabelSetting (){
        addSubview(waitLabel)
        waitLabel.translatesAutoresizingMaskIntoConstraints = false
        waitLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        waitLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        waitLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        waitLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

    }

}
