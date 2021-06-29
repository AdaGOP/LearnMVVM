//
//  ItemCatalogueViewModel.swift
//  LearnMVVM
//
//  Created by zein rezky chandra on 28/06/21.
//

import Foundation

class ItemCatalogueViewModel: NSObject {
    
    private var service: NetworkService!
    
    // We will create another property in view model class name “catalogueData” of type CatalogueModel (Model)
    // that retrieves the results from API and notify the view that there have been changes.
    // catalogueData is set to the response received from API. By using property observer, as soon as we get value in catalogueData as a response of API,
    // didSet of catalogueData is called and we have called bindCatalogueViewModelToController() inside didSet of catalogueData
    // Once we received the data from the view model to view, now its time to update our UI.
    private(set) var catalogueData: CatalogueModel! {
        didSet {
            self.bindCatalogueViewModelToController()
        }
    }

    
    // we will create a property in view model named “var bindCatalogueViewModelToController”
    // This property needs to be called from the View Controller
    var bindCatalogueViewModelToController: (() -> ()) = {}
    
    override init() {
        super.init()
        service = NetworkService()
        fetchData()
    }

    func fetchData() {
        service.requestItemCatalogue { data in
            print(data)
            self.catalogueData = data
        }
    }
}
