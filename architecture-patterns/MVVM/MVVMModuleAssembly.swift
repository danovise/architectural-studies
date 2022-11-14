//
//  MVVMModuleAssembly.swift
//  architecture-patterns
//
//  Created by Daria Sechko on 14.11.22.
//

import Foundation

class MVVMModuleAssembly {
    
    static func assembly() -> MVVMViewController {
        
        let service = PincodeServiceImpl.init()
        let viewModel = MVVMViewModel.init()
        viewModel.service = service
        
        let controller = MVVMViewController.init()
        controller.viewModel = viewModel
        
        return controller
    }
}
