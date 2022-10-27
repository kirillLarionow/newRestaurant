//
//  ProductsListTableViewCell.swift
//  Restaurant
//
//  Created by кирилл ларионов on 27.10.2022.
//

import UIKit
import Then
import SnapKit

extension ProductsListViewController {
    class ProductsListTableViewCell: UITableViewCell {
        private lazy var productStackView: UIStackView = {
            UIStackView().then {
                $0.axis = .vertical
                $0.distribution = .fillProportionally
                
                $0.addArrangedSubview(productNameLabel)
                $0.addArrangedSubview(productModelNameLabel)
                
                $0.addArrangedSubview(categoryNameLabel)
                $0.addArrangedSubview(productModelCategoryNameLabel)
                
                $0.addArrangedSubview(caloriesNameLabel)
                $0.addArrangedSubview(productModelCaloriesLabel)
            }
        }()
        
        private lazy var productNameLabel: UILabel = {
            UILabel().then {
                $0.textColor = UIColor.black
                $0.font = .systemFont(ofSize: 14, weight: .bold)
                $0.text = "Товар:"
            }
        }()
        
        private lazy var categoryNameLabel: UILabel = {
            UILabel().then {
                $0.textColor = UIColor.black
                $0.font = .systemFont(ofSize: 14, weight: .bold)
                $0.text = "Категория:"
            }
        }()
        
        private lazy var caloriesNameLabel: UILabel = {
            UILabel().then {
                $0.textColor = UIColor.black
                $0.font = .systemFont(ofSize: 14, weight: .bold)
                $0.text = "Калорий:"
            }
        }()
        
        private lazy var productModelNameLabel: UILabel = {
            UILabel().then {
                $0.textColor = UIColor.black
                $0.font = .systemFont(ofSize: 14, weight: .bold)
            }
        }()
        
        private lazy var productModelCategoryNameLabel: UILabel = {
            UILabel().then {
                $0.textColor = UIColor.black
                $0.font = .systemFont(ofSize: 14, weight: .bold)
            }
        }()
        
        private lazy var productModelCaloriesLabel: UILabel = {
            UILabel().then {
                $0.textColor = UIColor.black
                $0.font = .systemFont(ofSize: 14, weight: .bold)
            }
        }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupView()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupView() {
            contentView.addSubview(productStackView)
            
            makeConstraints()
        }
        
        private func makeConstraints() {
            productStackView.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalTo(contentView.safeAreaLayoutGuide)
            }
        }
        
        func setup(productModel: ProductModel) {
            self.productModelNameLabel.text = productModel.name
            self.productModelCategoryNameLabel.text = productModel.category.name
            self.productModelCaloriesLabel.text = "\(productModel.calories)"
        }
    }
}
