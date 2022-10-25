//
//  IngredientsListCell.swift
//  Restaurant
//
//  Created by кирилл ларионов on 18.10.2022.
//

import UIKit
import Then
import SnapKit

extension IngredientsListViewController {
    class IngredientsListCell: UITableViewCell {
        
        private lazy var mainStackView: UIStackView = {
            UIStackView().then {
                $0.axis = .horizontal
                $0.spacing = 8
             //   $0.distribution = .fill
                $0.addArrangedSubview(ingredientStackView)
                $0.addArrangedSubview(choiceImageView)
            }
        }()
        
        private lazy var ingredientStackView: UIStackView = {
            UIStackView().then {
                $0.axis = .horizontal
                $0.distribution = .fillEqually
                $0.addArrangedSubview(ingredientNameLabel)
                $0.addArrangedSubview(ingredientCaloriesLabel)
            }
        }()
        
        private lazy var ingredientNameLabel: UILabel = {
            UILabel().then {
                $0.textColor = .black
                $0.font = .systemFont(ofSize: 16, weight: .bold)
            }
        }()
        
        private lazy var ingredientCaloriesLabel: UILabel = {
            UILabel().then {
                $0.textColor = .black
                $0.font = .systemFont(ofSize: 14, weight: .medium)
            }
        }()
        
        private lazy var choiceImageView: UIImageView = {
            UIImageView().then {
                $0.image = UIImage(named: "chooseCategoryImage")
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
            contentView.addSubview(mainStackView)
            
            makeConstraints()
        }
        
        private func makeConstraints() {
            mainStackView.snp.makeConstraints { make in
                make.top.bottom.equalTo(contentView.safeAreaLayoutGuide)
                make.trailing.equalTo(contentView.safeAreaLayoutGuide).offset(-15)
                make.leading.equalTo(contentView.safeAreaLayoutGuide).inset(15)
            }
            
            choiceImageView.snp.makeConstraints { make in
                make.top.bottom.equalTo(contentView.safeAreaLayoutGuide).inset(15)
                make.width.height.equalTo(15)
            }
        }
        
        func setup(ingredient: IngredientsListModel) {
            self.ingredientNameLabel.text = ingredient.ingredient.name
            self.ingredientCaloriesLabel.text = "\(ingredient.ingredient.calories) ккал."
            self.choiceImageView.isHidden = !ingredient.isSelected
        }
    }
}
