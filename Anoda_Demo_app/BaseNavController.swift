//
//  BaseNavController.swift
//  Anoda_Demo_app
//
//  Created by Sergey berdnik on 08.07.2020.
//  Copyright © 2020 Sergey berdnik. All rights reserved.
//

import Foundation
import UIKit

class BaseNavController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseSetUp()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    private func baseSetUp() {
        self.view.tintColor = .black
    }
}
