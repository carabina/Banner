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
    
    /** Where the banner is located in the view. */
    public var location: BannerLocation
    
    /** The width and height of the banner. */
    public var size: CGSize {
        didSet {
            self.updateFrame()
        }
    }
    
    /** The padding on this banner (xPadding, yPadding). */
    public var padding: (CGFloat, CGFloat) {
        didSet {
            self.updateFrame()
        }
    }
    
    /** How long the timer should stay on screen. */
    internal var timer: Timer
    
    
    
    
    /************************
     *                      *
     *         INIT         *
     *                      *
     ************************/
    
    public required init?(coder aDecoder: NSCoder) {
        location = .bottomRight
        size = CGSize(width: 100, height: 50)
        padding = (20, 20)
        timer = Timer()
        super.init(coder: aDecoder)
        
        self.config()
    }
    
    public init(location: BannerLocation) {
        self.location = location
        self.size = CGSize(width: 100, height: 50)
        self.padding = (20, 20)
        self.timer = Timer()
        
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
        }
    }
    
    
    /** Sets the view to be displayed on this banner. */
    public func setView(view: UIView) {
        view.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        addSubview(view)
    }
    
    
    /** Starts the timer to dismiss this banner. */
    internal func startTimer() {
        
    }
    
    
    /** Dismisses the banner. */
    public func dismiss() {
        
        Banner.BANNER_OPEN = false
    }
    
}
