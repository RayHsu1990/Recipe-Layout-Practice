//
//  ComposeMealVC.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/17.
//

import UIKit

class ComposeMealVC: UIViewController {
    
    private lazy var baseView : ViewForComposeVC = {
        ViewForComposeVC()
    }()
    
    override func loadView() {
        super.loadView()
        self.view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "COMPOSE YOUR MEAL"
        baseView.searchView.btn.addTarget(self,
                                          action: #selector(searchBtnTapped),
                                          for: .touchUpInside)
        baseView.scanView.btn.addTarget(self,
                                        action: #selector(searchBtnTapped),
                                        for: .touchUpInside)
        baseView.collectionView.delegate = self
        baseView.collectionView.dataSource = self
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = self
        baseView.searchView.serchTextfield.delegate = self
        
    }
    
    
    @objc func searchBtnTapped (_ sender: UIButton){
        baseView.stackView.subviews.last?.isHidden.toggle()
        baseView.tableView.isHidden.toggle()
        baseView.collectionView.isHidden.toggle()

        UIViewPropertyAnimator(duration: 0.2, curve: .easeInOut) {
            self.baseView.layoutIfNeeded()
        }.startAnimation()

    }

    

    
}

extension ComposeMealVC : UITableViewDelegate{
    
}

extension ComposeMealVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
}

extension ComposeMealVC : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
}


extension ComposeMealVC : UICollectionViewDelegate {
    
}
extension ComposeMealVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = baseView.collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    
}
extension ComposeMealVC : UICollectionViewDelegateFlowLayout {
}



