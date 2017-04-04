//
//  FaveButton.swift
//  FaveButton
//
// Copyright © 2016 Jansel Valentin.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

public typealias DotColors = (first: UIColor, second: UIColor)

open class SparkImageView: UIImageView {
    
    fileprivate struct Const{
        static let expandDuration       = 0.1298
        static let collapseDuration     = 0.1089
        static let faveIconShowDelay    = Const.expandDuration + Const.collapseDuration/2.0
        static let dotRadiusFactors     = (first: 0.0633, second: 0.04)
    }
    
    @IBInspectable open var dotFirstColor: UIColor   = UIColor(colorLiteralRed: 152/255, green: 219/255, blue: 236/255, alpha: 1)
    @IBInspectable open var dotSecondColor: UIColor  = UIColor(colorLiteralRed: 247/255, green: 188/255, blue: 48/255,  alpha: 1)
    @IBInspectable open var circleFromColor: UIColor = UIColor(colorLiteralRed: 221/255, green: 70/255,  blue: 136/255, alpha: 1)
    @IBInspectable open var circleToColor: UIColor   = UIColor(colorLiteralRed: 205/255, green: 143/255, blue: 246/255, alpha: 1)
    
    @IBOutlet open weak var delegate: AnyObject?
    
    fileprivate(set) var sparkGroupCount: Int = 9
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


// MARK: create
extension SparkImageView {
    
    
    fileprivate func createSparks(_ radius: CGFloat) -> [Spark] {
        var sparks    = [Spark]()
        let step      = 360.0/Double(sparkGroupCount)
        let base      = Double(bounds.size.width)
        let dotRadius = (base * Const.dotRadiusFactors.first, base * Const.dotRadiusFactors.second)
        let offset    = 10.0
        
        for index in 0..<sparkGroupCount{
            let theta  = step * Double(index) + offset
            let colors = dotColors(atIndex: index)
            
            let spark  = Spark.createSpark(self, radius: radius, firstColor: colors.first,secondColor: colors.second, angle: theta,
                                           dotRadius: dotRadius)
            sparks.append(spark)
        }
        return sparks
    }
}


// MARK: utils
extension SparkImageView {
    fileprivate func dotColors(atIndex index: Int) -> DotColors{
        return DotColors(self.dotFirstColor, self.dotSecondColor)
    }
}


// MARK: animation
extension SparkImageView {
    public func animate(withDuration duration: Double, completion: (()->Void)?){
        let radius           = bounds.size.scaleBy(1.3).width/2 // ring radius
        let igniteFromRadius = radius*0.8
        let igniteToRadius   = radius*1.1
        
        let ring   = Ring.createRing(self, radius: 0.01, lineWidth: 3, fillColor: self.circleFromColor)
        let sparks = createSparks(igniteFromRadius)
        
        ring.animateToRadius(radius, toColor: circleToColor, duration: Const.expandDuration, delay: 0)
        ring.animateColapse(radius, duration: Const.collapseDuration, delay: Const.expandDuration)
        
        sparks.forEach{
            $0.animateIgniteShow(igniteToRadius, duration:0.4, delay: Const.collapseDuration/3.0)
            $0.animateIgniteHide(0.7, delay: 0.2)
        }
        
        let delay = DispatchTime.now() + Double(Int64(Double(NSEC_PER_SEC) * duration)) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delay){
            completion?()
        }
    }
}
