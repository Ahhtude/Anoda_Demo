//
//  BaseTabBarController.swift
//  Anoda_Demo_app
//
//  Created by Sergey berdnik on 08.07.2020.
//  Copyright © 2020 Sergey berdnik. All rights reserved.
//

import Foundation

import Foundation
import UIKit

class BaseTabBarController: UITabBarController {
    let firstVC: UIViewController = NewsFeedController()
    let secondVC: UIViewController = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        baseSetUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    private func baseSetUp() {
        let firstNavVC = UINavigationController.init(rootViewController: firstVC)
        
        self.view.tintColor = .black
        self.viewControllers = [firstNavVC,secondVC]
        
        firstNavVC.tabBarItem.title = "NewsFeed"
        firstNavVC.tabBarItem.image = UIImage(named: "home")
        firstNavVC.tabBarItem.selectedImage = UIImage(named: "home")
        
        secondVC.tabBarItem.title = "Second"
        secondVC.tabBarItem.image = UIImage(named: "other")
        secondVC.tabBarItem.selectedImage = UIImage(named: "other")
    }
}
