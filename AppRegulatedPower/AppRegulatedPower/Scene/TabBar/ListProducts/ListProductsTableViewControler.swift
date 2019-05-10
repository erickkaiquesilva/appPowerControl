//
//  ListProductsTableViewControler.swift
//  AppRegulatedPower
//
//  Created by Erick Kaique da Silva on 09/05/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit
class ListProductsTableViewController: UITableViewController {
    
    var storageProduct = ListProductRegisterModel()
    var product: [Product] = []
    var customCell: ProductTableViewCellDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        setupLoadProduct()
    }
    
    func setupLoadProduct(){
        product = storageProduct.loadProduct()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProductTableViewCell else {
            let cell = UITableViewCell()
            return cell
        }
        let item = product[indexPath.row]
        cell.customProductCell(product: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
