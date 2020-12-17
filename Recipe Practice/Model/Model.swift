//
//  Model.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/16.
//

import UIKit

enum MainPageContentStyle: Int {
    case largeContent , smallContent , mediumContent, recipeWithRate
}


protocol PagingDelegate{
    
    func changePage(vc: UIViewController)
}
