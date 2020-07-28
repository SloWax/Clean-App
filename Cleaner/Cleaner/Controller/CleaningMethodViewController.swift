//
//  CleaningMethodViewController.swift
//  Cleaner
//
//  Created by 표건욱 on 2020/08/03.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class CleaningMethodViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "청소 가이드"
        label.textAlignment = .left
        return label
    }()
    
    private let searchBar = UISearchController(searchResultsController: nil)
    
    private lazy var categoryCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        return collectionView
    }()
    
    
    private let cleanCategory = ["욕실 청소", "주방 청소", "거실 청소", "화장실 청소", "기타 청소"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        
        
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
            categoryCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            categoryCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
        ])
    }
}

extension CleaningMethodViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cleanCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        return item
    }
    
}
