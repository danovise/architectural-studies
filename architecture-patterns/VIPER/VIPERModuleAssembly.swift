//
//  VIPERModuleAssembly.swift
//  architecture-patterns
//
//  Created by Daria Sechko on 15.11.22.
//

import Foundation

class VIPERModuleAssembly {
    
    static func assembly() -> VIPERViewController {
        
        let presenter = VIPERPresenter()
        
        let viewController = VIPERViewController()
        viewController.output = presenter
        
        presenter.view = viewController
        
        let interactor = VIPERInteractor()
        presenter.interactor = interactor
        
        let service = PincodeServiceImpl()
        interactor.output = presenter
        interactor.service = service
        
        let router = VIPERRouter()
        presenter.router = router
        router.view = viewController
        
        return viewController
    }
}

