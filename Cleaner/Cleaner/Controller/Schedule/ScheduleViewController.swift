//
//  ScheduleViewController.swift
//  Cleaner
//
//  Created by 표건욱 on 2020/08/03.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit
import FSCalendar

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
    
    private lazy var pageScroll: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    private let pageController: UIPageControl = {
        let controll = UIPageControl()
        controll.numberOfPages = 2
        controll.hidesForSinglePage = true
        controll.pageIndicatorTintColor = .lightGray
        controll.currentPageIndicatorTintColor = .black
        return controll
    }()
    private lazy var checkListTable: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.register(CheckListCustomCell.self, forCellReuseIdentifier: CheckListCustomCell.identifier)
        return table
    }()
    private lazy var calendarView: FSCalendar = {
        let calendar = FSCalendar()
        calendar.delegate = self
        calendar.dataSource = self
        calendar.scrollDirection = .vertical
        calendar.appearance.borderRadius = 0
        calendar.locale = Locale(identifier: "ko_KR")
        
        calendar.appearance.weekdayTextColor = .black
        calendar.appearance.titleWeekendColor = .red
        calendar.appearance.headerTitleColor = .black
        calendar.appearance.eventDefaultColor = .green
        calendar.appearance.selectionColor = .blue
        calendar.appearance.todayColor = .orange
        calendar.appearance.todaySelectionColor = .black
        
        calendar.headerHeight = 50
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.appearance.headerDateFormat = "YYYY년 M월"
        calendar.appearance.headerTitleFont = Design.boldLargeSize
        return calendar
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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        pageScroll.contentSize = CGSize(width: view.frame.width * 2,
                                        height: pageScroll.frame.height
        )
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    func setUI() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        
        setNaviButton()
        navigationItem.leftBarButtonItems = [checkButton, scheduleButton]
        navigationItem.rightBarButtonItems = [plusButton, setButton]
        
        pageScroll.addSubview(checkListTable)
        pageScroll.addSubview(calendarView)
        view.addSubview(pageScroll)
        view.addSubview(pageController)
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
        pageScroll.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageScroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pageScroll.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            pageScroll.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            pageScroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        pageController.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageController.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            pageController.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        checkListTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkListTable.topAnchor.constraint(equalTo: pageScroll.topAnchor),
            checkListTable.leadingAnchor.constraint(equalTo: pageScroll.leadingAnchor),
            checkListTable.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            checkListTable.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
        ])
        
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: pageScroll.topAnchor),
            calendarView.leadingAnchor.constraint(equalTo: checkListTable.trailingAnchor),
            calendarView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            calendarView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
        ])
    }
    func checkAni() {
        self.scheduleCustomLabel.titleLabel?.font = Design.LargeSize
        self.scheduleCustomLabel.setTitleColor(.lightGray, for: .normal)
        self.scheduleCustomLabel.alpha = 0.5
        
        self.checkCustomLabel.titleLabel?.font = Design.boldLargeSize
        self.checkCustomLabel.setTitleColor(.black, for: .normal)
        self.checkCustomLabel.alpha = 1
    }
    func scheduleAni() {
        self.checkCustomLabel.titleLabel?.font = Design.LargeSize
        self.checkCustomLabel.setTitleColor(.lightGray, for: .normal)
        self.checkCustomLabel.alpha = 0.5
        
        self.scheduleCustomLabel.titleLabel?.font = Design.boldLargeSize
        self.scheduleCustomLabel.setTitleColor(.black, for: .normal)
        self.scheduleCustomLabel.alpha = 1
    }
    @objc func checkFunction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.pageScroll.contentOffset.x = 0
            self.checkAni()
        }
    }
    @objc func scheduleFunction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.pageScroll.contentOffset.x = self.view.frame.width
            self.scheduleAni()
        }
    }
    @objc func setFunction(_ sender: UIButton) {
        print("press")
    }
    @objc func plusFunction(_ sender: UIButton) {
        print("press")
    }
}

extension ScheduleViewController: UITableViewDataSource, UITableViewDelegate {
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let size = (tableView.frame.width - (Design.tableEdge.left + Design.tableEdge.right))
        return size / 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cardDetailVC = CardDetailViewController()
        cardDetailVC.titleLabel.text = "욕실 청소"
        cardDetailVC.simpleExplain.text = "다음 주에 커튼 빨래를 해야겠어요."
        navigationController?.pushViewController(cardDetailVC, animated: true)
    }
}

extension ScheduleViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / view.frame.width)
        pageController.currentPage = page
        pageController.currentPage == 0 ? checkAni() : scheduleAni()
    }
}

extension ScheduleViewController: FSCalendarDataSource, FSCalendarDelegate {
    
}
