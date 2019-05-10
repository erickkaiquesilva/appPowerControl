//
//  SignUpViewController.swift
//  AppRegulatedPower
//
//  Created by Erick Kaique da Silva on 09/05/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit
class SignUpViewController: UIViewController {
    
    weak var delegate: CreateProductDelegate?
    var componentsSignUpView: ComponentsSignUpView!
    
    init(view: ComponentsSignUpView){
        self.componentsSignUpView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupActions()
    }
    
    private func setupView(){
        view.addSubview(componentsSignUpView)
        if #available(iOS 11.0, *) {
            componentsSignUpView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        } else {
            componentsSignUpView.anchor(top: topLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        }
    }
    
    private func setupActions(){
        componentsSignUpView.btnRegisterProductAction = { productText, valueText in
            //print("\(productText), \(valueText)")
            self.delegate?.registerProduct(product: productText, value: valueText)
        }
    }
}
