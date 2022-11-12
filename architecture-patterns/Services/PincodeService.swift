//
//  PincodeService.swift
//  architecture-patterns
//
//  Created by Daria Sechko on 12.11.22.
//

import Foundation

protocol PincodeService {
    func fetchPincode(completion: @escaping (String)->())
}

class PincodeServiceImpl: PincodeService {
    
    func fetchPincode(completion: @escaping (String)->()) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            let randomValue = Int.random(in: 1111...9999)
            
            completion("\(randomValue)")
        }
    }
}
