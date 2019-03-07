//
//  BGTAnim.swift
//  FirebaseCore
//
//  Created by Семен Кологривов on 06/03/2019.
//

import UIKit

class NVActivityIndicatorAnimationBallPulseBGT: NVActivityIndicatorAnimationDelegate {
    func setUpAnimation(in layer: CALayer, size: CGSize, color: UIColor) {
        
        let circlesCount = 5
        
        var beginTimes: [CFTimeInterval] = []
//        var keyTimes: [CGFloat] = []
//        var values: [CGFloat] = []
        for i in 0...circlesCount {
            beginTimes.append(CFTimeInterval(i) * 0.12)
        }
        
        let circleSpacing: CGFloat = 4
        let circleSize: CGFloat = 8
        let x: CGFloat = 0
        let y: CGFloat = 0
        let duration: CFTimeInterval = 0.75
        let beginTime = CACurrentMediaTime()
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.2, 0.68, 0.18, 1.08)
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        
        // Animation
        animation.keyTimes = [0, 0.2, 0.4, 0.6, 1]
        animation.timingFunctions = [timingFunction, timingFunction]
        animation.values = [1, 0.6, 0.4, 0.2, 0]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        // Draw circles
        for i in 0 ..< circlesCount {
            let circle = NVActivityIndicatorShape.circle.layerWith(size: CGSize(width: circleSize, height: circleSize), color: color)
            let frame = CGRect(x: x + circleSize * CGFloat(i) + circleSpacing * CGFloat(i),
                               y: y,
                               width: circleSize,
                               height: circleSize)
            
            animation.beginTime = beginTime + beginTimes[i]
            circle.frame = frame
            circle.add(animation, forKey: "animation")
            layer.addSublayer(circle)
        }
    }
}

