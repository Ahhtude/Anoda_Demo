//
//  UILabel + Extension.swift
//  Anoda_Demo_app
//
//  Created by Sergey berdnik on 08.07.2020.
//  Copyright © 2020 Sergey berdnik. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
     func addImageToText(text: String, localImage: String) {
        let fullString = NSMutableAttributedString(string: text)
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: localImage)
        imageAttachment.bounds = CGRect(x: 0, y: -5, width: 16, height: 16)
        let image1String = NSAttributedString(attachment: imageAttachment)
        fullString.append(image1String)
        self.attributedText = fullString
    }
}
