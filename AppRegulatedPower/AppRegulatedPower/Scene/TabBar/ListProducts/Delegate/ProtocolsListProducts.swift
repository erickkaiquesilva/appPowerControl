//
//  ProtocolsListProducts.swift
//  AppRegulatedPower
//
//  Created by Erick Kaique da Silva on 10/05/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit
import Foundation
protocol ProductTableViewCellDelegate {
    func customProductCell(product: Product)
}
protocol ProtocolDeleteProduct {
    func deleteProduct(index: Int)
}
