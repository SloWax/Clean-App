//
//  CleanCategoryCustomItem.swift
//  Cleaner
//
//  Created by 표건욱 on 2020/08/05.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class ArticleCustomItem: UICollectionViewCell {
    
    static let identifier = "ArticleCustomItem"
    
    let imageView = UIImageView()
    private let titleView = UIView()
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setImageView()
        setTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setImageView() {
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = Design.borderWidth
        imageView.layer.cornerRadius = Design.cornerRadius
        contentView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setTitle() {
        titleView.layer.borderWidth = Design.borderWidth
        titleView.layer.cornerRadius = Design.cornerRadius
        titleView.backgroundColor = .systemBackground
        imageView.addSubview(titleView)
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleView.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 0.25),
            titleView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            titleView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
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
