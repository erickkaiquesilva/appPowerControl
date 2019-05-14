//
//  CoreData+UIView.swift
//  AppRegulatedPower
//
//  Created by Erick Kaique da Silva on 10/05/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit
import CoreData
extension UITableViewController {
    var context: NSManagedObjectContext{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return NSManagedObjectContext.init(concurrencyType: .mainQueueConcurrencyType)
        }
        return appDelegate.persistentContainer.viewContext
    }
}

extension RegisterModel{
    var context: NSManagedObjectContext {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return NSManagedObjectContext.init(concurrencyType: .mainQueueConcurrencyType)
        }
        return appDelegate.persistentContainer.viewContext
    }
}

extension ListProductRegisterModel {
    var context: NSManagedObjectContext {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return NSManagedObjectContext.init(concurrencyType: .mainQueueConcurrencyType)
        }
        return appDelegate.persistentContainer.viewContext
    }
}

extension FavoriteComparator {
    var context: NSManagedObjectContext {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return NSManagedObjectContext.init(concurrencyType: .mainQueueConcurrencyType)
        }
        return appDelegate.persistentContainer.viewContext
    }
}
