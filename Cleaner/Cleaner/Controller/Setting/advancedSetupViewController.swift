//
//  advancedSetupViewController.swift
//  Cleaner
//
//  Created by 표건욱 on 2020/08/16.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class advancedSetupViewController: UIViewController {
    
    private let backItem: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "설정"
        return button
    }()
    
    private let personalInfoButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Design.nomalSize
        button.setTitle("개인정보처리방침", for: .normal)
        return button
    }()
    private let personalInfoLayer = CALayer()
    
    private let agreementViewButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Design.nomalSize
        button.setTitle("서비스이용약관", for: .normal)
        return button
    }()
    private let agreementLayer = CALayer()
    
    private let logoutButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Design.nomalSize
        button.setTitle("로그아웃", for: .normal)
        return button
    }()
    private let logoutLayer = CALayer()
    
    private let dropoutButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Design.nomalSize
        button.setTitle("회원 탈퇴", for: .normal)
        return button
    }()
    private let dropoutLayer = CALayer()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let width = view.frame.width - Design.padding - 5
        
        personalInfoLayer.backgroundColor = UIColor.lightGray.cgColor
        personalInfoLayer.frame = CGRect(x: 0,
                                   y: Design.padding,
                                   width: width,
                                   height: Design.borderWidth
        )
        personalInfoButton.layer.addSublayer(personalInfoLayer)
        
        agreementLayer.backgroundColor = UIColor.lightGray.cgColor
        agreementLayer.frame = CGRect(x: 0,
                                   y: Design.padding,
                                   width: width,
                                   height: Design.borderWidth
        )
        agreementViewButton.layer.addSublayer(agreementLayer)
        
        logoutLayer.backgroundColor = UIColor.lightGray.cgColor
        logoutLayer.frame = CGRect(x: 0,
                                   y: Design.padding,
                                   width: width,
                                   height: Design.borderWidth
        )
        logoutButton.layer.addSublayer(logoutLayer)
        
        dropoutLayer.backgroundColor = UIColor.lightGray.cgColor
        dropoutLayer.frame = CGRect(x: 0,
                                   y: Design.padding,
                                   width: width,
                                   height: Design.borderWidth
        )
        dropoutButton.layer.addSublayer(dropoutLayer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
    }
    private func setUI() {
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.backBarButtonItem = backItem
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        
        personalInfoButton.addTarget(self, action: #selector(buttonFunction(_:)), for: .touchUpInside)
        agreementViewButton.addTarget(self, action: #selector(buttonFunction(_:)), for: .touchUpInside)
        logoutButton.addTarget(self, action: #selector(buttonFunction(_:)), for: .touchUpInside)
        dropoutButton.addTarget(self, action: #selector(buttonFunction(_:)), for: .touchUpInside)
        view.addSubview(personalInfoButton)
        view.addSubview(agreementViewButton)
        view.addSubview(logoutButton)
        view.addSubview(dropoutButton)
    }
    private func setLayout() {
        
        agreementViewButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            agreementViewButton.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -Design.titlePadding / 2),
            agreementViewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Design.padding)
        ])
        
        personalInfoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            personalInfoButton.bottomAnchor.constraint(equalTo: agreementViewButton.topAnchor, constant: -Design.titlePadding),
            personalInfoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Design.padding)
        ])
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoutButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: Design.titlePadding / 2),
            logoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Design.padding)
        ])
        
        dropoutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dropoutButton.topAnchor.constraint(equalTo: logoutButton.bottomAnchor, constant: Design.titlePadding),
            dropoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Design.padding)
        ])
    }
    @objc func buttonFunction(_ sender: UIButton) {
        switch sender {
        case personalInfoButton:
            print("info")
        case agreementViewButton:
            print("agree")
        case logoutButton:
            print("logout")
        case dropoutButton:
            print("dropput")
        default:
            fatalError()
        }
    }
}
