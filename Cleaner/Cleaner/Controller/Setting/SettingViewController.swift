//
//  SettingViewController.swift
//  Cleaner
//
//  Created by 표건욱 on 2020/08/03.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "설정"
        label.textAlignment = .left
        label.font = Design.boldLargeSize
        return label
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let pushLabel: UILabel = {
        let label = UILabel()
        label.text = "Push 알림"
        label.font = Design.nomalSize
        return label
    }()
    private let pushSwitch = UISwitch()
    private let pushLayer = CALayer()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "E-mail 알림"
        label.font = Design.nomalSize
        return label
    }()
    private let emailSwitch = UISwitch()
    private let emailLayer = CALayer()
    
    private let smsLabel: UILabel = {
        let label = UILabel()
        label.text = "톡/문자 알림"
        label.font = Design.nomalSize
        return label
    }()
    private let smsSwitch = UISwitch()
    private let smsLayer = CALayer()
    
    private let eventLabel: UILabel = {
        let label = UILabel()
        label.text = "이벤트 혜택 Push 알림"
        label.font = Design.nomalSize
        return label
    }()
    private let eventSwitch = UISwitch()
    private let eventLayer = CALayer()
    
    private let secondContainerView = UIView()
    
    private let profileView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "다운로드")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = image
        return imageView
    }()
    
    private let idLabel: UILabel = {
        let label = UILabel()
        label.text = "아이디"
        label.font = Design.nomalSize
        return label
    }()
    private let myIdLabel: UILabel = {
        let label = UILabel()
        label.text = "cleaning@clean.com"
        label.font = Design.nomalSize
        label.textColor = .darkGray
        return label
    }()
    private let idLayer = CALayer()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = Design.nomalSize
        return label
    }()
    private let myPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "*******"
        label.font = Design.nomalSize
        label.textColor = .darkGray
        return label
    }()
    private let passwordEditButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = Design.smallSize
        button.setTitle("수정", for: .normal)
        return button
    }()
    private let passwordLayer = CALayer()
    
    private let phoneNumLabel: UILabel = {
        let label = UILabel()
        label.text = "휴대폰 번호"
        label.font = Design.nomalSize
        return label
    }()
    private let myPhoneNumLabel: UILabel = {
        let label = UILabel()
        label.text = "010-XXXX-XXXX"
        label.font = Design.nomalSize
        label.textColor = .darkGray
        return label
    }()
    private let phoneNumEditBotton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = Design.smallSize
        button.setTitle("수정", for: .normal)
        return button
    }()
    private let phoneLayer = CALayer()
    
    private let advancedSetupButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Design.nomalSize
        button.setTitle("고급설정관리", for: .normal)
        return button
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let width = containerView.frame.width - Design.padding - 5
        
        pushLayer.backgroundColor = UIColor.lightGray.cgColor
        pushLayer.frame = CGRect(x: 0,
                                   y: Design.padding,
                                   width: width,
                                   height: Design.borderWidth
        )
        pushLabel.layer.addSublayer(pushLayer)
        
        emailLayer.backgroundColor = UIColor.lightGray.cgColor
        emailLayer.frame = CGRect(x: 0,
                                   y: Design.padding,
                                   width: width,
                                   height: Design.borderWidth
        )
        emailLabel.layer.addSublayer(emailLayer)
        
        smsLayer.backgroundColor = UIColor.lightGray.cgColor
        smsLayer.frame = CGRect(x: 0,
                                   y: Design.padding,
                                   width: width,
                                   height: Design.borderWidth
        )
        smsLabel.layer.addSublayer(smsLayer)
        
        eventLayer.backgroundColor = UIColor.lightGray.cgColor
        eventLayer.frame = CGRect(x: 0,
                                   y: Design.padding,
                                   width: width,
                                   height: Design.borderWidth
        )
        eventLabel.layer.addSublayer(eventLayer)
        
        
        idLayer.backgroundColor = UIColor.lightGray.cgColor
        idLayer.frame = CGRect(x: 0,
                                   y: Design.padding,
                                   width: width,
                                   height: Design.borderWidth
        )
        idLabel.layer.addSublayer(idLayer)
        
        passwordLayer.backgroundColor = UIColor.lightGray.cgColor
        passwordLayer.frame = CGRect(x: 0,
                                   y: Design.padding,
                                   width: width,
                                   height: Design.borderWidth
        )
        passwordLabel.layer.addSublayer(passwordLayer)
        
        phoneLayer.backgroundColor = UIColor.lightGray.cgColor
        phoneLayer.frame = CGRect(x: 0,
                                   y: Design.padding,
                                   width: width,
                                   height: Design.borderWidth
        )
        phoneNumLabel.layer.addSublayer(phoneLayer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    private func setUI() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
        
        view.addSubview(containerView)
        setContainer()
        
        view.addSubview(secondContainerView)
        setSecondContainer()
    }
    private func setLayout() {
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: (view.frame.height - (view.safeAreaInsets.top + view.safeAreaInsets.bottom)) * 0.3)
        ])
        
        secondContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondContainerView.topAnchor.constraint(equalTo: containerView.bottomAnchor),
            secondContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            secondContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            secondContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    private func setContainer() {
        containerView.addSubview(pushLabel)
        containerView.addSubview(pushSwitch)
        
        containerView.addSubview(emailLabel)
        containerView.addSubview(emailSwitch)
        
        containerView.addSubview(smsLabel)
        containerView.addSubview(smsSwitch)
        
        containerView.addSubview(eventLabel)
        containerView.addSubview(eventSwitch)
        setContainerLayout()
    }
    private func setSecondContainer() {
        secondContainerView.addSubview(profileView)
        
        secondContainerView.addSubview(idLabel)
        secondContainerView.addSubview(myIdLabel)
        
        secondContainerView.addSubview(passwordLabel)
        secondContainerView.addSubview(myPasswordLabel)
        passwordEditButton.addTarget(self, action: #selector(editButtonFunction(_:)), for: .touchUpInside)
        secondContainerView.addSubview(passwordEditButton)
        
        secondContainerView.addSubview(phoneNumLabel)
        secondContainerView.addSubview(myPhoneNumLabel)
        phoneNumEditBotton.addTarget(self, action: #selector(editButtonFunction(_:)), for: .touchUpInside)
        secondContainerView.addSubview(phoneNumEditBotton)
        
        advancedSetupButton.addTarget(self, action: #selector(advancedSetupPush(_:)), for: .touchUpInside)
        secondContainerView.addSubview(advancedSetupButton)
        setSecondContainerLayout()
    }
    private func setContainerLayout() {
        pushLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pushLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Design.padding),
            pushLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Design.padding)
        ])
        
        pushSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pushSwitch.bottomAnchor.constraint(equalTo: pushLabel.bottomAnchor),
            pushSwitch.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Design.titlePadding)
        ])
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: pushLabel.bottomAnchor, constant: Design.padding),
            emailLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Design.padding)
        ])
        
        emailSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailSwitch.bottomAnchor.constraint(equalTo: emailLabel.bottomAnchor),
            emailSwitch.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Design.titlePadding)
        ])
        
        smsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            smsLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: Design.padding),
            smsLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Design.padding)
        ])
        
        smsSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            smsSwitch.bottomAnchor.constraint(equalTo: smsLabel.bottomAnchor),
            smsSwitch.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Design.titlePadding)
        ])
        
        eventLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eventLabel.topAnchor.constraint(equalTo: smsLabel.bottomAnchor, constant: Design.padding),
            eventLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Design.padding)
        ])
        
        eventSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eventSwitch.bottomAnchor.constraint(equalTo: eventLabel.bottomAnchor),
            eventSwitch.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Design.titlePadding)
        ])
    }
    private func setSecondContainerLayout() {
        let size  = view.frame.height / 8
        profileView.layer.cornerRadius = size / 2
        profileView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: secondContainerView.topAnchor, constant: Design.padding),
            profileView.leadingAnchor.constraint(equalTo: secondContainerView.leadingAnchor, constant: Design.titlePadding),
            profileView.widthAnchor.constraint(equalToConstant: size),
            profileView.heightAnchor.constraint(equalToConstant: size)
        ])
        
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: Design.padding),
            idLabel.leadingAnchor.constraint(equalTo: secondContainerView.leadingAnchor, constant: Design.padding),
            idLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        myIdLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myIdLabel.centerYAnchor.constraint(equalTo: idLabel.centerYAnchor),
            myIdLabel.leadingAnchor.constraint(equalTo: idLabel.trailingAnchor)
        ])
        
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: Design.padding),
            passwordLabel.leadingAnchor.constraint(equalTo: secondContainerView.leadingAnchor, constant: Design.padding),
            passwordLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        myPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myPasswordLabel.centerYAnchor.constraint(equalTo: passwordLabel.centerYAnchor),
            myPasswordLabel.leadingAnchor.constraint(equalTo: passwordLabel.trailingAnchor)
        ])
        
        passwordEditButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordEditButton.centerYAnchor.constraint(equalTo: myPasswordLabel.centerYAnchor),
            passwordEditButton.trailingAnchor.constraint(equalTo: secondContainerView.trailingAnchor,
                                                         constant: -Design.titlePadding
            )
        ])
        
        phoneNumLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneNumLabel.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: Design.padding),
            phoneNumLabel.leadingAnchor.constraint(equalTo: secondContainerView.leadingAnchor, constant: Design.padding),
            phoneNumLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        myPhoneNumLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myPhoneNumLabel.centerYAnchor.constraint(equalTo: phoneNumLabel.centerYAnchor),
            myPhoneNumLabel.leadingAnchor.constraint(equalTo: phoneNumLabel.trailingAnchor)
        ])
        
        phoneNumEditBotton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneNumEditBotton.centerYAnchor.constraint(equalTo: myPhoneNumLabel.centerYAnchor),
            phoneNumEditBotton.trailingAnchor.constraint(equalTo: secondContainerView.trailingAnchor,
                                                         constant: -Design.titlePadding
            )
        ])
        
        advancedSetupButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            advancedSetupButton.topAnchor.constraint(equalTo: phoneNumLabel.bottomAnchor, constant: Design.padding),
            advancedSetupButton.leadingAnchor.constraint(equalTo: secondContainerView.leadingAnchor, constant: Design.padding)
        ])
    }
    @objc func advancedSetupPush(_ sender: UIButton) {
        let advancedVC = advancedSetupViewController()
        navigationController?.pushViewController(advancedVC, animated: true)
    }
    @objc func editButtonFunction(_ sender: UIButton) {
        switch sender {
        case passwordEditButton:
            print("password")
        case phoneNumEditBotton:
            print("phoneNum")
        default:
            fatalError()
        }
    }
}
