//
//  HeaderCellView.swift
//  Anoda_Demo_app
//
//  Created by Sergey berdnik on 08.07.2020.
//  Copyright © 2020 Sergey berdnik. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

fileprivate struct Constants {
    static let baseHeight : CGFloat = .init(30.0)
}

class HeaderCellView: UIView {
    
    let mainStackView: UIStackView = .init()
    let secondStackView: UIStackView = .init()
    
    private let model: NewsFeed
    
    let ownerImage: UIImageView = .init()
    let moreButton : UIButton = .init()
    
    let ownerLabel: UILabel = .init()
    let locationLabel: UILabel = .init()
        
    init(model: NewsFeed) {
        self.model = model
        super.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: Constants.baseHeight))
        setUpUI()
        setUpConstraints()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        ownerImage.image = UIImage(named: model.ownerImage)
        mainStackView.addArrangedSubview(ownerImage)
        mainStackView.addArrangedSubview(secondStackView)
        mainStackView.addArrangedSubview(moreButton)
        
        ownerImage.contentMode = .scaleAspectFit
        ownerImage.image = UIImage(named: model.ownerImage)
        ownerImage.layer.borderColor = UIColor.black.cgColor
        ownerImage.layer.borderWidth = 2
        ownerImage.layer.cornerRadius = super.frame.height/2
        ownerImage.layer.masksToBounds = true
        
        secondStackView.axis = .vertical
        
        ownerLabel.text = model.newsOwner
        ownerLabel.textAlignment = .left
        ownerLabel.font = .boldSystemFont(ofSize: 14)
        
        locationLabel.addImageToText(text: model.newsLocation, localImage: "locationButton")
        locationLabel.textAlignment = .left
        locationLabel.font = UIFont.systemFont(ofSize: 10)
        locationLabel.textColor = .gray
        
        secondStackView.addArrangedSubview(ownerLabel)
        secondStackView.addArrangedSubview(locationLabel)
    }
    
    private func setUpConstraints() {
        self.addSubview(mainStackView)
                
        self.mainStackView.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
            make.bottom.top.right.left.equalToSuperview()
            mainStackView.axis = .horizontal
            mainStackView.distribution = .equalSpacing
        }
        
            ownerImage.snp.makeConstraints { make in
            make.width.height.equalTo(super.frame.height)
        }
        
        moreButton.snp.makeConstraints({make in
            make.width.height.equalTo(super.frame.height)
            moreButton.contentMode = .scaleAspectFit
            moreButton.setBackgroundImage(UIImage(named: "moreButton"), for: .normal)
        })
        
        secondStackView.snp.makeConstraints { snp in
            snp.left.equalTo(ownerImage.snp.right).offset(15)
        }
    }
}
