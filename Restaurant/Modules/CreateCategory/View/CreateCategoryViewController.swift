//
//  CreateCategoryViewController.swift
//  Restaurant
//
//  Created by Kirill Larionov on 19/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import RxGesture
import RxBinding


class CreateCategoryViewController: UIViewController {
    private lazy var mainStackView: UIStackView = {
        UIStackView().then {
            $0.axis = .vertical
            $0.spacing = 30
            $0.addArrangedSubview(categoryStackView)
        }
    }()
    
    private lazy var categoryStackView: UIStackView = {
        UIStackView().then {
            $0.axis = .vertical
            $0.spacing = 10
            $0.addArrangedSubview(categoryNameLabel)
            $0.addArrangedSubview(categoryNameTextField)
        }
    }()
    
    private lazy var categoryNameLabel: UILabel = {
        UILabel().then {
            $0.text = "Название категории:"
            $0.textColor = .black
            $0.backgroundColor = view.backgroundColor
            $0.font = .systemFont(ofSize: 16, weight: .medium)
        }
    }()
    
    private lazy var categoryNameTextField: UITextField = {
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
    
    
    private lazy var createCategoryButton: UIButton = {
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
                    self.output?.createCategory()
                })
                .disposed(by: disposeBag)
        }
    }()
    
    let disposeBag = DisposeBag()
    var output: CreateCategoryViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(mainStackView)
        view.addSubview(createCategoryButton)
        
        mainStackView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        categoryNameTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        createCategoryButton.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
    }
}

extension CreateCategoryViewController: CreateCategoryViewInput {
    var categoryName: String {
        return categoryNameTextField.text ?? ""
    }
    
    func showCreateCategoryError(error: String) {
        let alertController = UIAlertController(title: "Ошибка", message: error, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: " ОК", style: .destructive))
        present(alertController, animated: true)
    }
    
    func showCreateCategorySuccess(text: String) {
        let alertController = UIAlertController(title: "Успешное создание", message: text, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "ОК", style: .default, handler: { alertAction in
            self.output?.closeCurrentModule()
        }))
        
        present(alertController, animated: true)
    }
}

extension CreateCategoryViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == categoryNameTextField {
            let allowedCharacters = "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюяABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
            let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
            let typedCharacterSet = CharacterSet(charactersIn: string)
            let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
            
            let currentText = textField.text ?? ""

            guard let stringRange = Range(range, in: currentText) else { return false }

          
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            
            return alphabet && updatedText.count <= 22
        
        } else {
            return false
        }
    }
}
