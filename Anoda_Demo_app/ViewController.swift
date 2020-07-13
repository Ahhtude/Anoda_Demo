//
//  ViewController.swift
//  Anoda_Demo_app
//
//  Created by Sergey berdnik on 08.07.2020.
//  Copyright © 2020 Sergey berdnik. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let news = NewsFeed.init(owner: "TEST 1", location: "TEST LOC 1")
    
//    var testView: HeaderCellView {
//        .init(model: self.news)
//    }
    
    var secondView: BottomCellView {
        .init(model: news)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }

    private func test(){
        let image: UIImageView = .init()
    
        self.view.addSubview(image)
        
        image.snp.makeConstraints({snp in
            snp.left.right.equalToSuperview()
            snp.height.equalTo(312)
            image.layer.borderWidth = 1
            image.layer.borderColor = UIColor.gray.cgColor
            image.contentMode = .scaleAspectFill
            image.image = UIImage(named: "defaultPost")
        })
        
        secondView.snp.makeConstraints({ snp in
            snp.height.equalTo(40)
        })
    }
}

