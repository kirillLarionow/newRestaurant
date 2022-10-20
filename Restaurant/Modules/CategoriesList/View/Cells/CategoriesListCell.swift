//
//  CategoriesListCell.swift
//  Restaurant
//
//  Created by кирилл ларионов on 19.10.2022.
//


import UIKit
import Then
import SnapKit

extension CategoriesListViewController {
    class CategoriesListCell: UITableViewCell {
        private lazy var categoryStackView: UIStackView = {
            UIStackView().then {
                $0.axis = .horizontal
                $0.distribution = .fillProportionally
                $0.addArrangedSubview(categoryNameLabel)
                $0.addArrangedSubview(choiceImageView)
            }
        }()
        
        private lazy var categoryNameLabel: UILabel = {
            UILabel().then {
                $0.textColor = .black
                $0.font = .systemFont(ofSize: 16, weight: .bold)
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
            contentView.addSubview(categoryStackView)
            
            makeConstraints()
        }
        
        private func makeConstraints() {
            categoryStackView.snp.makeConstraints { make in
                make.top.bottom.equalTo(contentView.safeAreaLayoutGuide)
                make.trailing.equalTo(contentView.safeAreaLayoutGuide).offset(-15)
                make.leading.equalTo(contentView.safeAreaLayoutGuide).inset(15)
            }
            
            choiceImageView.snp.makeConstraints { make in
                make.top.bottom.equalTo(contentView.safeAreaLayoutGuide).inset(15)
                make.width.height.equalTo(15)
            }
        }
        
        func setup(category: CategoriesListModel) {
            self.categoryNameLabel.text = category.category.name
            self.choiceImageView.isHidden = !category.isSelected
        }
    }
}
