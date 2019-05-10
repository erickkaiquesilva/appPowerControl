//
//  ListProductsRegisterModel.swift
//  AppRegulatedPower
//
//  Created by Erick Kaique da Silva on 10/05/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//
import Foundation

class ListProductRegisterModel{
    
    private var storageProducts = CoreDataProductManager.shared
    var product: [Product] = []
    
    func loadProduct() -> [Product]{
        storageProducts.loadProducts(with: context)
        product = storageProducts.products
        return product
    }
    
    func deleteProduct(row: Int){
        let productDeleted = product[row]
        context.delete(productDeleted)
        do {
            try context.save()
            product.remove(at: row)
        } catch {
            print(error.localizedDescription)
        }
    }
}
