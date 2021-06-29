//
//  ItemCatalogueViewModel.swift
//  LearnMVVM
//
//  Created zein rezky chandra on 28/06/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Generated using MVVM Module Generator by Mohamad Kaakati
//  https://github.com/Kaakati/MVVM-Template-Generator
//

import Foundation

protocol ItemCatalogueViewModelProtocol {
    func fetchData()
    func didReceiveUISelect(object: ItemCatalogue)
}

class ItemCatalogueViewModel {
    var view : ItemCatalogueViewProtocol!
    var object = ItemCatalogue()
    
    func fetchData() {
        object.didFetch(withSuccess: { (success) in
            self.view.viewWillPresent(data: success)
        }) { (err) in
            debugPrint("Error happened", err as Any)
        }
    }
    
    func didReceiveUISelect(object: ItemCatalogue) {
        debugPrint("Did receive UI object", object)
    }
}