//
//  SignUpCoordinator.swift
//  AppRegulatedPower
//
//  Created by Erick Kaique da Silva on 09/05/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit
class SignUpCoordinator: Coordinator {
    var navigationController: UINavigationController?
    var childCoordinator: Coordinator?
    var registerModel: RegisterModel?
    
    init(navigation: UINavigationController?){
        self.navigationController = navigation
    }
    
    func start(with navigationType: NavigationType) {
        let view = ComponentsSignUpView()
        let signUpViewController = SignUpViewController(view: view)
        signUpViewController.delegate = self
        switch navigationType {
        case .push:
            navigationController?.pushViewController(signUpViewController, animated: true)
        default:
            navigationController?.present(signUpViewController, animated: true, completion: nil)
        }
    }
}

extension SignUpCoordinator: CreateProductDelegate{
    func registerProduct(product: String, value: String) {
        registerModel = RegisterModel()
        registerModel?.registerProduct(product: product, value: Float(value)!)
    }
}
