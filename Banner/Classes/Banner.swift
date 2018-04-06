//
//  Banner.swift
//  Banner
//
//  Created by Adeola Uthman on 4/4/18.
//

import Foundation
import UIKit

/** The location of the banner in the view. */
public enum BannerLocation {
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
}



/** A banner view that gets displayed either in the corners of the view or in a custom location. */
public class Banner: UIView {
    
    /************************
     *                      *
     *       VARIABLES      *
     *                      *
     ************************/
    
    /** Whether or not a banner is already open. */
    static var BANNER_OPEN: Bool = false
    
    /** The maximum number of banners that are allowed to be shown at the same time. */
    static var MAX_BANNERS: Int = 4
    
    /** The total number of banners that are currently open. */
    internal static var OPEN_BANNERS: Int = 0
    
    
    
    /** Where the banner is located in the view. */
    internal var location: BannerLocation
    
    /** The width and height of the banner. */
    public var size: CGSize {
        didSet { self.updateFrame() }
    }
    
    /** The padding on this banner (xPadding, yPadding). */
    public var padding: (CGFloat, CGFloat) {
        didSet { self.updateFrame() }
    }
    
    // Fix this later.
    /** The corner radius of the banner. */
    public var cornerRadius: CGFloat {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.updateFrame()
            self.updateSubviews()
        }
    }
    
    /** How long the timer should stay on screen in seconds. 0 means it never goes away. */
    public var displayTime: Double
    
    /** The amount of time to animate the banner. */
    public var animationDuration: Double
    
    
    
    
    
    /************************
     *                      *
     *         INIT         *
     *                      *
     ************************/
    
    public required init?(coder aDecoder: NSCoder) {
        location = .bottomRight
        size = CGSize(width: 100, height: 50)
        padding = (20, 20)
        cornerRadius = 0
        displayTime = 1
        animationDuration = 1
        super.init(coder: aDecoder)
        
        self.config()
    }
    
    public init(location: BannerLocation) {
        self.location = location
        self.size = CGSize(width: 100, height: 50)
        self.padding = (20, 20)
        self.cornerRadius = 0
        self.displayTime = 1
        self.animationDuration = 1
        
        switch location {
        case .topLeft:
            super.init(frame: CGRect(x: padding.0, y: padding.1, width: size.width, height: size.height))
            break
        case .topRight:
            super.init(frame: CGRect(x: UIScreen.main.bounds.maxX - size.width - padding.0, y: padding.1, width: size.width, height: size.height))
            break
        case .bottomLeft:
            super.init(frame: CGRect(x: padding.0, y: UIScreen.main.bounds.height - size.height - padding.1, width: size.width, height: size.height))
            break
        case .bottomRight:
            super.init(frame: CGRect(x: UIScreen.main.bounds.maxX - size.width - padding.0, y: UIScreen.main.bounds.height - size.height - padding.1, width: size.width, height: size.height))
            break
        }
        
        self.config()
    }
    
    
    
    
    
    /************************
     *                      *
     *       FUNCTIONS      *
     *                      *
     ************************/
    
    /** Basic configuration of this view. */
    private func config() {
        backgroundColor = .green    // Default background color
    }
    
    /** Updates the frame. */
    private func updateFrame() {
        switch location {
        case .topLeft:
            self.frame = CGRect(x: padding.0, y: padding.1, width: size.width, height: size.height)
            break
        case .topRight:
            self.frame = CGRect(x: UIScreen.main.bounds.maxX - size.width - padding.0, y: padding.1, width: size.width, height: size.height)
            break
        case .bottomLeft:
            self.frame = CGRect(x: padding.0, y: UIScreen.main.bounds.height - size.height - padding.1, width: size.width, height: size.height)
            break
        case .bottomRight:
            self.frame = CGRect(x: UIScreen.main.bounds.maxX - size.width - padding.0, y: UIScreen.main.bounds.height - size.height - padding.1, width: size.width, height: size.height)
            break
        }
    }
    
    
    /** Update the frames of each subview. */
    internal func updateSubviews() {
        for view in subviews {
            view.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
            view.layer.cornerRadius = self.cornerRadius
        }
    }
    
    
    /** Sets the view to be displayed on this banner. */
    public func setView(view: UIView) {
        view.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        view.clipsToBounds = true
        addSubview(view)
    }
    
    
    /** Starts the timer to dismiss this banner. */
    internal func startTimer() {
        if displayTime == 0 { return }
        
        let _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Banner.decrementTimer(timer:)), userInfo: nil, repeats: true)
    }
    
    @objc private func decrementTimer(timer: Timer) {
        if displayTime > 0 {
            displayTime -= 1
        } else {
            timer.invalidate()
            dismiss()
        }
    }
    
    
    /** Dismisses the banner. */
    public func dismiss() {
        
        switch location {
        case .topLeft:
            UIView.animate(withDuration: self.animationDuration, animations: {
                self.frame = CGRect(x: self.padding.0, y: self.padding.1, width: 0, height: self.size.height)
                self.updateSubviews()
            }, completion: { (b) in
                self.removeFromSuperview()
            })
            break
        case .topRight:
            UIView.animate(withDuration: self.animationDuration, animations: {
                self.frame = CGRect(x: UIScreen.main.bounds.maxX - self.padding.0, y: self.padding.1, width: 0, height: self.size.height)
                self.updateSubviews()
            }, completion: { (b) in
                self.removeFromSuperview()
            })
            break
        case .bottomLeft:
            UIView.animate(withDuration: self.animationDuration, animations: {
                self.frame = CGRect(x: self.padding.0, y: UIScreen.main.bounds.height - self.size.height - self.padding.1, width: 0, height: self.size.height)
                self.updateSubviews()
            }, completion: { (b) in
                self.removeFromSuperview()
            })
            break
        case .bottomRight:
            UIView.animate(withDuration: self.animationDuration, animations: {
                self.frame = CGRect(x: UIScreen.main.bounds.width - self.padding.0, y: UIScreen.main.bounds.height - self.size.height - self.padding.1, width: 0, height: self.size.height)
                self.updateSubviews()
            }, completion: { (b) in
                self.removeFromSuperview()
            })
            break
        }
        
        Banner.BANNER_OPEN = false
        Banner.OPEN_BANNERS -= 1
    }
    
}
