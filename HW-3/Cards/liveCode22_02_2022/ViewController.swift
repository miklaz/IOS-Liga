//
//  ViewController.swift
//  liveCode22_02_2022
//
//  Created by Михаил Зайцев on 22.02.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Const & Var
    private lazy var subviewBackgroundColor: UIColor = .secondarySystemFill
    private lazy var subviewCornerRadius: CGFloat = 20
    private lazy var buttonCornerRadius: CGFloat = 8
    private lazy var successColor: UIColor = .systemGreen
    private lazy var unSuccessColor: UIColor = .systemRed
    
    private lazy var layerShadowRadius: CGFloat = 3
    private lazy var layerShadowOpacity: Float = 0.8
    private lazy var layerShadowOffset: CGSize = .zero
    
    // Views
    private lazy var firstCardView: UIView = {
        let view = UIView()
        view.backgroundColor = subviewBackgroundColor
        view.layer.cornerRadius = subviewCornerRadius
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    } ()
    
    private lazy var secondCardView: UIView = {
        let view = UIView()
        view.backgroundColor = subviewBackgroundColor
        view.layer.cornerRadius = subviewCornerRadius
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    } ()
    
    // Text Fields
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите имя"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.shadowRadius = layerShadowRadius
        textField.layer.shadowOpacity = layerShadowOpacity
        textField.layer.shadowOffset = CGSize.zero
        //textField.layer.masksToBounds = false
        
        return textField
    } ()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите Email"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.shadowRadius = layerShadowRadius
        textField.layer.shadowOpacity = layerShadowOpacity
        textField.layer.shadowOffset = CGSize.zero

        return textField
    } ()
    
    // Validate Buttons
    private lazy var nameValidateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Валидировать имя", for: .normal)
        button.setTitle("Валидация...", for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = buttonCornerRadius
        button.addTarget(self, action: #selector(didTapNameValidateButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var emailValidateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Валидировать Email", for: .normal)
        button.setTitle("Валидация...", for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = buttonCornerRadius
        button.addTarget(self, action: #selector(didTapNameValidateButton), for: .touchUpInside)
        
        return button
    }()
    
    // Validate Labels
    private lazy var nameValidateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ожидание валидации имени..."
        
        return label
    }()
    
    private lazy var emailValidateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ожидание валидации Email..."
        
        return label
    }()
    
    // MARK: - VС Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

extension ViewController {
    // MARK: - Private metods
    private func configureView() {
        view.backgroundColor = .systemBackground
        view.addSubview(firstCardView)
    
        firstCardView.addSubview(nameTextField)
        firstCardView.addSubview(nameValidateButton)
        firstCardView.addSubview(nameValidateLabel)
        
        view.addSubview(secondCardView)
        secondCardView.addSubview(emailTextField)
        secondCardView.addSubview(emailValidateButton)
        secondCardView.addSubview(emailValidateLabel)
        
        NSLayoutConstraint.activate([
            // First View
            firstCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            firstCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            firstCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                        
            nameTextField.topAnchor.constraint(equalTo: firstCardView.topAnchor, constant: 16),
            nameTextField.leadingAnchor.constraint(equalTo: firstCardView.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: firstCardView.trailingAnchor, constant: -16),
            
            nameValidateButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            nameValidateButton.leadingAnchor.constraint(equalTo: firstCardView.leadingAnchor, constant: 16),
            nameValidateButton.trailingAnchor.constraint(equalTo: firstCardView.trailingAnchor, constant: -16),

            nameValidateLabel.topAnchor.constraint(equalTo: nameValidateButton.bottomAnchor, constant: 16),
            nameValidateLabel.leadingAnchor.constraint(equalTo: firstCardView.leadingAnchor, constant: 16),
            nameValidateLabel.trailingAnchor.constraint(equalTo: firstCardView.trailingAnchor, constant: -16),
            nameValidateLabel.bottomAnchor.constraint(equalTo: firstCardView.bottomAnchor, constant: -16),
            
            // Second View
            secondCardView.topAnchor.constraint(equalTo: firstCardView.bottomAnchor, constant: 24),
            secondCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            secondCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 16),
            emailTextField.leadingAnchor.constraint(equalTo: secondCardView.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: secondCardView.trailingAnchor, constant: -16),
            
            emailValidateButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            emailValidateButton.leadingAnchor.constraint(equalTo: secondCardView.leadingAnchor, constant: 16),
            emailValidateButton.trailingAnchor.constraint(equalTo: secondCardView.trailingAnchor, constant: -16),
            
            emailValidateLabel.topAnchor.constraint(equalTo: emailValidateButton.bottomAnchor, constant: 16),
            emailValidateLabel.leadingAnchor.constraint(equalTo: secondCardView.leadingAnchor, constant: 16),
            emailValidateLabel.trailingAnchor.constraint(equalTo: secondCardView.trailingAnchor, constant: -16),
            emailValidateLabel.bottomAnchor.constraint(equalTo: secondCardView.bottomAnchor, constant: -16)
        ])
    }
    
    @objc
    private func didTapNameValidateButton() {
        let regExString = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: nameTextField.text)

        nameValidateLabel.text = isValid ? "Валидация имени прошла успешно" : "В поле Имя - ошибка"
        nameValidateLabel.textColor = isValid ? successColor : unSuccessColor
    }
    
    @objc
    private func didTapEmailValidateButton() {
        let regExString = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: nameTextField.text)

        emailValidateLabel.text = isValid ? "Валидация Email прошла успешно" : "В поле Email - ошибка"
        emailValidateLabel.textColor = isValid ? successColor : unSuccessColor
    }
    
}
