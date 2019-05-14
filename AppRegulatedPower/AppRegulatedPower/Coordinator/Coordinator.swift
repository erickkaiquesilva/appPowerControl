//
//  Coordinator.swift
//  AppRegulatedPower
//
//  Created by Erick Kaique da Silva on 09/05/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit

enum NavigationType {
    case push
    case present
}

protocol Coordinator {
    var navigationController: UINavigationController? { get }
    func start(with navigationType: NavigationType)
}
