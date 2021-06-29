//
//  CatalogueModel.swift
//  LearnMVVM
//
//  Created by zein rezky chandra on 28/06/21.
//

import Foundation

struct CatalogueModel: Codable {
    let data: [CatalogueDataModel]
    
    enum CodingKeys: String, CodingKey {
        case data = "entries"
    }
}

struct CatalogueDataModel: Codable {
    let name, description, image: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "API"
        case description = "Description"
        case image = "Link"
    }
}
