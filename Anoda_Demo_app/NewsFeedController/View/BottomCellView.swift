//
//  BottomCellView.swift
//  Anoda_Demo_app
//
//  Created by Sergey berdnik on 08.07.2020.
//  Copyright © 2020 Sergey berdnik. All rights reserved.
//

import Foundation
import UIKit


fileprivate struct Constants {
    static let baseHeight : CGFloat = .init(30.0)
}

class BottomCellView: UIView {
    let mainStackView: UIStackView = .init()
    
    let likeButton : LikeButton = .init(type: .custom)
    let commentButton : UIButton = .init()
    let shareButton : UIButton = .init()
    let markerView : UIView = .init()
    let favoriteButton : UIButton = .init()
    
    private let model: NewsFeed
    
    init(model: NewsFeed) {
        self.model = model
        super.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: Constants.baseHeight))
        self.tintColor = .black
        setUpUI()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        self.addSubview(mainStackView)
        mainStackView.axis = .horizontal
        mainStackView.distribution = .equalSpacing
        
        mainStackView.addArrangedSubview(likeButton)
        mainStackView.addArrangedSubview(commentButton)
        mainStackView.addArrangedSubview(shareButton)
        mainStackView.addArrangedSubview(markerView)
        mainStackView.addArrangedSubview(favoriteButton)
        
        likeButton.contentMode = .scaleAspectFit
        likeButton.setBackgroundImage(UIImage(named: "like"), for: .normal)
        
        commentButton.contentMode = .scaleAspectFit
        commentButton.setBackgroundImage(UIImage(named: "comment"), for: .normal)
        
        shareButton.contentMode = .scaleAspectFit
        shareButton.setBackgroundImage(UIImage(named: "sender"), for: .normal)
        
        favoriteButton.tintColor = .black
        favoriteButton.contentMode = .scaleAspectFit
        favoriteButton.setBackgroundImage(UIImage(named: "bookmark"), for: .normal)
    }
    
    private func setUpConstraints() {
         mainStackView.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
            make.bottom.top.right.left.equalToSuperview()
        }
        
        likeButton.snp.makeConstraints({ make in
            make.width.height.equalTo(super.frame.height)
            make.centerY.equalToSuperview()
        })
        
        commentButton.snp.makeConstraints({ make in
            make.width.height.equalTo(super.frame.height)
            make.centerY.equalToSuperview()
        })
        
        shareButton.snp.makeConstraints({ make in
            make.width.height.equalTo(super.frame.height)
            make.centerY.equalToSuperview()
        })
        
        markerView.snp.makeConstraints({ make in
            make.width.equalTo(150)
            make.centerY.equalToSuperview()
        })
        
        favoriteButton.snp.makeConstraints({ make in
            make.width.height.equalTo(super.frame.height)
            make.centerY.equalToSuperview()
        })
    }
    
    
}
