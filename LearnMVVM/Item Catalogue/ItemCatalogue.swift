//
//  ItemCatalogue.swift
//  LearnMVVM
//
//  Created zein rezky chandra on 28/06/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Generated using MVVM Module Generator by Mohamad Kaakati
//  https://github.com/Kaakati/MVVM-Template-Generator
//

/// ItemCatalogue Model
struct  ItemCatalogue {
    typealias didFetchSuccess = (ItemCatalogue)->()
    typealias didFailWithError = (Error?) -> ()
    
    // Your Model Structure
    var id : Int?
    var name : Int?
    
    func didFetch(withSuccess: @escaping didFetchSuccess, withError: @escaping didFailWithError) {
        withSuccess(ItemCatalogue())
        withError(nil)
    }
}
