//
//  RegisterModel.swift
//  AppRegulatedPower
//
//  Created by Erick Kaique da Silva on 10/05/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import Foundation
import CoreData
class RegisterModel{
    
    var createProduct: Product!
    
    func registerProduct(product: String, value: Float){
        if createProduct == nil{
            createProduct = Product(context: context)
        }
        createProduct.name = product
        createProduct.value = value
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
