//
//  MVVMViewModelInput.swift
//  architecture-patterns
//
//  Created by Daria Sechko on 14.11.22.
//

import Foundation

protocol MVVMViewModelInput: AnyObject {
    
    var pincodeModel: String { get set }
    var pincodeDidChangedHandler: ((String)->())? { get set }
    func receivePincode()
}

class MVVMViewModel: MVVMViewModelInput {
    
    var service: PincodeService!
    var pincodeDidChangedHandler: ((String) -> ())?
    
    var pincodeModel: String = "" {
        didSet {
            pincodeDidChangedHandler?(pincodeModel)
        }
    }
    
    func receivePincode() {
        
        service.fetchPincode { [weak self]  pincode in
            
            self?.pincodeModel = pincode
        }
    }
}
