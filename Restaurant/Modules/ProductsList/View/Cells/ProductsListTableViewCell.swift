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
        private lazy var mainView: UIView = {
            UIView().then {
                $0.layer.cornerRadius = 8
                $0.backgroundColor = UIColor.white
                $0.addSubview(mainStackView)
            }
        }()
        
        private lazy var mainStackView: UIStackView = {
            UIStackView().then {
                $0.axis = .horizontal
                $0.distribution = .fillEqually
                
                $0.addArrangedSubview(productStackView)
                $0.addArrangedSubview(ingredientStackView)
            }
        }()
        
        
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
        
        private lazy var ingredientStackView: UIStackView = {
            UIStackView().then {
                $0.axis = .vertical
                $0.distribution = .fillEqually
                $0.spacing = 10
                
                $0.addArrangedSubview(ingredientsTitleStackView)
                $0.addArrangedSubview(ingredientsStackView)
            }
        }()
        
        private lazy var ingredientsTitleStackView: UIStackView = {
            UIStackView().then {
                $0.axis = .vertical
                $0.distribution = .fill
                
                $0.addArrangedSubview(ingredientsTitleLabel)
                $0.addArrangedSubview(ingredientsBottomBorderView)
            }
        }()
        
        
        private lazy var ingredientsStackView: UIStackView = {
            UIStackView().then {
                $0.axis = .vertical
                
                $0.addArrangedSubview(ingredientsNameLabel)
            }
        }()
        
        private lazy var ingredientsTitleLabel: UILabel = {
            UILabel().then {
                $0.textColor = AppColor.Theme
                $0.textAlignment = .center
                $0.font = .systemFont(ofSize: 14, weight: .medium)
                $0.text = "Ингредиенты:"
            }
        }()
        
        private lazy var ingredientsNameLabel: UILabel = {
            UILabel().then {
                $0.textColor = UIColor.gray
                $0.textAlignment = .center
                $0.font = .systemFont(ofSize: 14, weight: .medium)
                $0.numberOfLines = 0
                $0.text = "Ингредиентов нет"
            }
        }()
        
        private lazy var ingredientsBottomBorderView: UIView = {
            UIView().then {
                $0.backgroundColor = AppColor.Theme
            }
        }()
        
        
        private lazy var productNameLabel: UILabel = {
            UILabel().then {
                $0.textColor = UIColor.black
                $0.font = .systemFont(ofSize: 16, weight: .bold)
                $0.text = "Товар:"
            }
        }()
        
        private lazy var categoryNameLabel: UILabel = {
            UILabel().then {
                $0.textColor = UIColor.black
                $0.font = .systemFont(ofSize: 16, weight: .bold)
                $0.text = "Категория:"
            }
        }()
        
        private lazy var caloriesNameLabel: UILabel = {
            UILabel().then {
                $0.textColor = UIColor.black
                $0.font = .systemFont(ofSize: 16, weight: .bold)
                $0.text = "Калорий:"
            }
        }()
        
        private lazy var productModelNameLabel: UILabel = {
            UILabel().then {
                $0.textColor = UIColor.gray
                $0.font = .systemFont(ofSize: 14, weight: .bold)
            }
        }()
        
        private lazy var productModelCategoryNameLabel: UILabel = {
            UILabel().then {
                $0.textColor = UIColor.gray
                $0.font = .systemFont(ofSize: 14, weight: .bold)
            }
        }()
        
        private lazy var productModelCaloriesLabel: UILabel = {
            UILabel().then {
                $0.textColor = UIColor.gray
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
            contentView.addSubview(mainView)
            
            makeConstraints()
        }
        
        private func makeConstraints() {
            mainView.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalTo(contentView.safeAreaLayoutGuide).inset(15)
            }
            
            mainStackView.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview().inset(15)
            }
            
            ingredientsBottomBorderView.snp.makeConstraints { make in
                make.height.equalTo(1)
            }
        }
        
        func setup(productModel: ProductModel) {
            self.productModelNameLabel.text = productModel.name
            self.productModelCategoryNameLabel.text = productModel.category.name
            self.productModelCaloriesLabel.text = "\(productModel.calories) ккал."
            let ingredientsName = productModel.ingredients.map({ $0.name }).joined(separator: ", \n")
            self.ingredientsNameLabel.text = ingredientsName
            
        }
    }
}
