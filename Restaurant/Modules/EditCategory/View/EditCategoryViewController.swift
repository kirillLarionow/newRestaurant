//
//  EditCategoryViewController.swift
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

class EditCategoryViewController: UIViewController {
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
    
    private lazy var editCategoryButton: UIButton = {
        UIButton(type: .system).then {
            $0.backgroundColor = AppColor.Theme
            $0.layer.borderWidth = 1
            $0.layer.borderColor = AppColor.Border.cgColor
            $0.layer.cornerRadius = 6
            $0.setTitle("Отредактировать", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            $0.rx
                .tapGesture()
                .when(.recognized)
                .subscribe(onNext: { _ in
                    self.output?.editCategory()
                })
                .disposed(by: disposeBag)
        }
    }()
    
    let disposeBag = DisposeBag()
    var output: EditCategoryViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
        setupView()
    }
}

extension EditCategoryViewController {
    private func setupView() {
        view.backgroundColor = .white
        title = "Редактирование"
        
        
        view.addSubview(mainStackView)
        view.addSubview(editCategoryButton)
        
        makeConstraints()
        setNavigationBarItems()
    }
    
    private func makeConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        categoryNameTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        editCategoryButton.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
    }
    
    private func setNavigationBarItems() {
        let backButton = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(backButtonDidTap))
        backButton.tintColor = AppColor.Theme
        
        navigationItem.setLeftBarButton(backButton, animated: true)
    }
    
    @objc func backButtonDidTap() {
        dismiss(animated: true)
    }
}

extension EditCategoryViewController: EditCategoryViewInput {
    var categoryName: String {
        return categoryNameTextField.text ?? ""
    }
    
    func showEditCategoryError(error: String) {
        let alertController = UIAlertController(title: "Ошибка", message: error, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: " ОК", style: .destructive))
        present(alertController, animated: true)
    }
    
    func showEditCategorySuccess(text: String) {
        let alertController = UIAlertController(title: "Успешное изменение", message: text, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "ОК", style: .default, handler: { alertAction in
            self.dismiss(animated: true)
        }))
        
        present(alertController, animated: true)
    }
    
    func setCategoryForChange(category: CategoryModel) {
        self.categoryNameTextField.text = category.name
    }
}


extension EditCategoryViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == categoryNameTextField {
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


