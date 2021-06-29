//
//  CatalogueCollectionCell.swift
//  LearnMVVM
//
//  Created by zein rezky chandra on 28/06/21.
//

import UIKit
import Kingfisher

class CatalogueCollectionCell: UICollectionViewCell {

    @IBOutlet weak var catalogueImage: UIImageView!
    @IBOutlet weak var catalogueName: UILabel!
    @IBOutlet weak var catalogueDesc: UILabel!
    
    var object: CatalogueDataModel? {
        didSet {
            setupCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell() {
        guard let obj = object else { return }
        catalogueName.text = obj.name
        catalogueDesc.text = obj.description
        if let imageURL = obj.image {
            let url = URL(string: imageURL)
            catalogueImage.kf.setImage(with: url)
        }

    }
    
}
