//
//  NewsFeedCellViewModel.swift
//  Anoda_Demo_app
//
//  Created by Sergey berdnik on 08.07.2020.
//  Copyright © 2020 Sergey berdnik. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift


class NewsFeedCellViewModel {
    private var disposeBag = DisposeBag()
    
    let model: NewsFeed
    
    init(model: NewsFeed) {
        self.model = model
    }
    
    var owner: Driver<String> {
        return Driver.just(model.newsOwner)
    }
    var ownerImage: Driver<String> {
        return Driver.just(model.ownerImage)
    }
    
//    var time: Driver<String> {
//        return Driver.just(model.postedTime)
//    }
    
    var image: Driver<String> {
        return Driver.just(model.imagesURL)
    }
    
//    var comments: Driver<[String]?> {
//        return Driver.just(model.comments)
//    }
    
//    var likes: Driver<[String]?> {
//        return Driver.just(model.likedBy)
//    }
    
    var location: Driver<String> {
        return Driver.just(model.newsLocation)
    }
    
//    var title: Driver<String?> {
//        return Driver.just(model.newsTitleText)
//    }
    
    var tapMoreButton = PublishSubject<Void>()
    
    
}
