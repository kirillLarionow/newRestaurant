//
//  ProductsCell.swift
//  Restaurant
//
//  Created by кирилл ларионов on 04.10.2022.
//

import UIKit
import Then
import SnapKit

class ProductsCell: UITableViewCell {
    private lazy var titleCellLabel: UILabel = {
        UILabel().then {
            $0.textColor = UIColor.black
            $0.font = .systemFont(ofSize: 16, weight: .medium)
        }
    }()
    
    lazy private var rigthImageView: UIImageView = {
        let largeFont = UIFont.systemFont(ofSize: 24)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        let image = UIImage(systemName: "chevron.right.circle", withConfiguration: configuration)
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
        contentView.addSubview(titleCellLabel)
        contentView.addSubview(rigthImageView)
        
        titleCellLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView.safeAreaLayoutGuide)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).inset(10)
            make.trailing.equalTo(rigthImageView.snp.leading)
        }
        
        rigthImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).inset(10)
            make.height.width.equalTo(24)
        }
    }
    
    func setup(text: String) {
        titleCellLabel.text = text
    }
}
