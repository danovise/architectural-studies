//
//  VIPERRouter.swift
//  architecture-patterns
//
//  Created by Daria Sechko on 15.11.22.
//

import UIKit

protocol VIPERRouterInput {
    func showPincodeAlert(_ pincode: String)
    func showDetailScreen()
}

class VIPERRouter: VIPERRouterInput {
    
    weak var view: UIViewController!
    
    func showPincodeAlert(_ pincode: String) {
        let alert = UIAlertController(title: "Пин-код получен \(pincode)", message: nil, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Хорошо", style: .default, handler: nil)
        alert.addAction(okButton)
        
        view.present(alert, animated: true, completion: nil)
    }
    
    func showDetailScreen() {
        let viewController = MVPViewController.init()
        view.present(viewController, animated: true)
    }
}

