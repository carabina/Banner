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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(button)
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    
    
    
    @objc func displayBanner() {
        let banner = Banner(location: BannerLocation.bottomRight)
        banner.size = CGSize(width: 200, height: 40)
        banner.cornerRadius = 25
        banner.displayTime = 2
        banner.padding = (10,10)
        
        let label = UILabel()
        label.backgroundColor = UIColor(red: 0, green: 0.4, blue: 0.6, alpha: 1)
        label.text = "Here is a banner!"
        label.textColor = .white
        
        banner.setView(view: label)
        showBanner(banner: banner, duration: 0.25)
    }
    
    
}

