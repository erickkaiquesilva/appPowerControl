//
//  AppCoordinator.swift
//  AppRegulatedPower
//
//  Created by Erick Kaique da Silva on 09/05/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit

final class AppCoordinator{
    var navigationController: UINavigationController?
    var window: UIWindow
    var currentCoordinator: Coordinator
    
    init(window: UIWindow){
        self.window = window
        navigationController = UINavigationController()
        self.currentCoordinator = InitialCoordinator(navigation: navigationController)
    }
    
    func start(with navigationType: NavigationType){
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        currentCoordinator.start(with: .push)
    }
}
