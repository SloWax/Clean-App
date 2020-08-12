//
//  CleanMateViewController.swift
//  Cleaner
//
//  Created by 표건욱 on 2020/08/03.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class CleanMateViewController: UIViewController {
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "여기 같이 만들 개발자, 디자이너 구함"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.frame = CGRect(x: view.center.x,
                             y: view.center.y,
                             width: 100, height: 50)
        view.addSubview(label)
    }
}
