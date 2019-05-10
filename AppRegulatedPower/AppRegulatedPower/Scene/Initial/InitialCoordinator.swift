//
//  InitialCoordinator.swift
//  AppRegulatedPower
//
//  Created by Erick Kaique da Silva on 09/05/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit

class InitialCoordinator: Coordinator{
    var navigationController: UINavigationController?
    var childCoordinator: Coordinator?
    
    init(navigation: UINavigationController?) {
        self.navigationController = navigation
    }
    
    func start(with navigationType: NavigationType){
        let view = ComponentsInitialView()
        let viewController = InitialViewController(view: view)
        viewController.delegate = self
        switch navigationType {
        case .push:
            navigationController?.pushViewController(viewController, animated: true)
        default:
            navigationController?.present(viewController, animated: true, completion: nil)
        }
    }
}

extension InitialCoordinator: InitialViewControllerDelegate{
    func signUpNext() {
        childCoordinator = SignUpCoordinator(navigation: navigationController)
        childCoordinator?.start(with: .push)
    }
    
    func listProductNext(){
        childCoordinator = TabBarCoordinator(navigation: navigationController)
        childCoordinator?.start(with: .push)
    }
}
