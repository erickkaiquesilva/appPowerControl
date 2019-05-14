//
//  ListProductsTableViewControler.swift
//  AppRegulatedPower
//
//  Created by Erick Kaique da Silva on 09/05/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit
class ListProductsTableViewController: UITableViewController {
    
    var label = UILabel()
    var storageProduct = ListProductRegisterModel()
    var product: [Product] = []
    var customCell: ProductTableViewCellDelegate?
    var favoriteComparator: FavoriteComparator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "OPS!!! Nao existe produtos cadastrados."
        label.textAlignment = .center
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        setupLoadProduct()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupLoadProduct(){
        product = storageProduct.loadProduct()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = product.count
        tableView.backgroundView = count == 0 ? label : nil
        return count
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let row = indexPath.row
            storageProduct.deleteProduct(row: row, tableView: tableView, indexPath: indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        product[row].isSelected.toggle()
        favoriteComparator = FavoriteComparator()
        favoriteComparator?.registerProductFavorite(with: product[row])
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
