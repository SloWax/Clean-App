//
//  CleanCardDetailViewController.swift
//  Cleaner
//
//  Created by 표건욱 on 2020/08/09.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class CleanCardDetailViewController: UIViewController {
    
    let backItem: UIBarButtonItem = {
        let button = UIBarButtonItem()
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = Design.boldHeaderSize
        return label
    }()
    let simpleExplain: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = Design.nomalSize
        label.textColor = .darkGray
        return label
    }()
    
    private let bannerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Design.cornerRadius
        view.layer.borderWidth = Design.menuBorderWidth
        return view
    }()
    
    let bannerTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Design.boldLargeSize
        label.textColor = .black
        label.alpha = 0.75
        return label
    }()
    let bannerDateLabel: UILabel = {
        let label = UILabel()
        label.font = Design.smallSize
        label.textColor = .darkGray
        return label
    }()
    private let bannerSwitch = UISwitch()
    
    let bannerRepeatLabel: UILabel = {
        let label = UILabel()
        label.text = "반복: \("6")개월"
        label.font = Design.nomalSize
        return label
    }()
    private let RepeatButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = Design.nomalSize
        button.setTitle("수정", for: .normal)
        return button
    }()
    private let repeatLayer = CALayer()
    
    let bannerOfficerLabel: UILabel = {
        let label = UILabel()
        label.text = "청소 담당: \("미지정")"
        label.font = Design.nomalSize
        return label
    }()
    private let officerButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = Design.nomalSize
        button.setTitle("수정", for: .normal)
        return button
    }()
    private let officerLayer = CALayer()
    
    let bannerScheduleLabel: UILabel = {
        let label = UILabel()
        label.text = "스케줄: \("2020.07.23")"
        label.font = Design.nomalSize
        return label
    }()
    private let scheduleButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = Design.nomalSize
        button.setTitle("등록", for: .normal)
        return button
    }()
    private let scheduleLayer = CALayer()
    
    let bannerTitleEditLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = Design.nomalSize
        return label
    }()
    private let titleEditButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = Design.nomalSize
        button.setTitle("수정", for: .normal)
        return button
    }()
    private let titleEditLayer = CALayer()
    
    private let bannerMemoView: UITextView = {
        let textView = UITextView()
        textView.layer.borderWidth = Design.borderWidth
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.text = "memo"
        textView.textAlignment = .left
        return textView
    }()
    
    private let completeButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = Design.menuBorderWidth
        button.layer.cornerRadius = Design.cornerRadius
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = Design.boldLargeSize
        button.setTitle("청소 완료!", for: .normal)
        return button
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let width = bannerView.frame.width - Design.padding - 5
        repeatLayer.backgroundColor = UIColor.lightGray.cgColor
        repeatLayer.frame = CGRect(x: 0,
                                   y: Design.padding,
                                   width: width,
                                   height: Design.borderWidth
        )
        bannerRepeatLabel.layer.addSublayer(repeatLayer)
        
        officerLayer.backgroundColor = UIColor.lightGray.cgColor
        officerLayer.frame = CGRect(x: 0,
                                    y: Design.padding,
                                    width: width,
                                    height: Design.borderWidth
        )
        bannerOfficerLabel.layer.addSublayer(officerLayer)
        
        scheduleLayer.backgroundColor = UIColor.lightGray.cgColor
        scheduleLayer.frame = CGRect(x: 0,
                                   y: Design.padding,
                                   width: width,
                                   height: Design.borderWidth
        )
        bannerScheduleLabel.layer.addSublayer(scheduleLayer)
        
        titleEditLayer.backgroundColor = UIColor.lightGray.cgColor
        titleEditLayer.frame = CGRect(x: 0,
                                   y: Design.padding,
                                   width: width,
                                   height: Design.borderWidth
        )
        bannerTitleEditLabel.layer.addSublayer(titleEditLayer)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setViewLayout()
        setBannerLayout()
    }
    private func setUI() {
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.backBarButtonItem = backItem
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        
        view.addSubview(titleLabel)
        view.addSubview(simpleExplain)
        view.addSubview(bannerView)
        
        setFuncSwitchAndButton()
        bannerView.addSubview(bannerTitleLabel)
        bannerView.addSubview(bannerDateLabel)
        
        bannerView.addSubview(bannerRepeatLabel)
        bannerView.addSubview(bannerOfficerLabel)
        bannerView.addSubview(bannerScheduleLabel)
        bannerView.addSubview(bannerTitleEditLabel)
        
        bannerView.addSubview(bannerMemoView)
    }
    private func setViewLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Design.textPadding)
        ])
        
        simpleExplain.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            simpleExplain.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Design.textPadding),
            simpleExplain.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Design.textPadding)
        ])
        
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: simpleExplain.bottomAnchor, constant: Design.padding),
            bannerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                constant: Design.textPadding),
            bannerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                 constant: -Design.textPadding),
            bannerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                               constant: -Design.padding)
        ])
    }
    private func setBannerLayout() {
        bannerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bannerTitleLabel.topAnchor.constraint(equalTo: bannerView.topAnchor, constant: Design.titlePadding),
            bannerTitleLabel.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: Design.titlePadding)
        ])
        
        bannerDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bannerDateLabel.topAnchor.constraint(equalTo: bannerTitleLabel.bottomAnchor, constant: Design.titlePadding),
            bannerDateLabel.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: Design.titlePadding)
        ])
        
        bannerSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bannerSwitch.centerYAnchor.constraint(equalTo: bannerDateLabel.topAnchor),
            bannerSwitch.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor, constant: -Design.titlePadding)
        ])
        
        bannerRepeatLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bannerRepeatLabel.topAnchor.constraint(equalTo: bannerDateLabel.bottomAnchor, constant: Design.padding),
            bannerRepeatLabel.leadingAnchor.constraint(equalTo: bannerDateLabel.leadingAnchor, constant: Design.textPadding)
        ])
        
        RepeatButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            RepeatButton.centerYAnchor.constraint(equalTo: bannerRepeatLabel.centerYAnchor),
            RepeatButton.trailingAnchor.constraint(equalTo: bannerSwitch.trailingAnchor)
        ])
        
        bannerOfficerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bannerOfficerLabel.topAnchor.constraint(equalTo: bannerRepeatLabel.bottomAnchor, constant: Design.padding),
            bannerOfficerLabel.leadingAnchor.constraint(equalTo: bannerRepeatLabel.leadingAnchor)
        ])
        
        officerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            officerButton.centerYAnchor.constraint(equalTo: bannerOfficerLabel.centerYAnchor),
            officerButton.trailingAnchor.constraint(equalTo: bannerSwitch.trailingAnchor)
        ])
        
        bannerScheduleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bannerScheduleLabel.topAnchor.constraint(equalTo: bannerOfficerLabel.bottomAnchor, constant: Design.padding),
            bannerScheduleLabel.leadingAnchor.constraint(equalTo: bannerOfficerLabel.leadingAnchor)
        ])
        
        scheduleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scheduleButton.centerYAnchor.constraint(equalTo: bannerScheduleLabel.centerYAnchor),
            scheduleButton.trailingAnchor.constraint(equalTo: bannerSwitch.trailingAnchor)
        ])
        
        bannerTitleEditLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bannerTitleEditLabel.topAnchor.constraint(equalTo: bannerScheduleLabel.bottomAnchor, constant: Design.padding),
            bannerTitleEditLabel.leadingAnchor.constraint(equalTo: bannerScheduleLabel.leadingAnchor)
        ])
        
        titleEditButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleEditButton.centerYAnchor.constraint(equalTo: bannerTitleEditLabel.centerYAnchor),
            titleEditButton.trailingAnchor.constraint(equalTo: bannerSwitch.trailingAnchor)
        ])
        
        completeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            completeButton.widthAnchor.constraint(equalTo: bannerView.widthAnchor, multiplier: 0.5),
            completeButton.heightAnchor.constraint(equalTo: bannerView.heightAnchor, multiplier: 0.1),
            completeButton.centerXAnchor.constraint(equalTo: bannerView.centerXAnchor),
            completeButton.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: -Design.titlePadding)
        ])
        
        bannerMemoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bannerMemoView.topAnchor.constraint(equalTo: bannerTitleEditLabel.bottomAnchor, constant: Design.padding),
            bannerMemoView.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: Design.titlePadding),
            bannerMemoView.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor, constant: -Design.titlePadding),
            bannerMemoView.bottomAnchor.constraint(equalTo: completeButton.topAnchor, constant: -Design.padding)
        ])
    }
    private func setFuncSwitchAndButton() {
        bannerSwitch.addTarget(self, action: #selector(bannerSwitchFunction(_:)), for: .valueChanged)
        bannerView.addSubview(bannerSwitch)
        
        RepeatButton.addTarget(self, action: #selector(repeatFunction(_:)), for: .touchUpInside)
        bannerView.addSubview(RepeatButton)
        
        officerButton.addTarget(self, action: #selector(officerFunction(_:)), for: .touchUpInside)
        bannerView.addSubview(officerButton)
        
        scheduleButton.addTarget(self, action: #selector(scheduleFunction(_:)), for: .touchUpInside)
        bannerView.addSubview(scheduleButton)
        
        titleEditButton.addTarget(self, action: #selector(titleEditFunction(_:)), for: .touchUpInside)
        bannerView.addSubview(titleEditButton)
        
        completeButton.addTarget(self, action: #selector(completeFunction(_:)), for: .touchUpInside)
        bannerView.addSubview(completeButton)
    }
    @objc func bannerSwitchFunction(_ sender:UISwitch) {
        print(sender.isOn)
    }
    @objc func repeatFunction(_ sender: UIButton) {
        print("repeat")
    }
    @objc func officerFunction(_ sender: UIButton) {
        print("officer")
    }
    @objc func scheduleFunction(_ sender: UIButton) {
        print("schedule")
    }
    @objc func titleEditFunction(_ sender: UIButton) {
        print("titleEdit")
    }
    @objc func completeFunction(_ sender: UIButton) {
        print("complete")
        navigationController?.popViewController(animated: true)
    }
}
