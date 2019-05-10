//
//  TabBarCoordinator.swift
//  AppRegulatedPower
//
//  Created by Erick Kaique da Silva on 09/05/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit
class TabBarCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    var tabBarController: UITabBarController?
    var childCoordinator: Coordinator?
    let listProductTableViewCoordinator: ListProductsTableViewCoordinator
    let favoriteTableViewCoordinator: FavoriteTableViewCoordinator
    
    init(navigation: UINavigationController?){
        self.navigationController = navigation
        listProductTableViewCoordinator = ListProductsTableViewCoordinator(navigation: navigation)
        favoriteTableViewCoordinator = FavoriteTableViewCoordinator(navigation: navigation)
    }
    
    func start(with navigationType: NavigationType) {
        tabBarController = RegulatedPowerTabBarController()
        let listProducts = listProductTableViewCoordinator.start()
        let listFavorite = favoriteTableViewCoordinator.start()
        listProducts.tabBarItem = UITabBarItem(title: "Produtos", image: nil, selectedImage: nil)
        listFavorite.tabBarItem = UITabBarItem(title: "Favoritos", image: nil, selectedImage: nil)
        tabBarController?.viewControllers = [listProducts, listFavorite]
        switch navigationType {
        case .push:
            navigationController?.pushViewController(tabBarController!, animated: true)
        default:
            navigationController?.present(tabBarController!, animated: true, completion: nil)
        }
    }
}
