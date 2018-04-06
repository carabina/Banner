//
//  ViewController.swift
//  Banner
//
//  Created by authman2 on 04/04/2018.
//  Copyright (c) 2018 authman2. All rights reserved.
//

import UIKit
import Banner

class ViewController: UIViewController {
    
    /** The button that displays a banner. */
    lazy var button: UIButton = {
        let a = UIButton()
        a.translatesAutoresizingMaskIntoConstraints = false
        a.setTitle("Tap to show banner", for: .normal)
        a.setTitleColor(.white, for: .normal)
        a.backgroundColor = UIColor(red: 0, green: 0.5, blue: 0.5, alpha: 1)
        a.layer.cornerRadius = 10
        a.addTarget(self, action: #selector(displayBanner), for: .touchUpInside)
        
        return a
    }()
    
    /** The button that displays a banner. */
    lazy var button2: UIButton = {
        let a = UIButton()
        a.translatesAutoresizingMaskIntoConstraints = false
        a.setTitle("Tap to show dismiss banner", for: .normal)
        a.setTitleColor(.white, for: .normal)
        a.backgroundColor = UIColor(red: 0, green: 0.5, blue: 0.5, alpha: 1)
        a.layer.cornerRadius = 10
        a.addTarget(self, action: #selector(displayDismissBanner), for: .touchUpInside)
        
        return a
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(button)
        view.addSubview(button2)
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        button2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button2.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20).isActive = true
        button2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    
    
    
    @objc func displayBanner() {
        let banner = Banner(location: BannerLocation.bottomLeft)
        banner.size = CGSize(width: 200, height: 40)
        banner.displayTime = 2
        banner.animationDuration = 0.25
        banner.padding = (10,10)
        
        let label = UILabel()
        label.backgroundColor = UIColor(red: 0, green: 0.7, blue: 0.4, alpha: 1)
        label.text = "Here is a banner!"
        label.textColor = .white
        
        banner.setView(view: label)
        showBanner(banner: banner)
    }
    
    
    let dismissableBanner = Banner(location: BannerLocation.bottomRight)
    
    @objc func displayDismissBanner() {
        dismissableBanner.size = CGSize(width: 200, height: 40)
        dismissableBanner.cornerRadius = 15
        dismissableBanner.displayTime = 0
        dismissableBanner.padding = (10,10)
        dismissableBanner.animationDuration = 0.25
        
        let label = UILabel()
        label.backgroundColor = UIColor(red: 0, green: 0.4, blue: 0.6, alpha: 1)
        label.text = "Click to dismiss"
        label.textColor = .white
        let btn = UIButton()
        btn.setTitle("X", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(red: 0, green: 0.4, blue: 0.6, alpha: 1)
        btn.addTarget(self, action: #selector(dismissBanner), for: .touchUpInside)
        let v = UIView()
        v.addSubview(label)
        v.addSubview(btn)
        
        dismissableBanner.setView(view: v)
        showBanner(banner: dismissableBanner)
        
        label.frame = CGRect(x: 0, y: 0, width: v.frame.width * 0.8, height: v.frame.height)
        btn.frame = CGRect(x: v.frame.width * 0.8, y: 0, width: v.frame.width - (v.frame.width * 0.7), height: v.frame.height)
    }
    
    @objc func dismissBanner() {
        dismissableBanner.dismiss()
    }
    
}

