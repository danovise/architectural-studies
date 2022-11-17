//
//  VIPERInteractor.swift
//  architecture-patterns
//
//  Created by Daria Sechko on 15.11.22.
//

import Foundation

protocol VIPERInteractorInput {
    func receivePincodeAction()
}

protocol VIPERInteractorOutput {
    func didFinishReceivePincode(_ pincode: String)
}

class VIPERInteractor: VIPERInteractorInput {
    
    var service: PincodeService!
    var output: VIPERInteractorOutput!

    func receivePincodeAction() {

        service.fetchPincode { [weak self] pincode in

            self?.output.didFinishReceivePincode(pincode)
        }
    }
}
