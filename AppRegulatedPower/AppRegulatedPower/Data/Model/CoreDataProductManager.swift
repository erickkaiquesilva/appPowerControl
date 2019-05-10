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
    var product: [Product] = []
    
    func loadProducts(with context: NSManagedObjectContext){
        let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            product = try context.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
    }
}
