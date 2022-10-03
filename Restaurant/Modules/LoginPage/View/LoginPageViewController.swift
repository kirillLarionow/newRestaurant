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
        registrationTextFieldStackView.axis = .vertical
        registrationTextFieldStackView.addArrangedSubview(loginEmailTextField)
        registrationTextFieldStackView.addArrangedSubview(passwordTextField)
        registrationTextFieldStackView.addArrangedSubview(errorLabel)
        return registrationTextFieldStackView
    }()
    
    private lazy var loginEmailTextField: UITextField = {
        let loginEmailTextField = UITextField()
        loginEmailTextField.layer.cornerRadius = 6
        loginEmailTextField.placeholder = "Email"
        loginEmailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: loginEmailTextField.frame.height))
        loginEmailTextField.leftViewMode = .always
        loginEmailTextField.backgroundColor = .systemGray6
        loginEmailTextField.autocapitalizationType = .none
        return loginEmailTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.layer.cornerRadius = 6
        passwordTextField.placeholder = "Пароль"
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.isSecureTextEntry = true
        passwordTextField.rightView = passwordImageButton
        passwordTextField.rightViewMode = .always
        passwordTextField.autocapitalizationType = .none
        passwordTextField.addSubview(passwordImageButton)
        return passwordTextField
    }()
    
    private lazy var errorLabel: UILabel = {
        let errorPasswordLabel = UILabel()
        errorPasswordLabel.numberOfLines = 0
        errorPasswordLabel.textColor = AppColor.Theme
        errorPasswordLabel.textAlignment = .center
        errorPasswordLabel.font = UIFont.init(name: "Helvetica-BoldOblique", size: 12)
        return errorPasswordLabel
    }()
    
    lazy private var loginButton: UIButton = {
        let loginButton = UIButton(type: .system)
        loginButton.layer.cornerRadius = 6
        loginButton.setTitle("Войти", for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        loginButton.backgroundColor = AppColor.Theme
        loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return loginButton
    }()
    
    lazy private var loginForEmployees: UIButton = {
        let loginForEmployees = UIButton(type: .system)
        loginForEmployees.layer.cornerRadius = 6
        loginForEmployees.setTitle("Войти как сотрудник", for: .normal)
        loginForEmployees.setTitleColor(AppColor.Theme, for: .normal)
        loginForEmployees.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        loginForEmployees.backgroundColor = UIColor.white
        loginForEmployees.addTarget(self, action: #selector(loginForEmployeesDidTap), for: .touchUpInside)
        return loginForEmployees
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
        registrationButton.addSubview(chevronRightImageView)
        registrationButton.addTarget(self, action: #selector(registrationButtonDidTap), for: .touchUpInside)
        return registrationButton
    }()
    
    lazy private var passwordImageButton: UIButton = {
        let image = UIImage(systemName: "eye")
        let passwordImageButton = UIButton(type: .system)
        passwordImageButton.setImage(image, for: .normal)
        passwordImageButton.tintColor = AppColor.Theme
        passwordImageButton.addTarget(self, action: #selector(passwordImageButtonDidTap), for: .touchUpInside)
        return passwordImageButton
    }()
    
    lazy private var chevronRightImageView: UIImageView = {
        let largeFont = UIFont.systemFont(ofSize: 24)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        let image = UIImage(systemName: "chevron.right", withConfiguration: configuration)
        let chevronRightImageView = UIImageView(image: image)
        chevronRightImageView.tintColor = AppColor.Border
        return chevronRightImageView
    }()
    
    var output: LoginPageViewOutput?
    var passwordImageButtonState: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(descriptionTitleLabel)
        view.addSubview(loginTitleImageView)
        view.addSubview(registrationTextFieldStackView)
        view.addSubview(loginButton)
        view.addSubview(loginForEmployees)
        view.addSubview(fogotPasswordLabel)
        view.addSubview(registrationButton)
        
        errorLabel.isHidden = true
        
        titleLabel.snp.makeConstraints { make in
            make.leading.top.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        loginTitleImageView.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).offset(40)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(80)
            make.width.equalTo(80)
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
        
        fogotPasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).inset(-35)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        
        loginForEmployees.snp.makeConstraints { make in
            make.bottom.equalTo(registrationButton.snp.top).inset(-20)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        registrationButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        chevronRightImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)
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

extension LoginPageViewController {
    @objc func passwordImageButtonDidTap() {
        if passwordImageButtonState {
            let image = UIImage(systemName: "eye.slash.fill")
            self.passwordImageButton.setImage(image, for: .normal)
            self.passwordImageButton.tintColor = AppColor.Theme
            self.passwordTextField.isSecureTextEntry = false
            passwordImageButtonState = false
        } else {
            let image = UIImage(systemName: "eye")
            self.passwordImageButton.setImage(image, for: .normal)
            self.passwordImageButton.tintColor = AppColor.Theme
            self.passwordTextField.isSecureTextEntry = true
            passwordImageButtonState = true
        }
    }
    
    @objc func registrationButtonDidTap() {
        output?.registrationButtonDidTap()
    }
    
    @objc func loginButtonDidTap() {
        guard
            let email = loginEmailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            errorLabel.isHidden = false
            errorLabel.text = "Заполните поля"
            return
        }
        
        errorLabel.isHidden = true
        
        let isLoginEmployee = email.contains("emp.emp")
        if isLoginEmployee {
            errorLabel.isHidden = false
            errorLabel.text = "Вход сотрудникам через кнопку ' Войти как сотрудник '"
        } else {
            output?.loginIn(email: email, password: password)
        }
    }
    
    @objc func loginForEmployeesDidTap() {
        output?.loginForEmployeesDidTap()
    }
}

extension LoginPageViewController: LoginPageViewInput {
    func updateErrorMessage(error: String) {
        errorLabel.isHidden = false
        errorLabel.text = error
    }
}
