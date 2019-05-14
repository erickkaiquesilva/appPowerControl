//
//  ProductTableViewCell.swift
//  AppRegulatedPower
//
//  Created by Erick Kaique da Silva on 10/05/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit
class ProductTableViewCell: UITableViewCell {
    
    var product: Product? {
        didSet{
            labelNameProduct.text = product?.name
            if let value = product?.value{
                labelValueProduct.text = String(value)
            }
            if let state = product?.isSelected{
                accessoryType = state ? .checkmark : .none
            }
        }
    }
    
    private let labelNameProduct: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0.2932635638, green: 0.5028202404, blue: 0.857978465, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 17)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let labelValueProduct: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0.2932635638, green: 0.5028202404, blue: 0.857978465, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.textAlignment = .left
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(labelNameProduct)
        addSubview(labelValueProduct)
        setupConstrains()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstrains(){
        
        labelValueProduct.translatesAutoresizingMaskIntoConstraints = false
        labelNameProduct.translatesAutoresizingMaskIntoConstraints = false
        
        labelNameProduct.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 16))
        
        labelValueProduct.anchor(top: self.labelNameProduct.bottomAnchor,
                                 leading: self.leadingAnchor,
                                 bottom: nil,
                                 trailing: self.trailingAnchor,
                                 padding: UIEdgeInsets(top: 10,
                                                       left: 20,
                                                       bottom: 0,
                                                       right: 16))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension ProductTableViewCell: ProductTableViewCellDelegate{
    func customProductCell(product: Product){
        self.product = product
    }
}
