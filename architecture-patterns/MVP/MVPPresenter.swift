//
//  MVPPresenter.swift
//  architecture-patterns
//
//  Created by Daria Sechko on 13.11.22.
//

import UIKit

class MVPPresenter {
  
    weak var view: MVPViewInput!

    var service: PincodeService
    
    init(service: PincodeService) {
        self.service = service
    }
    
    private func receivePincodeAction() {
        
        service.fetchPincode { pincode in
            self.view.showPincode(pincode)
        }
    }
}

extension MVPPresenter: MVPViewOutput {
   
    func didPressPincodeButton() {
        receivePincodeAction()
    }
}
