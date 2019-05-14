//
//  SignUpView.swift
//  AppRegulatedPower
//
//  Created by Erick Kaique da Silva on 09/05/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit
class ComponentsSignUpView: UIView, UITextFieldDelegate {
    
    typealias ButtonRegisterProduct = (String, String) -> Void
    var btnRegisterProductAction: ButtonRegisterProduct?
    
    let titleFull: UILabel = {
        let label = UILabel()
        label.text = "Crie Seu Produto"
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica Neue", size: 40)
        label.textColor = #colorLiteral(red: 0.2240788012, green: 0.5715647095, blue: 0.8072376943, alpha: 1)
        return label
    }()
    
    let textFieldNameProduct: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Informe o nome do seu produto"
        textField.font = UIFont(name: "Arial", size: 17)
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .yes
        return textField
    }()
    
    let textFieldValueProduct: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Informe o valor do seu produto"
        textField.font = UIFont(name: "Arial", size: 17)
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .yes
        return textField
    }()
    
    let btnCreateNewProduct: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 10
        btn.backgroundColor =  #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        btn.setTitle("Cadastrar Produto", for: .normal)
        btn.isEnabled = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
        textFieldValueProduct.delegate = self
        textFieldNameProduct.delegate = self
    }
    
    private func initView(){
        [titleFull, textFieldNameProduct, textFieldValueProduct, btnCreateNewProduct].forEach {
            self.addSubview($0)
        }
        setConstrains()
        addAction()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstrains(){
        titleFull.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 50, left: 16, bottom: 16, right: 0))
        
        textFieldNameProduct.translatesAutoresizingMaskIntoConstraints = false
        textFieldNameProduct.anchor(top: self.titleFull.bottomAnchor,
                                    leading: self.leadingAnchor,
                                    bottom: nil,
                                    trailing: self.trailingAnchor,
                                    padding: UIEdgeInsets(top: 70,
                                                          left: 16,
                                                          bottom: 0,
                                                          right: 16))
        
        textFieldNameProduct.heightAnchor.constraint(equalToConstant: 70).isActive = true
        textFieldValueProduct.translatesAutoresizingMaskIntoConstraints = false
        textFieldValueProduct.anchor(top: self.textFieldNameProduct.bottomAnchor,
                                     leading: self.leadingAnchor,
                                     bottom: nil,
                                     trailing: self.trailingAnchor,
                                     padding: UIEdgeInsets(top: 40,
                                                           left: 16,
                                                           bottom: 0,
                                                           right: 16))
        textFieldValueProduct.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        btnCreateNewProduct.translatesAutoresizingMaskIntoConstraints = false
        btnCreateNewProduct.anchor(top: self.textFieldValueProduct.bottomAnchor,
                                   leading: self.leadingAnchor,
                                   bottom: nil,
                                   trailing: self.trailingAnchor,
                                   padding: UIEdgeInsets(top: 40,
                                                         left: 16,
                                                         bottom: 0,
                                                         right: 16))
        btnCreateNewProduct.heightAnchor.constraint(equalToConstant: 65).isActive = true
    }
    
    func addAction(){
        btnCreateNewProduct.addTarget(self, action: #selector(createProduct), for: .touchUpInside)
        
    }
    
    @objc func createProduct(){
        if let produtcText = textFieldNameProduct.text, let valueText = textFieldValueProduct.text {
            btnRegisterProductAction?(produtcText, valueText)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        btnCreateNewProduct.isEnabled = true
        return true
    }
}

