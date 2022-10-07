//
//  ProductsListViewController.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit
import Then
import SnapKit

struct Section {
    let title: String
    let options: [String]
    var isOpened: Bool = false
    
    init(title: String, options: [String], isOpened: Bool = false) {
        self.title = title
        self.options = options
        self.isOpened = isOpened
    }
}

class ProductsListViewController: UIViewController {
    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped).then {
            $0.delegate = self
            $0.dataSource = self
            $0.separatorColor = AppColor.Theme
            $0.register(ProductsListTableViewCell.self, forCellReuseIdentifier: productsListTableViewCellID)
        }
    }()
    
    private let productsListTableViewCellID = "ProductsListTableViewCell"
    private var sections = [Section]()
    
    var output: ProductsListViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Список всех товаров"
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        sections = [
            Section(title: "Section 1", options: ["1", "2", "3"]),
            Section(title: "Section 2", options: ["1", "2", "3"]),
            Section(title: "Section 3", options: ["1", "2", "3"]),
            Section(title: "Section 4", options: ["1", "2", "3"])
        ]
    }
}

extension ProductsListViewController {
    
}

extension ProductsListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        
        if section.isOpened {
            return section.options.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: productsListTableViewCellID, for: indexPath) as? ProductsListTableViewCell else {
            fatalError()
        }
        
        if indexPath.row == 0 {
            cell.setup(category: sections[indexPath.section], product: "", isShowImage: false)
        } else {
            cell.setup(category: Section(title: "", options: []), product: sections[indexPath.section].options[indexPath.row - 1], isShowImage: true)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
        tableView.reloadSections([indexPath.section], with: .none)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(50)
    }
}

extension ProductsListViewController: ProductsListViewInput {

}
