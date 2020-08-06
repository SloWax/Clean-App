//
//  ProductViewController.swift
//  Cleaner
//
//  Created by 표건욱 on 2020/08/07.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    private let backItem: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "청소 가이드"
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
    
    private let viewScroll = UIScrollView()
    
    let explainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = Design.borderWidth
        imageView.layer.cornerRadius = Design.cornerRadius
        return imageView
    }()
    
    let detailExplain: UITextView = {
        let textView = UITextView()
        textView.font = Design.nomalSize
        textView.textColor = .darkGray
        textView.isScrollEnabled = false
        return textView
    }()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewScroll.contentSize = CGSize(width: viewScroll.frame.width,
                                        height: detailExplain.frame.maxY + Design.padding
        )
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
        
        view.addSubview(titleLabel)
        view.addSubview(simpleExplain)
        view.addSubview(viewScroll)
        viewScroll.addSubview(explainImageView)
        viewScroll.addSubview(detailExplain)
    }
    private func setLayout() {
        
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
        
        viewScroll.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewScroll.topAnchor.constraint(equalTo: simpleExplain.bottomAnchor, constant: Design.textPadding),
            viewScroll.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            viewScroll.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            viewScroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        explainImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            explainImageView.topAnchor.constraint(equalTo: viewScroll.topAnchor,
                                                  constant: Design.textPadding),
            explainImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                      constant: Design.textPadding),
            explainImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                       constant: -Design.textPadding),
            explainImageView.heightAnchor.constraint(equalTo: explainImageView.widthAnchor, multiplier: 3/4)
        ])
        
        detailExplain.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailExplain.topAnchor.constraint(equalTo: explainImageView.bottomAnchor,
                                               constant: Design.textPadding),
            detailExplain.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                   constant: Design.textPadding),
            detailExplain.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                    constant: -Design.textPadding)
        ])
    }
}
