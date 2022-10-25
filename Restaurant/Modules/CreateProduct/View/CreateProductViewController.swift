//
//  CreateProductViewController.swift
//  Restaurant
//
//  Created by Kirill Larionov on 05/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import RxGesture
import RxBinding

class CreateProductViewController: UIViewController {
    private lazy var categoryView: UIView = {
        UIView().then {
            $0.backgroundColor = .white
            $0.layer.borderWidth = 1
            $0.layer.borderColor = AppColor.Theme.cgColor
            $0.layer.cornerRadius = 6
            $0.addSubview(categoryLabel)
            $0.rx
                .tapGesture()
                .when(.recognized)
                .subscribe(onNext: { _ in
                    print("category tap")
                    self.output?.categoryViewDidTap()
                })
                .disposed(by: disposeBag)
        }
    }()
    
    private lazy var categoryLabel: UILabel = {
        UILabel().then {
            $0.text = "Категория"
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 14, weight: .medium)
        }
    }()
    
    private lazy var titleTextField: UITextField = {
        UITextField().then {
            $0.placeholder = "Название товара"
            $0.backgroundColor = .white
            $0.layer.borderWidth = 1
            $0.layer.borderColor = AppColor.Theme.cgColor
            $0.layer.cornerRadius = 6
            let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
            $0.leftViewMode = .always
            $0.leftView = spacerView
        }
    }()
    
    private lazy var descriptionTextView: UITextView = {
        UITextView().then {
                $0.backgroundColor = .white
                $0.layer.borderWidth = 1
                $0.layer.borderColor = AppColor.Theme.cgColor
                $0.layer.cornerRadius = 6
            $0.delegate = self
            $0.text = "Описание"
            }
        }()
    
    private lazy var ingredientsTitleLabel: UILabel = {
        UILabel().then {
            $0.text = "Ингридиенты:"
            $0.textColor = .black
            $0.backgroundColor = view.backgroundColor
            $0.font = .systemFont(ofSize: 14, weight: .medium)
        }
    }()
    
    private lazy var ingredientsListView: UIView = {
        UIView().then {
            $0.backgroundColor = .white
            $0.layer.borderWidth = 1
            $0.layer.borderColor = AppColor.Theme.cgColor
            $0.layer.cornerRadius = 6
            $0.addSubview(ingredientsLabel)
            $0.addSubview(addIngredientsImageView)
        }
    }()
    
    private lazy var ingredientsLabel: UILabel = {
        UILabel().then {
            $0.text = "Пусто"
            $0.textColor = .black
            $0.backgroundColor = view.backgroundColor
            $0.font = .systemFont(ofSize: 14, weight: .medium)
            $0.numberOfLines = 0
        }
    }()
    
    lazy private var addIngredientsImageView: UIImageView = {
        let largeFont = UIFont.systemFont(ofSize: 20)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        let image = UIImage(systemName: "plus.circle", withConfiguration: configuration)
        let imageView = UIImageView(image: image)
        imageView.tintColor = AppColor.Theme
        imageView.rx
            .tapGesture().when(.recognized).subscribe { _ in
                self.output?.addIngredientsImageViewDidTap()
            }

        return imageView
    }()
    
    private lazy var createIngredientsStackView: UIStackView = {
        UIStackView().then {
            $0.backgroundColor = .white
            $0.layer.borderWidth = 1
            $0.layer.borderColor = AppColor.Theme.cgColor
            $0.layer.cornerRadius = 6
            $0.axis = .horizontal
            $0.addArrangedSubview(createIngredientButton)
            $0.clipsToBounds = true
        }
    }()
    
    private lazy var createIngredientButton: UIButton = {
        UIButton(type: .system).then {
            $0.backgroundColor = AppColor.Theme
            $0.layer.cornerRadius = 6
            $0.setTitle("Создать ингредиент", for: .normal)
            $0.setTitleColor(UIColor.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            $0.rx
                .tapGesture()
                .when(.recognized)
                .subscribe(onNext: { _ in
                    print("create ingredient")
                    self.output?.createIngredientButtonDidTap()
                })
                .disposed(by: disposeBag)
        }
    }()

    private lazy var mainCaloriesStackView: UIStackView = {
        UIStackView().then {
            $0.backgroundColor = view.backgroundColor
            $0.axis = .vertical
            $0.clipsToBounds = true
            $0.addArrangedSubview(caloriesStackView)
            $0.addArrangedSubview(caloriesBottomBorderView)
        }
    }()
    
    private lazy var caloriesStackView: UIStackView = {
        UIStackView().then {
            $0.backgroundColor = view.backgroundColor
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.spacing = 8
            $0.clipsToBounds = true
            $0.addArrangedSubview(countOfCalories)
            $0.addArrangedSubview(caloriesLabel)
        }
    }()
    
    private lazy var countOfCalories: UILabel = {
        UILabel().then {
            $0.text = "0"
            $0.textColor = .black
            $0.backgroundColor = view.backgroundColor
            $0.font = .systemFont(ofSize: 14, weight: .medium)
            $0.textAlignment = .center
        }
    }()
    
    private lazy var caloriesLabel: UILabel = {
        UILabel().then {
            $0.text = "калорий"
            $0.textColor = .black
            $0.backgroundColor = view.backgroundColor
            $0.font = .systemFont(ofSize: 14, weight: .medium)
            $0.textAlignment = .center
        }
    }()
    
    private lazy var createProductButton: UIButton = {
        UIButton(type: .system).then {
            $0.backgroundColor = AppColor.Theme
            $0.layer.cornerRadius = 6
            $0.setTitle("Создать товар", for: .normal)
            $0.setTitleColor(UIColor.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        }
    }()
    
    private lazy var caloriesBottomBorderView: UIView = {
        UIView().then {
            $0.backgroundColor = AppColor.Theme
        }
    }()
    
    let disposeBag = DisposeBag()
    
    
    var output: CreateProductViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Создание товара"
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(categoryView)
        view.addSubview(titleTextField)
        view.addSubview(descriptionTextView)
        view.addSubview(ingredientsTitleLabel)
        view.addSubview(ingredientsListView)
        view.addSubview(createIngredientsStackView)
        view.addSubview(mainCaloriesStackView)
        view.addSubview(createProductButton)
        
        categoryView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(40)
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(categoryView.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        
        descriptionTextView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(titleTextField.snp.bottom).offset(20)
            make.height.equalTo(80)
        }
        
        ingredientsTitleLabel.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(25)
            make.top.equalTo(descriptionTextView.snp.bottom).offset(50)
        }
        
        ingredientsListView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(ingredientsTitleLabel.snp.bottom).offset(10)
            make.height.equalTo(100)
        }
        
        ingredientsLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(45)
        }
        
        addIngredientsImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(10)
        }
        
        createIngredientsStackView.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(25)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(25)
            make.top.equalTo(ingredientsListView.snp.bottom).offset(10)
            make.height.equalTo(40)
        }
        
        mainCaloriesStackView.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(createIngredientsStackView.snp.bottom).offset(10)
            make.height.equalTo(40)
            make.width.equalTo(view.bounds.width / 2)
        }
        
        createProductButton.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(40)
        }
        
        caloriesBottomBorderView.snp.makeConstraints { make in
            make.height.equalTo(1)
        }

    }
}

extension CreateProductViewController: CreateProductViewInput {
    func updateCategory(category: CategoryModel) {
        self.categoryLabel.text = category.name
    }
    
    func updateIngredientsAndCalories(ingredients: [IngredientModel]) {
        self.ingredientsLabel.text = ingredients.map({ $0.name }).joined(separator: ", ")
        let calories = ingredients.map({ $0.calories })
        self.countOfCalories.text = "\(calories.reduce(0, +))"
        self.caloriesLabel.text = "ккал."
    }
    
}

extension CreateProductViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Описание" {
            textView.text = nil
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Описание"
        }
    }
}
