//
//  ViewController.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/15.
//

import UIKit

class MainVC: UIViewController{

    @IBOutlet weak var tapBar: UITabBar!
    @IBOutlet weak var searchBtn : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBtn.layer.cornerRadius = searchBtn.frame.height / 4
        tapBar.unselectedItemTintColor = Color.mainOrange
        tapBar.delegate = self
        
    }


}

extension MainVC :UITabBarDelegate, UITabBarControllerDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("\(item.tag)")
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
    
}

