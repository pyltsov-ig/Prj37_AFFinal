//
//  NewsModel.swift
//  Prj37_AFFinal
//
//  Created by ИГОРЬ on 11/06/2021.
//

import Foundation
import SwiftyJSON


class NewsModel {
    var title:String
    var urlToImage:String
    
    init(newsDictionary: JSON) {
        self.title = newsDictionary["title"].stringValue
        self.urlToImage = newsDictionary["urlToImage"].stringValue
    }
}


