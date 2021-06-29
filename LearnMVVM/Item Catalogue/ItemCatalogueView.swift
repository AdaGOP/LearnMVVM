//
//  ItemCatalogueView.swift
//  LearnMVVM
//
//  Created zein rezky chandra on 28/06/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Generated using MVVM Module Generator by Mohamad Kaakati
//  https://github.com/Kaakati/MVVM-Template-Generator
//

import UIKit

protocol ItemCatalogueViewProtocol {
    func viewWillPresent(data: ItemCatalogue)
}

class ItemCatalogueView: UIViewController, ItemCatalogueViewProtocol {
    
    private var ui = ItemCatalogueUI()
    var viewModel : ItemCatalogueViewModel! {
        willSet {
            newValue.view = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.fetchData()
    }
    
    override func loadView() {
        ui.delegate = self
        view = ui
    }
    
    func viewWillPresent(data: ItemCatalogue) {
        ui.object = data
    }
}

extension ItemCatalogueView : ItemCatalogueUIDelegate {
    func uiDidSelect(object: ItemCatalogue) {
        viewModel.didReceiveUISelect(object: object)
    }
}
