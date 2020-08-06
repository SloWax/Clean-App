//
//  CardDetailCustomCell.swift
//  Cleaner
//
//  Created by 표건욱 on 2020/08/09.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class CardDetailCustomCell: UITableViewCell {
    
    static let identifier = "CardDetailCustomCell"
    
    let titleLabel = UILabel()
    let repeatLabel = UILabel()
    let lastCleanDateLabel = UILabel()
    let pushToggleSwitch = UISwitch()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: Design.tableEdge)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = Design.menuBorderWidth
        contentView.layer.cornerRadius = Design.cornerRadius
        contentView.backgroundColor = .white
        
        setTitleLabel()
        setRepeatLabel()
        setExplainLabel()
        setPushToggleSwitch()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setTitleLabel() {
        titleLabel.font = Design.boldNomalSize
        titleLabel.textColor = .black
        titleLabel.alpha = 0.75
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -Design.buttonPadding),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Design.titlePadding)
        ])
        
    }
    func setRepeatLabel() {
        repeatLabel.font = Design.smallSize
        repeatLabel.textColor = .lightGray
        contentView.addSubview(repeatLabel)
        
        repeatLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            repeatLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: Design.textPadding),
            repeatLabel.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor)
        ])
    }
    
    func setExplainLabel() {
        lastCleanDateLabel.font = Design.smallSize
        lastCleanDateLabel.textColor = .darkGray
        contentView.addSubview(lastCleanDateLabel)
        
        lastCleanDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lastCleanDateLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: Design.buttonPadding),
            lastCleanDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Design.titlePadding)
        ])
    }
    
    func setPushToggleSwitch() {
        pushToggleSwitch.addTarget(self, action: #selector(switchFuntion(_:)), for: .valueChanged)
        contentView.addSubview(pushToggleSwitch)
        
        pushToggleSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pushToggleSwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            pushToggleSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Design.buttonPadding)
        ])
        
    }
    @objc func switchFuntion(_ sender: UISwitch) {
        if sender.isOn == true {
            print("true")
        } else {
            print("false")
        }
    }
}
