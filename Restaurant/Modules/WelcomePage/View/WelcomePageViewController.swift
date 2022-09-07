//
//  WelcomePageWelcomePageViewController.swift
//  Restaurant
//
//  Created by Kirill Larionov on 01/09/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit
import SnapKit

class WelcomePageViewController: UIViewController {
    lazy private var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.register(WelcomePageCollectionViewCell.self, forCellWithReuseIdentifier: collectionViewCellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    lazy private var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        pageControl.backgroundColor = .white
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = AppColor.Theme
        //pageControl.layer.borderWidth = 1
      //  pageControl.layer.borderColor = UIColor.purple.cgColor
        return pageControl
    }()
    
    lazy private var skipButton: UIButton = {
        let skipButton = UIButton(type: .system)
        skipButton.setTitle("Пропустить", for: .normal)
        skipButton.setTitleColor(AppColor.Theme, for: .normal)
        skipButton.addTarget(self, action: #selector(skipButtonDidTap), for: .touchUpInside)
        return skipButton
    }()
    
    private var welcomeDataText: [[String: String]] = []
    let collectionViewCellIdentifier = "WelcomePageCollectionViewCell"
    var output: WelcomePageViewOutput?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    private func setupView() {
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(skipButton)
        
        makeConstraints()
        addWelcomeData()
    }
    
    private func makeConstraints() {
        collectionView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.bottom.equalTo(pageControl.snp.top).inset(0)
        }
        
        pageControl.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(100)
        }
        
        skipButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-35)
            make.width.equalTo(100)
        }
    }
    
    private func addWelcomeData() {
        welcomeDataText.removeAll()

        var dict1: [String: String] = [:]
        dict1["title1"] = "Ресторан №1"
        dict1["description1"] = "Обладатель мишленовской звезды"
        dict1["title2"] = "Москва ул. Бауманская"
        dict1["description2"] = "+7 (499)-243-45 66"
        
        var dict2: [String: String] = [:]
        dict2["title1"] = "Многогранность"
        dict2["description1"] = "Изысканный аромат и неповторимый вкус блюд"
        dict2["title2"] = "Баланс"
        dict2["description2"] = "Идеальный баланс разных сортов вин"

        var dict3: [String: String] = [:]
        dict3["title1"] = "Интерьер зала"
        dict3["description1"] = "Выдержанный инерьер с нотками лоска"
        dict3["title2"] = "Интерьер VIP-зала"
        dict3["description2"] = "Барокко – стиль, созданный, чтобы показать силу и грандиозность церкви XVII века."
        
        var dict4: [String: String] = [:]
        dict4["title1"] = "Кухня"
        dict4["description1"] = "Лучшие повара современности собрались в одном месте, чтобы скрасить Ваш вечер"
        dict4["title2"] = "Блюда"
        dict4["description2"] = "Каждое блюдо является уникальным, созданным по авторским рецептам"
        
        welcomeDataText.append(dict1)
        welcomeDataText.append(dict2)
        welcomeDataText.append(dict3)
        welcomeDataText.append(dict4)
        

        reloadCollectionView()
    }
    
    private func reloadCollectionView() {
        collectionView.reloadData()
    }
}


extension WelcomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return welcomeDataText.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: collectionViewCellIdentifier,
                for: indexPath) as? WelcomePageCollectionViewCell
        else {
            fatalError()
        }
        
        cell.backgroundColor = .white
  
        cell.setup(data: welcomeDataText[indexPath.row], indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.size.height
        let width = collectionView.frame.size.width
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
        
        if indexPath.item == (welcomeDataText.count - 1)
           {
            skipButton.setTitle("Закончить", for: .normal)
            skipButton.setTitleColor(AppColor.Theme, for: .normal)
        } else {
            skipButton.setTitle("Пропустить", for: .normal)
            skipButton.setTitleColor(AppColor.Theme, for: .normal)
        }
    }
}


extension WelcomePageViewController {
    @objc private func skipButtonDidTap() {
        UserDefaults.standard.set(true, forKey: "welcomePage")
        let loginPageModule = LoginPageModule.createModule()
        loginPageModule.view.modalPresentationStyle = .overFullScreen
        loginPageModule.view.modalTransitionStyle = .crossDissolve
        present(loginPageModule.view, animated: true)
    }
}


extension WelcomePageViewController: WelcomePageViewInput {

}
