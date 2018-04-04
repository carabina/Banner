//
//  UIViewController+Banner.swift
//  Banner
//
//  Created by Adeola Uthman on 4/4/18.
//

import Foundation

public extension UIViewController {
    
    /** Display a banner on top of the current view controller. */
    public func showBanner(banner: Banner, duration: Double) {
        if view.subviews.contains(banner) { return }
        else { print("We gucci fam") }
        let to: CGRect = banner.frame
        
        // Do some setup.
        switch banner.location {
        case .topLeft:
            banner.frame = CGRect(x: banner.frame.minX, y: banner.frame.minY, width: 0, height: banner.frame.height)
            banner.updateSubviews()
            break
        case .topRight:
            banner.frame = CGRect(x: banner.frame.minX + banner.frame.width, y: banner.frame.minY, width: 0, height: banner.frame.height)
            banner.updateSubviews()
            break
        case .bottomLeft:
            banner.frame = CGRect(x: banner.frame.minX, y: banner.frame.minY, width: 0, height: banner.frame.height)
            banner.updateSubviews()
            break
        case .bottomRight:
            banner.frame = CGRect(x: banner.frame.minX + banner.frame.width, y: banner.frame.minY, width: 0, height: banner.frame.height)
            banner.updateSubviews()
            break
        }
        
        // Add to the view.
        self.view.addSubview(banner)
        self.view.bringSubview(toFront: banner)
        
        // Animate the view.
        UIView.setAnimationCurve(UIViewAnimationCurve.easeOut)
        switch banner.location {
        case .topLeft:
            UIView.animate(withDuration: duration, animations: {
                banner.frame = CGRect(x: banner.frame.minX, y: banner.frame.minY, width: to.width, height: banner.frame.height)
                banner.updateSubviews()
            }, completion: { (b) in
                banner.startTimer()
            }) 
            break
        case .topRight:
            UIView.animate(withDuration: duration, animations: {
                banner.frame = CGRect(x: to.minX, y: banner.frame.minY, width: to.width, height: banner.frame.height)
                banner.updateSubviews()
            }, completion: { (b) in
                banner.startTimer()
            })
            break
        case .bottomLeft:
            UIView.animate(withDuration: duration, animations: {
                banner.frame = CGRect(x: banner.frame.minX, y: banner.frame.minY, width: to.width, height: banner.frame.height)
                banner.updateSubviews()
            }, completion: { (b) in
                banner.startTimer()
            })
            break
        case .bottomRight:
            UIView.animate(withDuration: duration, animations: {
                banner.frame = CGRect(x: to.minX, y: banner.frame.minY, width: to.width, height: banner.frame.height)
                banner.updateSubviews()
            }, completion: { (b) in
                banner.startTimer()
            }) 
            break
        }
        
        // Reset the frame.
        banner.frame = to
    }
    
    
    
    
    
}