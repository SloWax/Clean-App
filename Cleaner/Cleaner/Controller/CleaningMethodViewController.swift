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
    
    private let categoryScroll = UIScrollView()
    private let bathClean = UIButton()
    private let kitchenClean = UIButton()
    private let livingClean = UIButton()
    private let toiletClean = UIButton()
    private let othersClean = UIButton()
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        categoryScroll.contentSize = CGSize(width: othersClean.frame.maxX + 5, height: categoryScroll.frame.height)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        autoLayout()
    }
    func setUI(){
        navigationItem.titleView = titleLabel
        navigationItem.searchController = searchBar
        
        setButton()
        categoryScroll.backgroundColor = .red
        categoryScroll.alwaysBounceHorizontal = true
        view.addSubview(categoryScroll)
    }
    func autoLayout() {
        
        categoryScroll.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryScroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            categoryScroll.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            categoryScroll.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            categoryScroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.height/20)
        ])
    }
    func setButton() {
        let buttonArr = [bathClean, kitchenClean, livingClean, toiletClean, othersClean]
        var index = 0
        
        buttonArr.forEach {
            $0.setTitle(cleanCategory[index], for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16)
            categoryScroll.addSubview($0)
            
            $0.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                $0.centerYAnchor.constraint(equalTo: categoryScroll.centerYAnchor),
                $0.widthAnchor.constraint(equalToConstant: (view.frame.width - 50)/4)
            ])
            index += 1
        }
        
        NSLayoutConstraint.activate([
            bathClean.leadingAnchor.constraint(equalTo: categoryScroll.leadingAnchor, constant: 5),
            kitchenClean.leadingAnchor.constraint(equalTo: bathClean.trailingAnchor, constant: 10),
            livingClean.leadingAnchor.constraint(equalTo: kitchenClean.trailingAnchor, constant: 10),
            toiletClean.leadingAnchor.constraint(equalTo: livingClean.trailingAnchor, constant: 10),
            othersClean.leadingAnchor.constraint(equalTo: toiletClean.trailingAnchor, constant: 10)
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
