//
//  CustomBtn.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/17.
//

import UIKit


class CustomViewFactory : UIView {
    
    static func buildTextFieldView() -> CustomTextfieldView {
        return CustomTextfieldView()
    }
    
    static func buildButtonView(buttonStyle: CustomButtonStyle,title: String, backgroundColor: UIColor, textColor: UIColor) -> CustomButtonView {
        return CustomButtonView(buttonStyle: buttonStyle, title, backgroundColor, textColor)
    }
    
    enum CustomButtonStyle {
        case normal
        case btnWithLeftIcon (_ icon: UIImage)
    }
    
    
}


//MARK:- TextFieldView

final class CustomTextfieldView : CustomViewFactory {
    
    var serchTextfield = UITextField()
        
    var btn = UIButton()
    
    
    fileprivate init(){
        super.init(frame: CGRect(x: 0, y: 0, width: 350, height: 50))
        backgroundColor = Color.tfBackgroundColor
        layer.cornerRadius = 15
        btnSetting()
        tfSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func btnSetting(){
        addSubview(btn)
        btn.backgroundColor = Color.mainOrange
        btn.setImage(UIImage(named: "shape"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        btn.topAnchor.constraint(equalTo: topAnchor).isActive = true
        btn.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        btn.widthAnchor.constraint(equalTo: heightAnchor).isActive = true
        btn.layer.cornerRadius = 15
    }
     
    private func tfSetting(){
        addSubview(serchTextfield)
        serchTextfield.translatesAutoresizingMaskIntoConstraints = false
        serchTextfield.topAnchor.constraint(equalTo: topAnchor).isActive = true
        serchTextfield.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        serchTextfield.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        serchTextfield.rightAnchor.constraint(equalTo: btn.leftAnchor).isActive = true

    }
}

//MARK:- ButtonView

final class CustomButtonView : CustomViewFactory {
    
    var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
        label.textAlignment = .center
        
       return label
    }()
    
    var btn = UIButton()
    
    
    private override init( frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate convenience init(buttonStyle: CustomButtonStyle,
                                 _ title: String,
                                 _ backgroundColor: UIColor,
                                 _ textColor: UIColor){
        self.init()
        layer.cornerRadius = 10
        self.backgroundColor = backgroundColor
        btnSetting(title: title, textColor: textColor)
        
        switch buttonStyle {
        
        case .normal:
            break
            
        case let .btnWithLeftIcon(icon):
            iconViewSetting(icon: icon)
            
        }
    }
    
    private func btnSetting(title: String, textColor: UIColor){
        self.addSubview(btn)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(textColor, for: .normal)
        btn.setTitleColor(.red, for: .highlighted)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        btn.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        btn.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        btn.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true


    }
    
    private func iconViewSetting(icon:UIImage){
        let iconView = UIView()
        iconView.backgroundColor = Color.iconBackgroundColor
        addSubview(iconView)
        iconView.layer.cornerRadius = 10
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        iconView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        iconView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        iconView.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        let iconImage = UIImageView()
        iconView.addSubview(iconImage)
        iconImage.image = icon
        iconImage.layer.cornerRadius = iconView.layer.cornerRadius
        iconImage.tintColor = .systemBackground
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.centerXAnchor.constraint(equalTo: iconView.centerXAnchor).isActive = true
        iconImage.centerYAnchor.constraint(equalTo: iconView.centerYAnchor).isActive = true

    }
    

    
}




