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
   
    private lazy var customIndicatorImageView: UIImageView = {
        UIImageView().then {
            $0.isHidden = true
            $0.image = UIImage(named: "loader")
        }
    }()
    
    var timer: Timer?
    
    var products: [ProductModel]? = []
    var productsListState: ProductsListState = .loaded
    
    var output: ProductsListViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
      
        output?.viewDidLoad()
        setupView()
    }
}

extension ProductsListViewController {
    private func setupView() {
        switch productsListState {
        case .loaded:
            title = "Загрузка товаров.."
            customIndicatorImageView.isHidden = false
            view.addSubview(customIndicatorImageView)
            startTimer()
            makeConstraints()
        case .normal:
            title = "Список всех товаров"
            customIndicatorImageView.isHidden = true
            view.addSubview(tableView)
            stopTimer()
            makeConstraints()
        }
        
        view.backgroundColor = .white
    }
    
    private func makeConstraints() {
        switch productsListState {
        case .loaded:
            customIndicatorImageView.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.height.width.equalTo(50)
            }
            
        case .normal:
            tableView.snp.makeConstraints { make in
                make.top.bottom.trailing.leading.equalTo(view.safeAreaLayoutGuide)
            }
        }
    }
    
    @objc func animateView() {
        UIView.animate(withDuration: 0.8, delay: 0.0, options: .curveLinear, animations: {
            self.customIndicatorImageView.transform = self.customIndicatorImageView.transform.rotated(by: CGFloat(Double.pi))
        }, completion: { (finished) in
            if self.timer != nil {
                self.timer = Timer.scheduledTimer(timeInterval:0.0, target: self, selector: #selector(self.animateView), userInfo: nil, repeats: false)
            }
        })
    }
    
    func startTimer() {
        self.customIndicatorImageView.isHidden = false
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval:0.0, target: self, selector: #selector(self.animateView), userInfo: nil, repeats: false)
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

extension ProductsListViewController: UITableViewDelegate, UITableViewDataSource {    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: productsListTableViewCellID, for: indexPath)
                as? ProductsListTableViewCell
        else {
            fatalError()
        }
        
        guard let productModel = products?[indexPath.row] else {
            fatalError()
        }
        
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        cell.setup(productModel: productModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(250)
    }
}

extension ProductsListViewController: ProductsListViewInput {
    func updateView(products: [ProductModel]) {
        self.productsListState = .normal
        setupView()
        self.products = products
        tableView.reloadData()
    }
}
