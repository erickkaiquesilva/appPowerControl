//
//  InitialViewController.swift
//  AppRegulatedPower
//
//  Created by Erick Kaique da Silva on 09/05/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController{
    
    weak var delegate: InitialViewControllerDelegate?
    var componentsInitialView: ComponentsInitialView!
    
    init(view: ComponentsInitialView) {
        self.componentsInitialView = view
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
        view.addSubview(componentsInitialView)
        if #available(iOS 11.0, *) {
            componentsInitialView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        } else {
            componentsInitialView.anchor(top: topLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        }
    }
    
    private func setupActions(){
        componentsInitialView.btnSignUpAction = {
            self.delegate?.signUpNext()
        }
        componentsInitialView.btnListProductAction = {
            self.delegate?.listProductNext()
        }
    }
}
