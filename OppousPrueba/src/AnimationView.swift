//
//  AnimartionView.swift
//  OppousPrueba
//
//  Created by Kevin Bolivar on 2/23/16.
//  Copyright © 2016 Kevin Bolivar. All rights reserved.
//

import UIKit

extension UIView
{
    
    func shakeAnimate()
    {
        var initialDirection:CGFloat = 1
        var shakes = 0
        shake(&initialDirection, shakes: &shakes)
    }
    
    private func shake(inout direction:CGFloat,inout shakes: Int)
    {
        UIView.animateWithDuration(0.03, animations:
        {
            self.transform = CGAffineTransformMakeTranslation(5*direction, 0)
        }) { (finished) -> Void in
            if shakes >= 10
            {
                self.transform = CGAffineTransformIdentity
                return
            }
            shakes++
            direction = -direction
            self.shake(&direction, shakes: &shakes)
        }
    }
}