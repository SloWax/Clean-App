//
//  CardDetailBannerCustomCell.swift
//  Cleaner
//
//  Created by 표건욱 on 2020/08/09.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class CardDetailBannerCustomCell: UITableViewCell {

    static let identifier = "CardDetailBannerCustomCell"
    
    let imageView2 = UIImageView()
    private let titleView = UIView()
    let label = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: Design.tableEdge)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setImageView()
        setTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setImageView() {
        imageView2.clipsToBounds = true
        imageView2.layer.borderWidth = Design.borderWidth
        imageView2.layer.cornerRadius = Design.cornerRadius
        contentView.addSubview(imageView2)
        
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView2.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setTitle() {
        titleView.layer.borderWidth = Design.borderWidth
        titleView.layer.cornerRadius = Design.cornerRadius
        titleView.backgroundColor = .systemBackground
        imageView2.addSubview(titleView)
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleView.heightAnchor.constraint(equalTo: imageView2.heightAnchor, multiplier: 0.25),
            titleView.leadingAnchor.constraint(equalTo: imageView2.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: imageView2.trailingAnchor),
            titleView.bottomAnchor.constraint(equalTo: imageView2.bottomAnchor)
        ])
        
        label.font = Design.boldNomalSize
        label.textColor = .darkGray
        titleView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: titleView.leadingAnchor, constant: Design.textPadding)
        ])
    }

}
