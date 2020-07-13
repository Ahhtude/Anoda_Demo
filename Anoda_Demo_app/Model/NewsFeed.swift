//
//  NewsFeed.swift
//  Anoda_Demo_app
//
//  Created by Sergey berdnik on 08.07.2020.
//  Copyright © 2020 Sergey berdnik. All rights reserved.
//

import Foundation


struct NewsFeed: Codable {
    
    let newsOwner: String
    let newsLocation: String
    //let likedBy: [String]?
    //let newsTitleText : String?
    //let postedTime : String
    //let comments : [String]?
    let imagesURL : String
    let ownerImage: String
    
    private enum CodingKeys: String, CodingKey {
        case newsOwner      = "owner"
        case newsLocation   = "loc"
        //case likedBy        = "liked"
        //case newsTitleText  = "title"
        //case postedTime     = "time"
        //case comments       = "comm"
        case imagesURL      = "img"
        case ownerImage     = "ownerImg"
    }
    
    init(from decoder: Decoder) throws {
          let values = try decoder.container(keyedBy: CodingKeys.self)
            newsOwner = try! values.decode(String.self, forKey: .newsOwner)
            newsLocation = try values.decode(String.self, forKey: .newsLocation)
            //likedBy = try values.decodeIfPresent([String].self, forKey: .likedBy) ?? []
            //newsTitleText = try values.decodeIfPresent(String.self, forKey: .newsTitleText) ?? ""
            //postedTime = try! values.decodeIfPresent(String.self, forKey: .postedTime) ?? ""
            //comments = try values.decodeIfPresent([String].self, forKey: .comments) ?? []
            imagesURL = try! values.decode(String.self, forKey: .imagesURL)
            ownerImage = try! values.decode(String.self, forKey: .ownerImage)
    }
    init(owner: String, location: String) {
        self.newsOwner = owner
        self.newsLocation = location
        self.ownerImage = "defaultImage"
        self.imagesURL = "defaultPost"
    }
}
