//
//  CleaningMethodViewController.swift
//  Cleaner
//
//  Created by 표건욱 on 2020/08/03.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class CleaningMethodViewController: UIViewController {
    
    private let cleanCategory = ["욕실 청소", "주방 청소", "거실 청소", "화장실 청소", "기타 청소"]
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "청소 가이드"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let searchBar = UISearchController(searchResultsController: nil)
    
    private lazy var categoryCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = MenuInsets.padding
        layout.sectionInset = MenuInsets.edge
        let width = (view.frame.width - (MenuInsets.edge.left + MenuInsets.edge.right) - (MenuInsets.padding * 3)) / MenuInsets.showItemCount
        layout.itemSize = CGSize(width: width, height: view.frame.height / 20)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.layer.borderWidth = 0.2
        collectionView.layer.cornerRadius = 10
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CleanCategoryCustomItem.self, forCellWithReuseIdentifier: CleanCategoryCustomItem.identifier)
        return collectionView
    }()
    
    private lazy var methodTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(CleanMethodCustomCell.self, forCellReuseIdentifier: CleanMethodCustomCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        autoLayout()
    }
    func setUI(){
        navigationItem.titleView = titleLabel
        navigationItem.searchController = searchBar
        
        view.addSubview(categoryCollection)
    }
    func autoLayout() {
        
        categoryCollection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            categoryCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            categoryCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            categoryCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.height/20)
        ])
        
        methodTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            methodTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
        ])
    }
}

extension CleaningMethodViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cleanCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: CleanCategoryCustomItem.identifier, for: indexPath) as? CleanCategoryCustomItem else { fatalError() }
        item.label.text = cleanCategory[indexPath.item]
        return item
    }
}
extension CleaningMethodViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        label.font = UIFont.boldSystemFont(ofSize: 16)
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        label.font = UIFont.systemFont(ofSize: 16)
    }
}
extension CleaningMethodViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CleanMethodCustomCell.identifier, for: indexPath) as? CleanMethodCustomCell else { fatalError() }
        return cell
    }
}
