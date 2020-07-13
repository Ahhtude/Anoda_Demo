//
//  NewsFeedCell.swift
//  Anoda_Demo_app
//
//  Created by Sergey berdnik on 08.07.2020.
//  Copyright © 2020 Sergey berdnik. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import RxSwift

fileprivate struct Constants {
    static let baseOffset : CGFloat = .init(10.0)
}

class NewsFeedCell: UITableViewCell {
    private let disposedBag = DisposeBag()
    var viewModel: NewsFeedCellViewModel!
    
    var headerView: HeaderCellView?
    var bottomView: BottomCellView?
    
    var photoView: UIImageView = UIImageView.init()
    
    private var disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillUI(model: NewsFeedCellViewModel) {
        viewModel = model
        headerView = HeaderCellView.init(model: model.model)
        bottomView = BottomCellView.init(model: model.model)
        setUpUI()
        setUpBindings()
        setUpConstraints()
    }
    
    private func setUpBindings() {
       viewModel.ownerImage.asDriver().drive(onNext: {[unowned self] image in
        self.headerView?.ownerImage.image = UIImage(named: image)
           }).disposed(by: disposeBag)
        
        viewModel.owner.asDriver().drive(onNext: {[unowned self] name in
            self.headerView?.ownerLabel.text = name
            }).disposed(by: disposeBag)
        
        viewModel.location.asDriver().drive(onNext: {[unowned self] location in
            self.headerView?.locationLabel.text = location
            }).disposed(by: disposeBag)
        
        viewModel.image.asDriver().drive(onNext: {[unowned self] image in
            self.photoView.image = UIImage(named: image)
            }).disposed(by: disposeBag)
        
        bottomView!.likeButton.rx.tap.asObservable().subscribe(onNext:{[unowned self] _ in
            if let button = self.bottomView?.likeButton {
                button.isSelect = !button.isSelect
            }
            }).disposed(by: disposeBag)
        
        bottomView!.likeButton.rx.tap.asObservable().subscribe(onNext:{[unowned self] _ in
            if let button = self.bottomView?.likeButton {
                button.isSelect = !button.isSelect
            }
            }).disposed(by: disposeBag)
        
        bottomView!.shareButton.rx.tap.asObservable().subscribe(onNext:{[unowned self] _ in
            if let button = self.bottomView?.shareButton {
                print("shareButton TAPPED")
            }
            }).disposed(by: disposeBag)
        
        bottomView!.favoriteButton.rx.tap.asObservable().subscribe(onNext:{[unowned self] _ in
            if let button = self.bottomView?.favoriteButton {
                print("favoriteButton TAPPED")
            }
            }).disposed(by: disposeBag)
        
        headerView!.moreButton.rx.tap.asObservable()
            .bind(to: viewModel.tapMoreButton)
            .disposed(by: disposeBag)
        
        self.addSubview(headerView!)
        self.addSubview(photoView)
        self.addSubview(bottomView!)
    }
    
    private func setUpUI(){
                photoView.contentMode = .scaleAspectFill
    }
    
    private func setUpConstraints() {
        headerView?.snp.makeConstraints({ snp in
            snp.top.equalToSuperview().offset(5)
            snp.right.equalToSuperview().offset(-Constants.baseOffset)
            snp.left.equalToSuperview().offset(Constants.baseOffset)
        })
        
        photoView.snp.makeConstraints({ snp in
            snp.top.equalTo(headerView!.snp.bottom)
            snp.left.right.equalToSuperview()
            snp.height.equalTo(312)
            snp.bottom.equalTo(bottomView!.snp.bottom)
        })
        
        bottomView?.snp.makeConstraints({ snp in
            snp.right.equalToSuperview().offset(-Constants.baseOffset)
            snp.left.equalToSuperview().offset(Constants.baseOffset)
            snp.bottom.equalToSuperview().offset(-Constants.baseOffset)
        })
    }
}
