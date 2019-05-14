//
//  ListProductsFavorite.swift
//  AppRegulatedPower
//
//  Created by Erick Kaique da Silva on 14/05/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import Foundation
import CoreData
class ListProdcutsFavorite {
    private var shared = CoreDataProductManager.shared
    var product: [Product] = []
    
    func loadsProductsFavorite() -> [Product] {
        return product
    }
}
