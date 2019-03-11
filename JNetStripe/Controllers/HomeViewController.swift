//
//  HomeViewController.swift
//  JNetStripe
//
//  Created by sravan on 09/03/19.
//  Copyright © 2019 jnet. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var devicesButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show Devices", for: .normal)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(showDevices), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    

    // MARK:- custom methods
    private func setup() {
        
        view.addSubview(devicesButton)
        addShowButtonConstraints()
    }
    
    private func addShowButtonConstraints() {
        devicesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        view.rightAnchor.constraint(equalTo: devicesButton.rightAnchor, constant: 30).isActive = true
        devicesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        devicesButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        devicesButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc private func showDevices() {
        
    }
}
