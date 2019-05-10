//
//  ListProductsTableViewCoordinator.swift
//  AppRegulatedPower
//
//  Created by Erick Kaique da Silva on 09/05/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit
class ListProductsTableViewCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    init(navigation: UINavigationController?){
        navigationController = navigation
    }
    
    func start(with navigationType: NavigationType) {
        let listProductsTableViewController = ListProductsTableViewController()
    }
    
    func start() -> UIViewController{
        let listProductsTableViewController = ListProductsTableViewController()
        return listProductsTableViewController
    }
}
