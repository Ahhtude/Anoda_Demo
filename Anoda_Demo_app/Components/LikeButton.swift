//
//  LikeButton.swift
//  Anoda_Demo_app
//
//  Created by Sergey berdnik on 12.07.2020.
//  Copyright © 2020 Sergey berdnik. All rights reserved.
//

import Foundation
import UIKit

fileprivate struct Constants {
    static let actionColor : UIColor = .red
    static let baseColor : UIColor = .white
}

class LikeButton: UIButton {
    var isSelect: Bool = false {
        didSet {
            isSelected = isSelect
            selected(selected: isSelect)
        }
    }
    
    override func awakeFromNib(){
            super.awakeFromNib()
            contentMode = .scaleAspectFit
            setBackgroundImage(UIImage(named: "like"), for: .normal)
        }
    
    func selected(selected: Bool) {
        if selected {
            setBackgroundImage(UIImage(named: "likeApply"), for: .normal)
        } else {
            setBackgroundImage(UIImage(named: "like"), for: .normal)
        }
    }
}
