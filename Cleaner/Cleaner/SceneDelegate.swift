//
//  SceneDelegate.swift
//  Cleaner
//
//  Created by 표건욱 on 2020/08/03.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let cleanMethodVC = CleaningMethodViewController()
        let scheduleVC = ScheduleViewController()
        let cleanMateVC = CleanMateViewController()
        let settingVC = SettingViewController()
        
        let cleanMethodNavi = UINavigationController(rootViewController: cleanMethodVC)
        let scheduleNavi = UINavigationController(rootViewController: scheduleVC)
        let cleanMateNavi = UINavigationController(rootViewController: cleanMateVC)
        let settingNavi = UINavigationController(rootViewController: settingVC)
        
        let tapbarController = UITabBarController()
        tapbarController.viewControllers = [cleanMethodNavi, scheduleNavi, cleanMateNavi, settingNavi]
        
        cleanMethodNavi.tabBarItem = UITabBarItem(title: "청소법", image: UIImage(named: "wash"), tag: 0)
        scheduleNavi.tabBarItem = UITabBarItem(title: "스케줄", image: UIImage(named: "event"), tag: 1)
        cleanMateNavi.tabBarItem = UITabBarItem(title: "청소 메이트", image: UIImage(named: "friend"), tag: 2)
        settingNavi.tabBarItem = UITabBarItem(title: "설정", image: UIImage(named: "user"), tag: 3)
        
        window?.rootViewController = tapbarController
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
    }
}

