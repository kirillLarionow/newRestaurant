//
//  LoginPageLoginPageViewController.swift
//  Restaurant
//
//  Created by Kirill Larionov on 04/09/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit
import SnapKit

class LoginPageViewController: UIViewController {
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 36)
        titleLabel.numberOfLines = 0
        titleLabel.text = "Ресторан №1"
        return titleLabel
    }()
    
    private lazy var descriptionTitleLabel: UILabel = {
        let descriptionTitleLabel = UILabel()
        descriptionTitleLabel.textColor = .black
        descriptionTitleLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionTitleLabel.numberOfLines = 0
        descriptionTitleLabel.text = "Пройдите регистрацию, \nчтобы увидеть основую информацию \nо ресторане"
        return descriptionTitleLabel
    }()
    
    private lazy var loginTitleImageView: UIImageView = {
        let loginTitleImageView = UIImageView()
        loginTitleImageView.image = UIImage(named: "loginTitleImage")
        return loginTitleImageView
    }()
    
    private lazy var registrationTextFieldStackView: UIStackView = {
        let registrationTextFieldStackView = UIStackView()
        registrationTextFieldStackView.spacing = 10
       // registrationTextFieldStackView.distribution = .fill
        registrationTextFieldStackView.axis = .vertical
        registrationTextFieldStackView.addArrangedSubview(loginEmailTextField)
        registrationTextFieldStackView.addArrangedSubview(passwordTextField)
        return registrationTextFieldStackView
    }()
    
    private lazy var loginEmailTextField: UITextField = {
        let loginEmailTextField = UITextField()
        loginEmailTextField.layer.cornerRadius = 6
        loginEmailTextField.placeholder = "   Email"
        loginEmailTextField.backgroundColor = .systemGray6
        return loginEmailTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.layer.cornerRadius = 6
        passwordTextField.placeholder = "   Пароль"
        passwordTextField.backgroundColor = .systemGray6
        return passwordTextField
    }()
    
    lazy private var loginButton: UIButton = {
        let loginButton = UIButton(type: .system)
        loginButton.layer.cornerRadius = 6
        loginButton.setTitle("Войти", for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.backgroundColor = AppColor.Theme
        return loginButton
    }()
    
    lazy private var fogotPasswordLabel: UILabel = {
        let fogotPasswordLabel = UILabel()
        fogotPasswordLabel.text = "Забыли пароль?"
        fogotPasswordLabel.textColor = AppColor.Theme
        fogotPasswordLabel.font = UIFont.systemFont(ofSize: 16)
        return fogotPasswordLabel
    }()
    
    lazy private var registrationButton: UIButton = {
        let registrationButton = UIButton(type: .system)
        registrationButton.layer.cornerRadius = 6
        registrationButton.setTitleColor(UIColor.black, for: .normal)
        registrationButton.contentHorizontalAlignment = .leading
        registrationButton.setTitle("   Зарегистрироваться", for: .normal)
        registrationButton.backgroundColor = .white
        registrationButton.layer.borderWidth = 1
        registrationButton.layer.borderColor = AppColor.Border.cgColor
        return registrationButton
    }()
    
//    lazy private var passwordImageButton: UIImageView = {
//        let largeFont = UIFont.systemFont(ofSize: 60)
//        let configuration = UIImage.SymbolConfiguration(font: largeFont)
//        let image = UIImage(systemName: "eye", withConfiguration: configuration)
//        let passwordImageButton = UIImageView(image: image)
//        passwordImageButton.tintColor = AppColor.Theme
//        return passwordImageButton
//    }()
    
    lazy private var passwordImageButton: UIButton = {
        let image = UIImage(systemName: "eye")
        let passwordImageButton = UIButton(type: .system)
        passwordImageButton.setImage(image, for: .normal)
        passwordImageButton.tintColor = AppColor.Theme
        return passwordImageButton
    }()
    
    var output: LoginPageViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(descriptionTitleLabel)
        view.addSubview(loginTitleImageView)
        view.addSubview(registrationTextFieldStackView)
        view.addSubview(loginButton)
        view.addSubview(fogotPasswordLabel)
        view.addSubview(registrationButton)
        view.addSubview(passwordImageButton)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.top.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        loginTitleImageView.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(100)
            make.width.equalTo(120)
        }
        
        descriptionTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-10)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        registrationTextFieldStackView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(registrationTextFieldStackView.snp.bottom).inset(-20)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        passwordImageButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(28)
            make.centerX.equalToSuperview().offset(150)
            //make.height.width.equalTo(35)
        }
        
        fogotPasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).inset(-35)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        registrationButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        loginEmailTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints { make in
            make.height.equalTo(55)
        }
        
        registrationButton.snp.makeConstraints { make in
            make.height.equalTo(55)
        }
    }
}

extension LoginPageViewController: LoginPageViewInput {

}
