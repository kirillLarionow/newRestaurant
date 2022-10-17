//
//  CreateIngredientViewController.swift
//  Restaurant
//
//  Created by Kirill Larionov on 12/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import RxGesture
import RxBinding

class CreateIngredientViewController: UIViewController {
    
    private lazy var mainStackView: UIStackView = {
        UIStackView().then {
            $0.axis = .vertical
            $0.spacing = 30
            $0.addArrangedSubview(ingredientStackView)
            $0.addArrangedSubview(caloriesStackView)
        }
    }()
    
    private lazy var ingredientStackView: UIStackView = {
        UIStackView().then {
            $0.axis = .vertical
            $0.spacing = 10
            $0.addArrangedSubview(ingredientNameLabel)
            $0.addArrangedSubview(ingredientNameTextField)
        }
    }()
    
    private lazy var ingredientNameLabel: UILabel = {
        UILabel().then {
            $0.text = "Название ингредиента:"
            $0.textColor = .black
            $0.backgroundColor = view.backgroundColor
            $0.font = .systemFont(ofSize: 16, weight: .medium)
        }
    }()
    
    private lazy var ingredientNameTextField: UITextField = {
        UITextField().then {
            $0.placeholder = "Введите название"
            $0.backgroundColor = .white
            $0.layer.borderWidth = 1
            $0.layer.borderColor = AppColor.Theme.cgColor
            $0.layer.cornerRadius = 6
            let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
            $0.leftViewMode = .always
            $0.leftView = spacerView
            $0.delegate = self
        }
    }()
    
    private lazy var caloriesStackView: UIStackView = {
        UIStackView().then {
            $0.axis = .vertical
            $0.spacing = 10
            $0.addArrangedSubview(caloriesPerGramLabel)
            $0.addArrangedSubview(caloriesPerGramTextField)
        }
    }()
    
    private lazy var caloriesPerGramLabel: UILabel = {
        UILabel().then {
            $0.text = "Калорий за грамм:"
            $0.textColor = .black
            $0.backgroundColor = view.backgroundColor
            $0.font = .systemFont(ofSize: 16, weight: .medium)
        }
    }()
    
    private lazy var caloriesPerGramTextField: UITextField = {
        UITextField().then {
            $0.placeholder = "Введите количество калорий"
            $0.backgroundColor = .white
            $0.layer.borderWidth = 1
            $0.layer.borderColor = AppColor.Theme.cgColor
            $0.layer.cornerRadius = 6
            let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
            $0.leftViewMode = .always
            $0.leftView = spacerView
            $0.keyboardType = .phonePad
        }
    }()
    
    private lazy var createIngredientButton: UIButton = {
        UIButton(type: .system).then {
            $0.backgroundColor = AppColor.Theme
            $0.layer.borderWidth = 1
            $0.layer.borderColor = AppColor.Border.cgColor
            $0.layer.cornerRadius = 6
            $0.setTitle("Создать", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            $0.rx
                .tapGesture()
                .when(.recognized)
                .subscribe(onNext: { _ in
                    self.output?.createIngredient()
                })
                .disposed(by: disposeBag)
        }
    }()
    
    let disposeBag = DisposeBag()
    
    var output: CreateIngredientViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(mainStackView)
        view.addSubview(createIngredientButton)
        
        mainStackView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        ingredientNameTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        caloriesPerGramTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        createIngredientButton.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
    }
}

extension CreateIngredientViewController: CreateIngredientViewInput {
    var ingredientName: String {
        return ingredientNameTextField.text ?? ""
    }
    
    var ingredientCalories: String {
        return caloriesPerGramTextField.text ?? "0"
    }
    
    func showCreateIngredientError(error: String) {
        let alertController = UIAlertController(title: "Ошибка", message: error, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: " ОК", style: .destructive))
        present(alertController, animated: true)
    }
}

extension CreateIngredientViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == ingredientNameTextField {
            let allowedCharacters = "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюяABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
            let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
            let typedCharacterSet = CharacterSet(charactersIn: string)
            let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
            return alphabet
        } else {
            return false
        }
    }
}
