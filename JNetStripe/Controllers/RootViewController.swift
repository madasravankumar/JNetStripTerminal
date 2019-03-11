//
//  RootViewController.swift
//  Stripe POS
//
//  Created by Ben Guo on 9/7/17.
//  Copyright © 2017 Stripe. All rights reserved.
//

import UIKit
import StripeTerminal

class RootViewController: UIViewController, TerminalDelegate {
    
    static var backendUrl: String = "http://osewebapi.azurewebsites.net"
    static var apiClient: APIClient?
    static var deviceType: DeviceType = .chipper2X
    static var discoveryMethod: DiscoveryMethod = .bluetoothProximity

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Terminal.shared.delegate = self
    }
    
    // MARK:- custom methods
    private func setup() {
        let apiClient = APIClient()
        apiClient.baseURLString = RootViewController.backendUrl
        RootViewController.apiClient = apiClient
        Terminal.setTokenProvider(apiClient)
        
    }
    
    @IBAction func showDevices(_ sender: Any) {
        showDiscoverReaders()
    }
    
    private func showDiscoverReaders() {
        guard let config = DiscoveryConfiguration(deviceType: RootViewController.deviceType, method: RootViewController.discoveryMethod) else { return }
        
        let discoveryVC = ReaderDiscoveryViewController(discoveryConfig: config)
        discoveryVC.onConnectedToReader = { reader in
            /*self.connectedReader = reader
            if let _ = discoveryVC.presentedViewController {
                discoveryVC.dismiss(animated: true) {
                    discoveryVC.dismiss(animated: true) {
                        self.updateContent()
                    }
                }
            }
            else {
                discoveryVC.dismiss(animated: true) {
                    self.updateContent()
                }
            }*/
        }
        let navController = UINavigationController(rootViewController: discoveryVC)
        navController.navigationBar.isTranslucent = false
        if #available(iOS 11.0, *) {
            navController.navigationBar.prefersLargeTitles = true
        }
        self.present(navController, animated: true, completion: nil)
    }
}

