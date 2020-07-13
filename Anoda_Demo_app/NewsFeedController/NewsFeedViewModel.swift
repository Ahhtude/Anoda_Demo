//
//  NewsFeedViewModel.swift
//  Anoda_Demo_app
//
//  Created by Sergey berdnik on 08.07.2020.
//  Copyright © 2020 Sergey berdnik. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


class NewsFeedViewModel {
    private var disposeBag = DisposeBag()
    
    var output: Output
    var input: Input
    
    private let sectionsRelay = BehaviorRelay<[TableViewSection<NewsFeed>]>(value: [])

    init() {
        input = Input()
        output = Output(sections: sectionsRelay.asDriver())
        getData()
    }
    
    private func getData() {
        guard let path = Bundle.main.path(forResource: "NewsFeedData", ofType: "json") else {return}
        var responseData: Page<NewsFeed>?
        let decoder = JSONDecoder()
        
        let url = URL(fileURLWithPath: path)
            do {
                let data = try Data(contentsOf: url)
                responseData =  try decoder.decode(Page<NewsFeed>.self, from: data)
                
                if let news = responseData?.items{
                    sectionsRelay.accept([TableViewSection<NewsFeed>.init(items: responseData!.items)])
                }
              } catch {
                    print("SOME ERROR")
              }
    }
}


extension NewsFeedViewModel {
    struct Input {

    }
    
    struct Output {
        let sections : Driver<[TableViewSection<NewsFeed>]>
    }
}


private func text() {
    let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    let firstAction = UIAlertAction(title: NSLocalizedString("firstAction", comment: ""),
                                     style: .default,
                                     handler: nil)
    actionSheet.addAction(firstAction)
    
    let cancel = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil)
    actionSheet.addAction(cancel)
    UIApplication.shared.keyWindow?.rootViewController?.present(actionSheet, animated: true, completion: nil)
}
