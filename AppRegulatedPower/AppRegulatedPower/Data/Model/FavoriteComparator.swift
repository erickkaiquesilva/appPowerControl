//
//  FavoriteComparator.swift
//  AppRegulatedPower
//
//  Created by Erick Kaique da Silva on 13/05/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import Foundation
import CoreData
class FavoriteComparator{
    
    var listFavorite: [Product] = []
    var shared = CoreDataProductManager.shared
    
    func registerProductFavorite(with product: Product){
        if product.isSelected ==  true{
            listFavorite.append(shared.getProductChecked(with: product.idProduct, context: context))
        } else {
            print("Passou no ELSE")
        }
    }
    
    func loadProductsFavorite(){
        print(listFavorite)
    }
}
