//
//  ItemCatalogueUI.swift
//  LearnMVVM
//
//  Created zein rezky chandra on 28/06/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Generated using MVVM Module Generator by Mohamad Kaakati
//  https://github.com/Kaakati/MVVM-Template-Generator
//

import UIKit

protocol ItemCatalogueUIDelegate {
    func uiDidSelect(object: ItemCatalogue)
}

class ItemCatalogueUI : UIView {
    var delegate: ItemCatalogueUIDelegate!
    
    var object : ItemCatalogue?
    var cellIdentifier = "ItemCatalogueCellId"
    
    lazy var tableView : UITableView = {
        let tbl = UITableView()
        tbl.delegate = self
        tbl.dataSource = self
        tbl.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tbl.translatesAutoresizingMaskIntoConstraints = false
        return tbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupConstraints()
    }
}

extension ItemCatalogueUI {

    private func setupUIElements() {
        // arrange subviews
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        // add constraints to subviews
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
}

extension ItemCatalogueUI: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        return cell
    }
}

extension ItemCatalogueUI: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.uiDidSelect(object: self.object!)
    }
}

