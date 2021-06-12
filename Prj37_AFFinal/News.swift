//
//  News.swift
//  Prj37_FinalProject
//
//  Created by ИГОРЬ on 10/06/2021.
//

import Foundation
import ObjectMapper


class News: Mappable {
    var title: String?
    var urlToImage:String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        urlToImage <- map["urlToImage"]
    }
    
    
    
}
