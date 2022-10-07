//
//  ProductsListTableViewCell.swift
//  Restaurant
//
//  Created by кирилл ларионов on 05.10.2022.
//

import UIKit
import SnapKit
import Then

class ProductsListTableViewCell: UITableViewCell {
    private lazy var categoryNameSectionLabel: UILabel = {
        UILabel().then {
            $0.textColor = UIColor.black
            $0.font = .systemFont(ofSize: 16, weight: .medium)
        }
    }()
    
    private lazy var productNameRowLabel: UILabel = {
        UILabel().then {
            $0.textColor = UIColor.black
            $0.font = .systemFont(ofSize: 16, weight: .light)
        }
    }()
    
   
    lazy private var rigthImageView: UIImageView = {
        let largeFont = UIFont.systemFont(ofSize: 24)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        let image = UIImage(systemName: "chevron.down.circle", withConfiguration: configuration)
        let rigthImageView = UIImageView(image: image)
        rigthImageView.tintColor = AppColor.Theme
        return rigthImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(categoryNameSectionLabel)
        contentView.addSubview(rigthImageView)
        contentView.addSubview(productNameRowLabel)
        
        categoryNameSectionLabel.snp.remakeConstraints { make in
            make.top.bottom.equalTo(contentView.safeAreaLayoutGuide)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).inset(10)
            make.trailing.equalTo(rigthImageView.snp.leading)
        }
        
        rigthImageView.snp.remakeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).inset(10)
            make.height.width.equalTo(24)
        }
        
        productNameRowLabel.snp.remakeConstraints { make in
            make.top.bottom.equalTo(contentView.safeAreaLayoutGuide)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).inset(10)
            make.trailing.equalTo(rigthImageView.snp.leading)
        }
    }
    
    func setup(category: Section, product: String, isShowImage: Bool) {
        categoryNameSectionLabel.text = category.title
        productNameRowLabel.text = product
        rigthImageView.isHidden = isShowImage
        
        if category.isOpened {
            rigthImageView.image = UIImage(systemName: "chevron.up.circle")
        } else {
            rigthImageView.image = UIImage(systemName: "chevron.down.circle")
        }
    }
}
