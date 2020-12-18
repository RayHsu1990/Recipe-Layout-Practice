//
//  File.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/18.
//

import UIKit


protocol Reusable : class{
    static var id: String { get }
    static func nib() -> UINib
}
extension Reusable {
    static var id: String {
      return String(describing: self)
    }
    
    static func nib() -> UINib {
        UINib(nibName: "\(self)", bundle: nil)
    }

}
