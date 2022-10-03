//
//  LoginForEmployessLoginForEmployessViewController.swift
//  Restaurant
//
//  Created by Kirill Larionov on 03/10/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit
import FirebaseAuth
import SnapKit

class LoginForEmployessViewController: UIViewController {
    
    private lazy var loginTextFieldStackView: UIStackView = {
        let loginTextFieldStackView = UIStackView()
        loginTextFieldStackView.spacing = 10
        loginTextFieldStackView.axis = .vertical
        loginTextFieldStackView.addArrangedSubview(emailTextField)
        loginTextFieldStackView.addArrangedSubview(errorEmailLabel)
        loginTextFieldStackView.addArrangedSubview(passwordTextField)
        loginTextFieldStackView.addArrangedSubview(errorLabel)
        loginTextFieldStackView.addArrangedSubview(errorLoginLabel)
        return loginTextFieldStackView
    }()
    
    lazy private var passwordImageButton: UIButton = {
        let image = UIImage(systemName: "eye")
        let passwordImageButton = UIButton(type: .system)
        passwordImageButton.setImage(image, for: .normal)
        passwordImageButton.tintColor = AppColor.Theme
        passwordImageButton.addTarget(self, action: #selector(passwordImageButtonDidTap), for: .touchUpInside)
        return passwordImageButton
    }()
    
    private lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.layer.cornerRadius = 6
        emailTextField.placeholder = "Email"
        emailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: emailTextField.frame.height))
        emailTextField.leftViewMode = .always
        emailTextField.backgroundColor = .systemGray6
        emailTextField.autocapitalizationType = .none
        return emailTextField
    }()
    
    private lazy var errorEmailLabel: UILabel = {
        let errorEmailLabel = UILabel()
        errorEmailLabel.numberOfLines = 0
        errorEmailLabel.textColor = AppColor.Theme
        errorEmailLabel.textAlignment = .center
        errorEmailLabel.font = UIFont.init(name: "Helvetica-BoldOblique", size: 12)
        return errorEmailLabel
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
        let errorLabel = UILabel()
        errorLabel.numberOfLines = 0
        errorLabel.text = "Пароль должен иметь 6 или более символов"
        errorLabel.textColor = AppColor.Theme
        errorLabel.textAlignment = .center
        errorLabel.font = UIFont.init(name: "Helvetica-BoldOblique", size: 12)
        return errorLabel
    }()
    
    lazy private var loginButton: UIButton = {
        let loginButton = UIButton(type: .system)
        loginButton.layer.cornerRadius = 8
        loginButton.layer.borderColor = AppColor.Theme.cgColor
        loginButton.layer.borderWidth = 1
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        loginButton.setTitle("Войти", for: .normal)
        loginButton.setTitleColor(AppColor.Theme, for: .normal)
        loginButton.backgroundColor = UIColor.white
        loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return loginButton
    }()
    
    private lazy var errorLoginLabel: UILabel = {
        let errorLoginLabel = UILabel()
        errorLoginLabel.numberOfLines = 0
        errorLoginLabel.text = "Возможно такой пользователь уже существует!"
        errorLoginLabel.textColor = AppColor.Theme
        errorLoginLabel.textAlignment = .center
        errorLoginLabel.font = UIFont.init(name: "Helvetica-BoldOblique", size: 12)
        return errorLoginLabel
    }()
    
    var passwordImageButtonState: Bool = true
    var output: LoginForEmployessViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Вход"
        setupView()
    }
    
    private func setupView() {
        view.addSubview(loginTextFieldStackView)
        view.addSubview(loginButton)
        view.addSubview(errorLoginLabel)
        
        errorEmailLabel.isHidden = true
        errorLabel.isHidden = true
        errorLoginLabel.isHidden = true
        
        
        loginTextFieldStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginTextFieldStackView.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(55)
        }
        
        errorLoginLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
}


extension LoginForEmployessViewController {
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
    
    @objc func loginButtonDidTap() {
        guard
            let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            errorLabel.isHidden = false
            errorLabel.text = "Заполните поля"
            return
        }
        
        let isLoginCorrect = email.contains("emp.emp")
        
        
        errorEmailLabel.isHidden = true
        errorLabel.isHidden = true
        
        if isLoginCorrect {
            loginIn(email: email, password: password)
        } else {
            errorLabel.isHidden = false
            errorLabel.text = "Логин не соответствует правилам входа"
        }
    }
    
    private func loginIn(email: String, password: String) {
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if error != nil, let error = error as NSError? {
                if let errorCode = AuthErrorCode(rawValue: error.code) {
                    switch errorCode {
                    case .invalidEmail:
                        self.errorEmailLabel.text = "Некорректный email"
                        self.errorEmailLabel.isHidden = false
                    case .wrongPassword:
                        self.errorLabel.isHidden = false
                        self.errorLabel.text = "Неправильный пароль или логин"
                    case .userNotFound:
                        self.errorEmailLabel.text = "Такого пользователя нет"
                        self.errorEmailLabel.isHidden = false
                    default:
                        break
                    }
                }
            } else {
                print("succes login from FireBase EMPLOYEE")
                
            }
        }
    }
}

extension LoginForEmployessViewController: LoginForEmployessViewInput {

}
