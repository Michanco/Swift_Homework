//
//  ViewController.swift
//  HW1_UIKit
//
//  Created by Michanco Slesarev on 06.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var myImageView: UIImageView = {
        let swiftLogoImage = UIImage(named: "SwiftLogo")
        var myImageView = UIImageView(image: swiftLogoImage)
        return myImageView
    }()
    
    private var lable: UILabel = {
        let lable  = UILabel()
        lable.text = "Authorization"
        lable.textAlignment = .center
        lable.textColor = .black
        lable.backgroundColor = .green
        return lable
    }()
    
    private var fieldLogin: UITextField = {
        let field1 = UITextField()
        field1.backgroundColor = .gray
        field1.textColor = .black
        field1.text = "Login"
        return field1
    }()
    
    private var fieldPassword: UITextField = {
        let field1 = UITextField()
        field1.backgroundColor = .gray
        field1.textColor = .black
        field1.text = "Password"
        return field1
    }()
    
    private var button: UIButton = {
        let button = UIButton()
        button.setTitle("LogIN", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.red, for: .highlighted)
        button.backgroundColor = .blue
        return button
    }()
    
    private func setupViews(){
        view.addSubview(myImageView)
        view.addSubview(lable)
        view.addSubview(fieldLogin)
        view.addSubview(fieldPassword)
        view.addSubview(button)
        setupConstraints()
    }
    
    private func setupConstraints(){
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        lable.translatesAutoresizingMaskIntoConstraints = false
        fieldLogin.translatesAutoresizingMaskIntoConstraints = false
        fieldPassword.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            myImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            lable.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 20),
            lable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            lable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            fieldLogin.topAnchor.constraint(equalTo: lable.bottomAnchor, constant: 20),
            fieldLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fieldLogin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            fieldLogin.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            fieldPassword.topAnchor.constraint(equalTo: fieldLogin.bottomAnchor, constant: 20),
            fieldPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fieldPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            fieldPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            button.topAnchor.constraint(equalTo: fieldPassword.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    @objc func tap(){
        let tab1 = UINavigationController(rootViewController: FriendsViewController())
        let tab2 = UINavigationController(rootViewController: GroupViewController())
        
        tab1.tabBarItem.title = "Friends"
        tab2.tabBarItem.title = "Groups"
        
        let controllers = [tab1, tab2]
        
        let tabBarControllers = UITabBarController()
        tabBarControllers.viewControllers = controllers
        
        navigationController?.pushViewController(tabBarControllers, animated: true)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        setupViews()
    }


}

