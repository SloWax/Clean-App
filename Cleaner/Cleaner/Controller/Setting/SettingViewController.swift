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
    
    let pushLabel: UILabel = {
        let label = UILabel()
        label.text = "Push 알림"
        label.font = Design.nomalSize
        return label
    }()
    private let pushSwitch = UISwitch()
    private let pushLayer = CALayer()
    
    let eMailLabel: UILabel = {
        let label = UILabel()
        label.text = "E-mail 알림"
        label.font = Design.nomalSize
        return label
    }()
    private let emailSwitch = UISwitch()
    private let emailLayer = CALayer()
    
    let smsLabel: UILabel = {
        let label = UILabel()
        label.text = "톡/문자 알림"
        label.font = Design.nomalSize
        return label
    }()
    private let smsSwitch = UISwitch()
    private let smsLayer = CALayer()
    
    let eventLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = Design.nomalSize
        return label
    }()
    private let eventSwitch = UISwitch()
    private let eventLayer = CALayer()
    
    private let secondContainerView: UIView = {
            let view = UIView()
            view.backgroundColor = .blue
            return view
        }()
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
        
    }
    private func setLayout() {
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: (view.frame.height - (view.safeAreaInsets.top + view.safeAreaInsets.bottom)) * 0.35)
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
        
        containerView.addSubview(eMailLabel)
        containerView.addSubview(emailSwitch)
        
        containerView.addSubview(smsLabel)
        containerView.addSubview(smsSwitch)
        
        containerView.addSubview(eventLabel)
        containerView.addSubview(eventSwitch)
        setContainerLayout()
    }
    private func setContainerLayout() {
        
        pushLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pushLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Design.titlePadding),
            pushLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Design.titlePadding)
        ])
        
        pushSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pushSwitch.centerYAnchor.constraint(equalTo: pushLabel.centerYAnchor),
            pushSwitch.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Design.titlePadding)
        ])
        
        eMailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eMailLabel.topAnchor.constraint(equalTo: pushLabel.bottomAnchor, constant: Design.padding),
            eMailLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Design.titlePadding)
        ])
        
        emailSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailSwitch.centerYAnchor.constraint(equalTo: eMailLabel.centerYAnchor),
            emailSwitch.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Design.titlePadding)
        ])
        
        smsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            smsLabel.topAnchor.constraint(equalTo: eMailLabel.bottomAnchor, constant: Design.padding),
            smsLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Design.titlePadding)
        ])
        
        smsSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            smsSwitch.centerYAnchor.constraint(equalTo: smsLabel.centerYAnchor),
            smsSwitch.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Design.titlePadding)
        ])
        
        eventLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eventLabel.topAnchor.constraint(equalTo: smsLabel.bottomAnchor, constant: Design.padding),
            eventLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Design.titlePadding)
        ])
        
        eventSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eventSwitch.centerYAnchor.constraint(equalTo: eventLabel.centerYAnchor),
            eventSwitch.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Design.titlePadding)
        ])
    }
}
