//
//  VIPERPresenter.swift
//  architecture-patterns
//
//  Created by Daria Sechko on 15.11.22.
//

import Foundation

protocol VIPERPresenterInput {
   
}

protocol VIPERPresenterOutput {
    
}

class VIPERPresenter {
  
    weak var view: VIPERViewInput!
    var interactor: VIPERInteractorInput!
    var router: VIPERRouter!
}

extension VIPERPresenter: VIPERViewOutput, VIPERInteractorOutput {
    
    
    func didFinishReceivePincode(_ pincode: String) {
        view.showPincode(pincode)
        
        router.showDetailScreen()
    }
    
    func didPressPincodeButton() {
        interactor.receivePincodeAction()
    }
}
