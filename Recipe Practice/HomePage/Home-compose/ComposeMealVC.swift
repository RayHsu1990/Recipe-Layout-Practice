//
//  ComposeMealVC.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/17.
//

import UIKit

class ComposeMealVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        let view = CustomView(style: .search,
                              frame: CGRect(x: 10,
                                            y: self.view.center.y,
                                            width: self.view.frame.width - 20,
                                            height: 50))
        
        self.view.addSubview(view)
//        view.btn.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
    }
    
}
