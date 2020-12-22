//
//  View Extension.swift
//  Recipe Practice
//
//  Created by Ray Hsu on 2020/12/21.
//

import UIKit


extension UIView {
    func addDashedBorder(bordercolor: UIColor) {

    let shapeLayer:CAShapeLayer = CAShapeLayer()
    let frameSize = self.frame.size
    let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)

    shapeLayer.bounds = shapeRect
    shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
    shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = bordercolor.cgColor
    shapeLayer.lineWidth = 1
    shapeLayer.lineJoin = .round
    shapeLayer.lineDashPattern = [10,5]
    shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 10).cgPath

    self.layer.addSublayer(shapeLayer)
    }
}
