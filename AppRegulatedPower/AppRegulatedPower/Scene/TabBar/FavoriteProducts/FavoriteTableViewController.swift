//
//  FavoriteTableViewController.swift
//  AppRegulatedPower
//
//  Created by Erick Kaique da Silva on 09/05/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit
class FavoriteTableViewController: UITableViewController {
    
    var label = UILabel()
    var favoriteList = FavoriteComparator()
    var productFavorite: [Product] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        label.text = "Nao encotramos lista de favoritos"
        label.textAlignment = .center
        loadProductsFavorite()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadProductsFavorite()
    }
    
    func loadProductsFavorite() {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = productFavorite.count
        tableView.backgroundView = count == 0 ? label : nil
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}
