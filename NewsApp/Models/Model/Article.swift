//
//  APIResponse.swift
//  NewsApp
//
//  Created by iYezan on 18/03/2022.
//

import UIKit

class Article: NSObject, Decodable, NSCoding {
    
    func encode(with aCoder: NSCoder) {
        print("Trying to transform Articale into Data")
        aCoder.encode(title ?? "", forKey: "titleKey")
        aCoder.encode(descriptionTitle ?? "", forKey: "descriptionTitleKey")
        aCoder.encode(urlToImage ?? "", forKey: "urlToImageKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        print("Trying to turn Data into Articale")
        self.title = aDecoder.decodeObject(forKey: "titleKey") as? String
        self.descriptionTitle = aDecoder.decodeObject(forKey: "descriptionTitleKey") as? String
        self.urlToImage = aDecoder.decodeObject(forKey: "urlToImageKey") as? String
    }
    
    var source: Source?
    var title: String?
    var descriptionTitle: String?
    var urlToImage: String?
    
    enum CodingKeys: String, CodingKey {
        case title, urlToImage
        case descriptionTitle = "description"
    }
}

struct Source: Decodable {
    let name: String
}

struct APIResponse: Decodable {
    let articles: [Article]
}

