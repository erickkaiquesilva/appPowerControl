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
    private var idProduct: Int = 0
    
    func registerProduct(product: String, value: Float){
        if createProduct == nil{
            createProduct = Product(context: context)
        }
        idProduct = Int.random(in: 0..<1000)
        createProduct.idProduct = Int64(idProduct)
        createProduct.name = product
        createProduct.value = value
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
