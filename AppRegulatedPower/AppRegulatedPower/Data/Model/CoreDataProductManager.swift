//
//  CoreDataProductManager.swift
//  AppRegulatedPower
//
//  Created by Erick Kaique da Silva on 10/05/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//
import CoreData

class CoreDataProductManager{
    static let shared = CoreDataProductManager()
    var products: [Product] = []
    
    func loadProducts(with context: NSManagedObjectContext){
        let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            products = try context.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteProduct(index: Int, context: NSManagedObjectContext){
        let product = products[index]
        context.delete(product)
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private init(){
        
    }
}
