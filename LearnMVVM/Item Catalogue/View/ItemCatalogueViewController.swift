//
//  ItemCatalogueViewController.swift
//  LearnMVVM
//
//  Created by zein rezky chandra on 28/06/21.
//

import UIKit

class ItemCatalogueViewController: UIViewController {
    
    @IBOutlet weak var catalogueCollection: UICollectionView!
    
    private let catalogueViewModel = ItemCatalogueViewModel()
    private var dataSource: CatalogueModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCell()
        
        // To receive data from ViewModel class we have link our ViewModel property inside the view controller class
        subscribeViewModel()
        
    }
    
    // MARK : Private function
    
    private func setupCell() {
        catalogueCollection.register(UINib(nibName: "CatalogueCollectionCell", bundle: nil), forCellWithReuseIdentifier: "catalogueCollectionCellid")
    }

    private func subscribeViewModel() {
        catalogueViewModel.bindCatalogueViewModelToController = {
            self.bindData()
        }
    }
    
    private func bindData() {
        dataSource = catalogueViewModel.catalogueData
        DispatchQueue.main.async {
            self.catalogueCollection.reloadData()
        }
    }
    
}

extension ItemCatalogueViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.data.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "catalogueCollectionCellid", for: indexPath) as? CatalogueCollectionCell)!
        cell.contentView.layer.cornerRadius = 5.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.green.cgColor
        cell.object = dataSource?.data[indexPath.row]
        return cell
    }
}
