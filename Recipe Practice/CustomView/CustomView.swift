//
//  CustomBtn.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/17.
//

import UIKit
enum CustomViewStyle {
    case search
    case scan
}

class CustomView : UIView {
    
    lazy var serchTextfield: UITextField = {
        let tf = UITextField()
        
        return tf
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton()
        
        return btn
    }()
    
    init(style: CustomViewStyle, frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .yellow
        self.layer.cornerRadius = 15
        switch style {
        case .search:
            addSubview(serchTextfield)
            addSubview(btn)
            btn.backgroundColor = .brown
            btn.setImage(UIImage(named: "shape"), for: .normal)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
            btn.topAnchor.constraint(equalTo: topAnchor).isActive = true
            btn.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
            btn.widthAnchor.constraint(equalTo: heightAnchor).isActive = true
            btn.layer.cornerRadius = 15
            
            serchTextfield.translatesAutoresizingMaskIntoConstraints = false
            serchTextfield.topAnchor.constraint(equalTo: topAnchor).isActive = true
            serchTextfield.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            serchTextfield.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
            serchTextfield.rightAnchor.constraint(equalTo: btn.leftAnchor).isActive = true


            
            
            
        case .scan:
            break
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

