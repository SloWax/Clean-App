//
//  CardDetailViewController.swift
//  Cleaner
//
//  Created by 표건욱 on 2020/08/09.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class CardDetailViewController: UIViewController {
    
    private let backItem: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "체크리스트"
        return button
    }()
    
    private let setButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gear"), for: .normal)
        button.tintColor = .black
        return button
    }()
    private let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.tintColor = .black
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
    
    private lazy var cardDetailListTable: UITableView = {
        let table = UITableView()
        table.rowHeight = 80
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.register(CardDetailCustomCell.self, forCellReuseIdentifier: CardDetailCustomCell.identifier)
        table.register(CardDetailBannerCustomCell.self, forCellReuseIdentifier: CardDetailBannerCustomCell.identifier)
        return table
    }()
    
    private let naviLayer = CALayer()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        naviLayer.backgroundColor = UIColor.black.cgColor
        naviLayer.frame = CGRect(x:0,
                                 y: simpleExplain.frame.maxY + Design.textPadding,
                                 width: view.frame.width,
                                 height: Design.menuBorderWidth)
        
        view.layer.addSublayer(naviLayer)
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
        
        setButtons()
        view.addSubview(titleLabel)
        view.addSubview(simpleExplain)
        view.addSubview(cardDetailListTable)
    }
    private func setLayout() {
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plusButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            plusButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Design.textPadding)
        ])
        
        setButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            setButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            setButton.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -Design.buttonPadding)
        ])
        
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
        
        cardDetailListTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardDetailListTable.topAnchor.constraint(equalTo: simpleExplain.bottomAnchor, constant: Design.textPadding),
            cardDetailListTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            cardDetailListTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            cardDetailListTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    private func setButtons() {
        setButton.addTarget(self, action: #selector(setFuntion(_:)), for: .touchUpInside)
        view.addSubview(setButton)
        
        plusButton.addTarget(self, action: #selector(plusFuntion(_:)), for: .touchUpInside)
        view.addSubview(plusButton)
    }
    @objc func setFuntion(_ sender: UIButton) {
        print("set")
    }
    @objc func plusFuntion(_ sender: UIButton) {
        print("plus")
    }
}

extension CardDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CardDetailCustomCell.identifier, for: indexPath) as? CardDetailCustomCell else { fatalError() }
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY.MM.dd"
        cell.selectionStyle = .none
        cell.titleLabel.text = "커튼 빨래"
        cell.repeatLabel.text = "반복: \("6")개월에 한번"
        cell.lastCleanDateLabel.text = "마지막 청소일: \(formatter.string(from: Date()))"
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CardDetailBannerCustomCell.identifier, for: indexPath) as? CardDetailBannerCustomCell else { fatalError() }
            cell.imageView2.image = UIImage(named: "test")
            cell.label.text = "커튼 빨래"
            return cell
        }
    }
    
    
}
extension CardDetailViewController: UITableViewDelegate {
    
}
