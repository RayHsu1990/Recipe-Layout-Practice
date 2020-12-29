//
//  CustomTabbar.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/15.
//

import UIKit

class CustomTabbar: UITabBarController, Reusable {
    
    lazy var searchBtn : UIButton = {
        let searchBtn = UIButton(frame: CGRect(x: self.view.center.x - 29,
                                               y: self.view.frame.height - 205,
                                               width: 58,
                                               height: 58))
        searchBtn.layer.cornerRadius = searchBtn.frame.height / 4
        searchBtn.backgroundColor = Color.mainOrange
        //加陰影
        searchBtn.layer.shadowOffset = CGSize.init(width: 0, height: 10)
        searchBtn.layer.shadowOpacity = 1
        searchBtn.layer.shadowRadius = searchBtn.frame.height / 4
        searchBtn.layer.shadowColor = CGColor(red: 255/255,
                                              green: 198/255,
                                              blue: 144/255,
                                              alpha: 1)
        let image = UIImage(named: "shape")!
        searchBtn.setImage(image, for: .normal)
        
        return searchBtn
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchBtn)
        tabBar.unselectedItemTintColor = Color.mainOrange
        tabBar.tintColor = .red
    }
    

    

}
