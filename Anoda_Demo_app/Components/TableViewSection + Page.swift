//
//  TableViewSection.swift
//  Anoda_Demo_app
//
//  Created by Sergey berdnik on 09.07.2020.
//  Copyright © 2020 Sergey berdnik. All rights reserved.
//

import Foundation
import Differentiator

struct TableViewSection<T> {
    
    var header: String?
    
    var items: [T]
    
    init(header: String? = nil, items: [T]) {
        self.header = header
        self.items = items
    }
}

class Page<Model: Decodable>: Decodable {
    typealias ItemType = Model
    private(set) var items: [Model]
    
    private enum CodingKeys: String, CodingKey {
        case items = "news"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do {
            items = try values.decode([Model].self, forKey: .items)
        } catch let error {
            print(error)
            items = []
        }
    }
}

extension TableViewSection: SectionModelType {
    init(original: TableViewSection<T>, items: [T]) {
        self = original
        self.items = items
    }
    

}
