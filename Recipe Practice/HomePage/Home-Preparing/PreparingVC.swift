//
//  PreparingVC.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/22.
//

import UIKit

class PreparingVC: UIViewController {
    var baseView: ViewForPreparingVC!
    
    var state : Float = 0.0
    var timer: Timer!
    
    
    override func loadView() {
        super.loadView()
        baseView = ViewForPreparingVC()
        view = baseView
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
        navigationItem.title = "PREPARING RECIPES"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(progressing), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @objc func progressing() {
        if state < 1.1 {
            baseView.progressBar.progress = state
            state += 0.1
        }else{
            timer.invalidate()
            
            
            navigationController?.pushViewController(PreparedRecipeVC(), animated: true)
            
        }
        
        
    }
    
    
}
