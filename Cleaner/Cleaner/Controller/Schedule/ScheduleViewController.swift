//
//  ScheduleViewController.swift
//  Cleaner
//
//  Created by 표건욱 on 2020/08/03.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    private let checkCustomLabel: UIButton = {
        let button = UIButton()
        button.setTitle("체크리스트", for: .normal)
        button.titleLabel?.textAlignment = .left
        return button
    }()
    private lazy var checkButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.customView = checkCustomLabel
        return button
    }()
    
    private let scheduleCustomLabel: UIButton = {
        let button = UIButton()
        button.setTitle("스케줄표", for: .normal)
        button.titleLabel?.textAlignment = .left
        return button
    }()
    private lazy var scheduleButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.customView = scheduleCustomLabel
        return button
    }()
    
    private let setCustomLabel: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gear"), for: .normal)
        button.tintColor = .black
        return button
    }()
    private lazy var setButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.customView = setCustomLabel
        return button
    }()
    
    private let plusCustomLabel: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.tintColor = .black
        return button
    }()
    private lazy var plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.customView = plusCustomLabel
        return button
    }()
    
    private let naviLayer = CALayer()
    
    private lazy var checkListTable: UITableView = {
        let table = UITableView()
        table.rowHeight = 80
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.register(CheckListCustomCell.self, forCellReuseIdentifier: CheckListCustomCell.identifier)
        return table
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        naviLayer.backgroundColor = UIColor.black.cgColor
        naviLayer.frame = CGRect(x:0,
                                 y: view.safeAreaInsets.top,
                                 width: view.frame.width,
                                 height: Design.menuBorderWidth)
        
        view.layer.addSublayer(naviLayer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    func setUI() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        
        setNaviButton()
        navigationItem.leftBarButtonItems = [checkButton, scheduleButton]
        navigationItem.rightBarButtonItems = [plusButton, setButton]
        
        view.addSubview(checkListTable)
        setLayout()
    }
    func setNaviButton() {
        checkCustomLabel.titleLabel?.font = Design.boldLargeSize
        checkCustomLabel.setTitleColor(.black, for: .normal)
        checkCustomLabel.addTarget(self, action: #selector(checkFunction(_:)), for: .touchUpInside)
        
        scheduleCustomLabel.titleLabel?.font = Design.LargeSize
        scheduleCustomLabel.setTitleColor(.lightGray, for: .normal)
        scheduleCustomLabel.alpha = 0.5
        scheduleCustomLabel.addTarget(self, action: #selector(scheduleFunction(_:)), for: .touchUpInside)
        
        setCustomLabel.addTarget(self, action: #selector(setFunction(_:)), for: .touchUpInside)
        plusCustomLabel.addTarget(self, action: #selector(plusFunction(_:)), for: .touchUpInside)
    }
    func setLayout() {
        checkListTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkListTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            checkListTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            checkListTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            checkListTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    @objc func checkFunction(_ sender: UIButton) {
        scheduleCustomLabel.setTitleColor(.lightGray, for: .normal)
        scheduleCustomLabel.alpha = 0.5
        scheduleCustomLabel.titleLabel?.font = Design.LargeSize
        
        checkCustomLabel.titleLabel?.font = Design.boldLargeSize
        checkCustomLabel.setTitleColor(.black, for: .normal)
        checkCustomLabel.alpha = 1
    }
    @objc func scheduleFunction(_ sender: UIButton) {
        checkCustomLabel.titleLabel?.font = Design.LargeSize
        checkCustomLabel.setTitleColor(.lightGray, for: .normal)
        checkCustomLabel.alpha = 0.5
        
        scheduleCustomLabel.titleLabel?.font = Design.boldLargeSize
        scheduleCustomLabel.setTitleColor(.black, for: .normal)
        scheduleCustomLabel.alpha = 1
    }
    @objc func setFunction(_ sender: UIButton) {
        print("press")
    }
    @objc func plusFunction(_ sender: UIButton) {
        print("press")
    }
}

extension ScheduleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CheckListCustomCell.identifier, for: indexPath) as? CheckListCustomCell else { fatalError() }
        cell.selectionStyle = .none
        cell.titleLabel.text = "욕실 청소"
        cell.explainLabel.text = "수챗구멍 청소 외 2개의 청소가 밀려있어요."
        return cell
    }
}

extension ScheduleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cardDetailVC = CardDetailViewController()
        cardDetailVC.titleLabel.text = "욕실 청소"
        cardDetailVC.simpleExplain.text = "다음 주에 커튼 빨래를 해야겠어요."
        navigationController?.pushViewController(cardDetailVC, animated: true)
    }
}
