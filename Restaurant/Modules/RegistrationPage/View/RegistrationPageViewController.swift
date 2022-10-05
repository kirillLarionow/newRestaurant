//
//  RegistrationPageRegistrationPageViewController.swift
//  Restaurant
//
//  Created by Kirill Larionov on 08/09/2022.
//  Copyright © 2022 MD LCC. All rights reserved.
//

import UIKit
import FirebaseAuth
import SnapKit

class RegistrationPageViewController: UIViewController {
    private lazy var registrationImageView: UIImageView = {
        let registrationImageView = UIImageView()
        registrationImageView.image = UIImage(named: "registrationImage")
        return registrationImageView
    }()
    
    private lazy var registrationTextFieldStackView: UIStackView = {
        let registrationTextFieldStackView = UIStackView()
        registrationTextFieldStackView.spacing = 10
        // registrationTextFieldStackView.distribution = .fill
        registrationTextFieldStackView.axis = .vertical
        registrationTextFieldStackView.addArrangedSubview(emailTextField)
        registrationTextFieldStackView.addArrangedSubview(errorEmailLabel)
        registrationTextFieldStackView.addArrangedSubview(passwordTextField)
        registrationTextFieldStackView.addArrangedSubview(errorPasswordLabel)
        registrationTextFieldStackView.addArrangedSubview(confirmPasswordTextField)
        registrationTextFieldStackView.addArrangedSubview(errorConfirmPasswordLabel)
        return registrationTextFieldStackView
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
        passwordTextField.autocapitalizationType = .none
        return passwordTextField
    }()
    
    private lazy var errorPasswordLabel: UILabel = {
        let errorPasswordLabel = UILabel()
        errorPasswordLabel.numberOfLines = 0
        errorPasswordLabel.text = "Пароль должен иметь 6 или более символов"
        errorPasswordLabel.textColor = AppColor.Theme
        errorPasswordLabel.textAlignment = .center
        errorPasswordLabel.font = UIFont.init(name: "Helvetica-BoldOblique", size: 12)
        return errorPasswordLabel
    }()
    
    private lazy var confirmPasswordTextField: UITextField = {
        let confirmPasswordTextField = UITextField()
        confirmPasswordTextField.layer.cornerRadius = 6
        confirmPasswordTextField.placeholder = "Повторите пароль"
        confirmPasswordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: confirmPasswordTextField.frame.height))
        confirmPasswordTextField.leftViewMode = .always
        confirmPasswordTextField.backgroundColor = .systemGray6
        confirmPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.autocapitalizationType = .none
        // confirmPasswordTextField.delegate = self
        return confirmPasswordTextField
    }()
    
    private lazy var errorConfirmPasswordLabel: UILabel = {
        let errorConfirmPasswordLabel = UILabel()
        errorConfirmPasswordLabel.numberOfLines = 0
        errorConfirmPasswordLabel.text = "Пароли не совпадают"
        errorConfirmPasswordLabel.textColor = AppColor.Theme
        errorConfirmPasswordLabel.textAlignment = .center
        errorConfirmPasswordLabel.font = UIFont.init(name: "Helvetica-BoldOblique", size: 12)
        return errorConfirmPasswordLabel
    }()
    
    lazy private var registrationButton: UIButton = {
        let registrationButton = UIButton(type: .system)
        registrationButton.layer.cornerRadius = 6
        registrationButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        registrationButton.setTitle("Зарегистрироваться", for: .normal)
        registrationButton.setTitleColor(UIColor.white, for: .normal)
        registrationButton.backgroundColor = AppColor.Theme
        registrationButton.addTarget(self, action: #selector(registrationButtonDidTap), for: .touchUpInside)
        return registrationButton
    }()
    
    private lazy var errorRegistrationLabel: UILabel = {
        let errorRegistrationLabel = UILabel()
        errorRegistrationLabel.numberOfLines = 0
        errorRegistrationLabel.text = "Возможно такой пользователь уже существует!"
        errorRegistrationLabel.textColor = AppColor.Theme
        errorRegistrationLabel.textAlignment = .center
        errorRegistrationLabel.font = UIFont.init(name: "Helvetica-BoldOblique", size: 12)
        return errorRegistrationLabel
    }()
    
    var output: RegistrationPageViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Регистрация"
        setupView()
    }
    
    private func setupView() {
        view.addSubview(registrationImageView)
        view.addSubview(registrationTextFieldStackView)
        view.addSubview(registrationButton)
        view.addSubview(errorRegistrationLabel)
        
        errorEmailLabel.isHidden = true
        errorPasswordLabel.isHidden = true
        errorConfirmPasswordLabel.isHidden = true
        errorRegistrationLabel.isHidden = true
        
        registrationImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.height.width.equalTo(100)
        }
        
        registrationTextFieldStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(registrationImageView.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        registrationButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(registrationTextFieldStackView.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(55)
        }
        
        errorRegistrationLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(registrationButton.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        confirmPasswordTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
}

extension RegistrationPageViewController {
    @objc func registrationButtonDidTap() {
        guard
            let email = emailTextField.text, !email.isEmpty,
            let password = passwordTextField.text, !password.isEmpty else {
            errorRegistrationLabel.isHidden = false
            errorRegistrationLabel.text = "Заполните поля"
            return
        }
        
        errorEmailLabel.isHidden = true
        errorPasswordLabel.isHidden = true
        errorConfirmPasswordLabel.isHidden = true
        errorRegistrationLabel.isHidden = true
        
        if (password != confirmPasswordTextField.text) {
            errorConfirmPasswordLabel.isHidden = false
            errorConfirmPasswordLabel.text = "Пароли не совпадают"
        } else {
            showCreateAccount(email: email, password: password)
        }
        
    }
    
    func showCreateAccount(email: String, password: String) {
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else {
                return
            }
            
            if error != nil, let error = error as NSError? {
                if let errorCode = AuthErrorCode.Code(rawValue: error.code) {
                    switch errorCode {
                    case .invalidEmail:
                        self.errorEmailLabel.text = "Некорректный email"
                        self.errorEmailLabel.isHidden = false
                    case .emailAlreadyInUse:
                        self.errorEmailLabel.text = "Такой email уже используется"
                        self.errorEmailLabel.isHidden = false
                    case .weakPassword:
                        self.errorPasswordLabel.isHidden = false
                    default:
                        break
                    }
                }
            } else {
                self.showSuccesRegistrationAlert()
            }
        }
    }
    
    private func showSuccesRegistrationAlert() {
        let imageView = UIImageView(frame: CGRect(x: 220, y: 10, width: 40, height: 40))
        imageView.image = UIImage(named: "registrationComplitedImage")
        let alert = UIAlertController(title: "", message: "Успешная регистрация", preferredStyle: .alert)
        alert.view.addSubview(imageView)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: { alertAction in
            self.output?.successRegistration()
        }))
        self.present(alert, animated: true)
    }
}

extension RegistrationPageViewController: RegistrationPageViewInput {
    
}
