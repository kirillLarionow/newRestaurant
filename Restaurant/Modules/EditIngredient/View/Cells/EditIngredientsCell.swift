//
//  EditIngredientsCell.swift
//  Restaurant
//
//  Created by кирилл ларионов on 17.10.2022.
//

import UIKit
import Then
import SnapKit

extension EditIngredientViewController {
    class EditIngredientsCell: UITableViewCell {
        private lazy var ingredientStackView: UIStackView = {
            UIStackView().then {
                $0.axis = .horizontal
                $0.distribution = .fill
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
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupView()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupView() {
            contentView.addSubview(ingredientStackView)
            
            makeConstraints()
        }
        
        private func makeConstraints() {
            ingredientStackView.snp.makeConstraints { make in
                make.top.bottom.equalTo(contentView.safeAreaLayoutGuide)
                make.trailing.equalTo(contentView.safeAreaLayoutGuide).offset(-15)
                make.leading.equalTo(contentView.safeAreaLayoutGuide).inset(15)
            }
        }
        
        func setup(ingredient: IngredientModel) {
            self.ingredientNameLabel.text = ingredient.name
            self.ingredientCaloriesLabel.text = "\(ingredient.calories) ккал."
        }
    }
}
