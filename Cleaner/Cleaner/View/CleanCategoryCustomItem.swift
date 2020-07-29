//
//  CleanCategoryCustomItem.swift
//  Cleaner
//
//  Created by 표건욱 on 2020/08/05.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class CleanCategoryCustomItem: UICollectionViewCell {
    
    static let identifier = "CleanCategoryCustomItem"
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLabel() {
        label.font = UIFont.systemFont(ofSize: 16)
        contentView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

}
