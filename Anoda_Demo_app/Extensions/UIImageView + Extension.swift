//
//  UIImageView + Extension.swift
//  Anoda_Demo_app
//
//  Created by Sergey berdnik on 08.07.2020.
//  Copyright © 2020 Sergey berdnik. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    func asCircle(){
        self.layer.cornerRadius = self.frame.size.width / 2;
        self.layer.masksToBounds = true
    }

}
