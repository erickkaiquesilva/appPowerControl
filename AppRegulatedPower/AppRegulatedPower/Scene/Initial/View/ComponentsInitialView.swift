//
//  ComponentsInitialView.swift
//  AppRegulatedPower
//
//  Created by Erick Kaique da Silva on 09/05/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit

class ComponentsInitialView: UIView {
    
    weak var delegate: InitialViewControllerDelegate?
    typealias ButtonAction = () -> Void
    var btnSignUpAction: ButtonAction?
    var btnListProductAction: ButtonAction?
    
    let btnCreateNewProducts: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 2
        btn.layer.borderColor = #colorLiteral(red: 0.2112424614, green: 0.445049266, blue: 0.7647058964, alpha: 1)
        btn.setTitleColor(#colorLiteral(red: 0.2112424614, green: 0.445049266, blue: 0.7647058964, alpha: 1), for: .normal)
        btn.setTitle("Cadastrar Produto", for: .normal)
        return btn
    }()
    
    let btnListProducts: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 10
        btn.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        btn.setTitle("Lista de Produtos", for: .normal)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
    
    private func initView(){
        [btnCreateNewProducts, btnListProducts].forEach {
            self.addSubview($0)
        }
        constrainsBtnCreateNewProduct()
        constrainsBtnListProducts()
        addAction()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constrainsBtnCreateNewProduct(){
        btnCreateNewProducts.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalBtn = NSLayoutConstraint(item: btnCreateNewProducts,
                                               attribute: NSLayoutConstraint.Attribute.centerX,
                                               relatedBy: NSLayoutConstraint.Relation.equal,
                                               toItem: self,
                                               attribute: NSLayoutConstraint.Attribute.centerX,
                                               multiplier: 1, constant: 0)
        
        let verticalBtn = NSLayoutConstraint(item: btnCreateNewProducts,
                                             attribute: NSLayoutConstraint.Attribute.centerY,
                                             relatedBy: NSLayoutConstraint.Relation.equal,
                                             toItem: self,
                                             attribute: NSLayoutConstraint.Attribute.centerY,
                                             multiplier: 1, constant: 0)
        
        let widthBtn = NSLayoutConstraint(item: btnCreateNewProducts,
                                          attribute: NSLayoutConstraint.Attribute.width,
                                          relatedBy: NSLayoutConstraint.Relation.equal,
                                          toItem: nil,
                                          attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                          multiplier: 1, constant: 250)
        
        let heightBtn = NSLayoutConstraint(item: btnCreateNewProducts,
                                           attribute: NSLayoutConstraint.Attribute.height,
                                           relatedBy: NSLayoutConstraint.Relation.equal,
                                           toItem: nil,
                                           attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                           multiplier: 1, constant: 70)
        
        NSLayoutConstraint.activate([horizontalBtn, verticalBtn, widthBtn, heightBtn])
    }
    
    func constrainsBtnListProducts(){
        btnListProducts.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalBtn = NSLayoutConstraint(item: btnListProducts,
                                               attribute: NSLayoutConstraint.Attribute.centerX,
                                               relatedBy: NSLayoutConstraint.Relation.equal,
                                               toItem: self,
                                               attribute: NSLayoutConstraint.Attribute.centerX,
                                               multiplier: 1, constant: 0)
        
        let verticalBtn = NSLayoutConstraint(item: btnListProducts,
                                             attribute: NSLayoutConstraint.Attribute.centerY,
                                             relatedBy: NSLayoutConstraint.Relation.equal,
                                             toItem: self,
                                             attribute: NSLayoutConstraint.Attribute.centerY,
                                             multiplier: 1, constant: 100)
        
        let widthBtn = NSLayoutConstraint(item: btnListProducts,
                                          attribute: NSLayoutConstraint.Attribute.width,
                                          relatedBy: NSLayoutConstraint.Relation.equal,
                                          toItem: nil,
                                          attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                          multiplier: 1, constant: 250)
        
        let heightBtn = NSLayoutConstraint(item: btnListProducts,
                                           attribute: NSLayoutConstraint.Attribute.height,
                                           relatedBy: NSLayoutConstraint.Relation.equal,
                                           toItem: nil,
                                           attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                           multiplier: 1, constant: 70)
        NSLayoutConstraint.activate([horizontalBtn, verticalBtn, widthBtn, heightBtn])
    }
    
    func addAction() {
        btnCreateNewProducts.addTarget(self, action: #selector(nextSignUp), for: .touchUpInside)
        btnListProducts.addTarget(self, action: #selector(nextListProduct), for: .touchUpInside)
    }
    
    @objc func nextSignUp() {
       btnSignUpAction?()
    }
    
    @objc func nextListProduct(){
        btnListProductAction?()
    }
}
