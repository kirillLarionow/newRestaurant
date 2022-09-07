//
//  WelcomePageCollectionViewCell.swift
//  Restaurant
//
//  Created by кирилл ларионов on 01.09.2022.
//

import Foundation
import UIKit

class WelcomePageCollectionViewCell: UICollectionViewCell {
    lazy private var firstStackView: UIStackView = {
        let firstStackView = UIStackView()
        firstStackView.axis = .vertical
        firstStackView.alignment = .center
        firstStackView.distribution = .fill
        firstStackView.spacing = 20
        firstStackView.contentMode = .scaleToFill
        firstStackView.semanticContentAttribute = .unspecified
        firstStackView.addArrangedSubview(firstWelcomeTitle)
        firstStackView.addArrangedSubview(firstWelcomeDescription)
        return firstStackView
    }()
    
    lazy private var secondStackView: UIStackView = {
        let secondStackView = UIStackView()
        secondStackView.axis = .vertical
        secondStackView.alignment = .center
        secondStackView.distribution = .fill
        secondStackView.spacing = 20
        secondStackView.contentMode = .scaleToFill
        secondStackView.semanticContentAttribute = .unspecified
        secondStackView.addArrangedSubview(secondWelcomeTitle)
        secondStackView.addArrangedSubview(secondWelcomeDescription)
        return secondStackView
    }()
    
    lazy private var firstWelcomeTitle: UILabel = {
        let firstWelcomeTitle = UILabel()
        firstWelcomeTitle.textColor = .black
        firstWelcomeTitle.numberOfLines = 0
        firstWelcomeTitle.font = .systemFont(ofSize: 14.0, weight: .regular)
        return firstWelcomeTitle
    }()
    
    lazy private var firstWelcomeDescription: UILabel = {
        let firstWelcomeDescription = UILabel()
        firstWelcomeDescription.textColor = .black
        firstWelcomeDescription.numberOfLines = 0
        firstWelcomeDescription.font = .systemFont(ofSize: 14.0, weight: .regular)
        return firstWelcomeDescription
    }()
    
    lazy private var secondWelcomeTitle: UILabel = {
        let secondWelcomeTitle = UILabel()
        secondWelcomeTitle.textColor = .red
        secondWelcomeTitle.numberOfLines = 0
        secondWelcomeTitle.font = .systemFont(ofSize: 14.0, weight: .regular)
        return secondWelcomeTitle
    }()
    
    lazy private var secondWelcomeDescription: UILabel = {
        let secondWelcomeDescription = UILabel()
        secondWelcomeDescription.textColor = .red
        secondWelcomeDescription.numberOfLines = 0
        secondWelcomeDescription.font = .systemFont(ofSize: 14.0, weight: .regular)
        return secondWelcomeDescription
    }()
    
    
    lazy private var sliderImage: UIImageView = {
        let sliderImage = UIImageView()
        return sliderImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        contentView.addSubview(sliderImage)
        contentView.addSubview(firstStackView)
        contentView.addSubview(secondStackView)

        makeConstraints()
    }
    
    private func makeConstraints() {
        firstStackView.snp.makeConstraints { make in
            make.leading.top.equalTo(contentView.safeAreaLayoutGuide).inset(40)
            make.width.equalTo(200)
        }
        
        secondStackView.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).offset(-40)
            make.bottom.equalTo(contentView.safeAreaLayoutGuide).offset(-80)
            make.width.equalTo(200)
        }
    }

    func setup(data: [String: String], indexPath: IndexPath) {
        guard let feature1 = data["title1"] else { return }
        guard let description1 = data["description1"] else { return }
        guard let feature2 = data["title2"] else { return }
        guard let description2 = data["description2"] else { return }
        
        firstWelcomeTitle.text = feature1
        firstWelcomeDescription.text = description1
        secondWelcomeTitle.text = feature2
        secondWelcomeDescription.text = description2
        
        switch indexPath.row {
        case 0:
            setupFirstPicture()
        case 1:
            setupSecondPicture()
        case 2:
           setupThirdPicture()
        case 3:
            setupFourthPicture()
        default :
            break
        }
    }
    
    private func setupFirstPicture() {
        self.layoutIfNeeded()
        sliderImage.layer.cornerRadius = 6
        sliderImage.layer.masksToBounds = true
        
        sliderImage.image = UIImage(named: "slider1")
      
        sliderImage.snp.remakeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(450)
        }
    }
    
    private func setupSecondPicture() {
        self.layoutIfNeeded()
        sliderImage.layer.cornerRadius = 6
        sliderImage.layer.masksToBounds = true
        
        sliderImage.image = UIImage(named: "slider2")
       
        sliderImage.snp.remakeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalTo(300)
        }
    }
    
    private func setupThirdPicture() {
        sliderImage.image = UIImage(named: "slider3")
       
        sliderImage.snp.remakeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(contentView.safeAreaLayoutGuide)
            make.height.equalTo(300)
        }
    }
    
    private func setupFourthPicture() {
        sliderImage.image = UIImage(named: "slider4")
     
        sliderImage.snp.remakeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(contentView.safeAreaLayoutGuide)
            make.height.equalTo(300)
        }
    }
}
