//
//  CheckListCustomCell.swift
//  Cleaner
//
//  Created by 표건욱 on 2020/08/08.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class CheckListCustomCell: UITableViewCell {
    
    static let identifier = "CheckListCustomCell"
    
    let titleLabel = UILabel()
    let explainLabel = UILabel()
    
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
        setExplainLabel()
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
    func setExplainLabel() {
        explainLabel.font = Design.smallSize
        explainLabel.textColor = .darkGray
        contentView.addSubview(explainLabel)
        
        explainLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            explainLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: Design.buttonPadding),
            explainLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Design.titlePadding)
        ])
    }
}
