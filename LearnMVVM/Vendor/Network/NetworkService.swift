//
//  NetworkService.swift
//  LearnMVVM
//
//  Created by zein rezky chandra on 28/06/21.
//

import Foundation

class NetworkService :  NSObject {
    
    func requestItemCatalogue(completion : @escaping (CatalogueModel) -> ()){
        URLSession.shared.dataTask(with: URL(string: Constant.BASE_URL)!) { data, urlResponse, error in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                
                let emptyData = try! jsonDecoder.decode(CatalogueModel.self, from: data)
                
                completion(emptyData)
            }
        }.resume()
    }
}
