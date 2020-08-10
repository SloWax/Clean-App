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
        label.font = Design.boldLargeSize
        return label
    }()
    
    private let searchBar = UISearchController(searchResultsController: nil)
    
    private let categoryScroll = UIScrollView()
    private let bathClean = UIButton()
    private let kitchenClean = UIButton()
    private let livingClean = UIButton()
    private let toiletClean = UIButton()
    private let othersClean = UIButton()
    private lazy var buttonArr : [UIButton] = [bathClean, kitchenClean, livingClean, toiletClean, othersClean]
    
    private lazy var articleCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ArticleCustomItem.self, forCellWithReuseIdentifier: ArticleCustomItem.identifier)
        return collectionView
    }()
    private let collectionBorder = CALayer()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionBorder.backgroundColor = UIColor.black.cgColor
        collectionBorder.frame = CGRect(x:0,
                                        y: categoryScroll.frame.maxY + Design.textPadding,
                                   width: articleCollection.frame.width,
                                   height: Design.menuBorderWidth)
        
        view.layer.addSublayer(collectionBorder)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        categoryScroll.contentSize = CGSize(width: othersClean.frame.maxX + Design.buttonPadding,
                                            height: categoryScroll.frame.height
        )
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    private func setUI(){
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
        navigationItem.searchController = searchBar
        
        setButton()
        categoryScroll.layer.borderWidth = Design.menuBorderWidth
        categoryScroll.layer.cornerRadius = Design.cornerRadius
        categoryScroll.alwaysBounceHorizontal = true
        view.addSubview(categoryScroll)
        
        view.addSubview(articleCollection)
        bathClean.titleLabel?.font = Design.boldNomalSize
    }
    private func setLayout() {
        
        categoryScroll.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryScroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            categoryScroll.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                    constant: Design.textPadding),
            categoryScroll.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                     constant: -Design.textPadding),
            categoryScroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                   constant: view.frame.height / 20)
        ])
        
        articleCollection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            articleCollection.topAnchor.constraint(equalTo: categoryScroll.bottomAnchor, constant: Design.textPadding),
            articleCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            articleCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            articleCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    private func setButton() {
        var index = 0
        
        bathClean.addTarget(self, action: #selector(bathFunction(_:)), for: .touchUpInside)
        kitchenClean.addTarget(self, action: #selector(kitchenFunction(_:)), for: .touchUpInside)
        livingClean.addTarget(self, action: #selector(livingFunction(_:)), for: .touchUpInside)
        toiletClean.addTarget(self, action: #selector(toiletFunction(_:)), for: .touchUpInside)
        othersClean.addTarget(self, action: #selector(othersFunction(_:)), for: .touchUpInside)
        
        buttonArr.forEach {
            $0.setTitle(cleanCategory[index], for: .normal)
            $0.setTitleColor(.darkGray, for: .normal)
            $0.titleLabel?.font = Design.nomalSize
            categoryScroll.addSubview($0)
            
            $0.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                $0.centerYAnchor.constraint(equalTo: categoryScroll.centerYAnchor),
                $0.widthAnchor.constraint(equalToConstant: (view.frame.width - 50) / 4)
            ])
            index += 1
        }
        
        NSLayoutConstraint.activate([
            bathClean.leadingAnchor.constraint(equalTo: categoryScroll.leadingAnchor, constant: Design.buttonPadding),
            kitchenClean.leadingAnchor.constraint(equalTo: bathClean.trailingAnchor, constant: Design.buttonPadding),
            livingClean.leadingAnchor.constraint(equalTo: kitchenClean.trailingAnchor, constant: Design.buttonPadding),
            toiletClean.leadingAnchor.constraint(equalTo: livingClean.trailingAnchor, constant: Design.buttonPadding),
            othersClean.leadingAnchor.constraint(equalTo: toiletClean.trailingAnchor, constant: Design.buttonPadding)
        ])
    }
    @objc func bathFunction(_ sender: UIButton) {
        var othersButton = buttonArr
        othersButton.remove(at: 0)
        setFont(othersButton)
        sender.titleLabel?.font = Design.boldNomalSize
    }
    @objc func kitchenFunction(_ sender: UIButton) {
        var othersButton = buttonArr
        othersButton.remove(at: 1)
        setFont(othersButton)
        sender.titleLabel?.font = Design.boldNomalSize
    }
    @objc func livingFunction(_ sender: UIButton) {
        var othersButton = buttonArr
        othersButton.remove(at: 2)
        setFont(othersButton)
        sender.titleLabel?.font = Design.boldNomalSize
    }
    @objc func toiletFunction(_ sender: UIButton) {
        var othersButton = buttonArr
        othersButton.remove(at: 3)
        setFont(othersButton)
        sender.titleLabel?.font = Design.boldNomalSize
    }
    @objc func othersFunction(_ sender: UIButton) {
        var othersButton = buttonArr
        othersButton.remove(at: 4)
        setFont(othersButton)
        sender.titleLabel?.font = Design.boldNomalSize
    }
    private func setFont(_ sender: [UIButton]) {
        sender.forEach {
            $0.titleLabel?.font = Design.nomalSize
        }
    }
}

extension CleaningMethodViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: ArticleCustomItem.identifier, for: indexPath) as? ArticleCustomItem else { fatalError() }
        item.label.text = cleanCategory[indexPath.item]
        item.imageView.image = UIImage(named: "test")
        return item
    }
}
extension CleaningMethodViewController: UICollectionViewDelegateFlowLayout {
  // 줄 간격
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return Design.padding
  }
  // 행 간격
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return Design.padding
  }
  // 테두리
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return Design.edge
  }
  // 아이템 사이즈
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let size = (collectionView.frame.width - (Design.edge.left + Design.edge.right) - (Design.padding * (Design.articleLineCount - 1))) / Design.articleLineCount
    return CGSize(width: size, height: size / 2.4)
  }
}
extension CleaningMethodViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productVC = ProductViewController()
        productVC.titleLabel.text = cleanCategory[indexPath.item]
        productVC.simpleExplain.text = cleanCategory[indexPath.item]
        productVC.explainImageView.image = UIImage(named: "test")
        productVC.detailExplain.text = "텍스트"
        navigationController?.pushViewController(productVC, animated: true)
    }
}
