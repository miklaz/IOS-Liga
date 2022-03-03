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
    
    private lazy var firstCardView: UIView = creatingCardView()
    private lazy var secondCardView: UIView = creatingCardView()
    private lazy var nameTextField: UITextField = creatingTextField()
    private lazy var emailTextField: UITextField = creatingTextField()
    private lazy var nameValidateButton: UIButton = creatingValidateButton()
    private lazy var emailValidateButton: UIButton = creatingValidateButton()
    private lazy var nameValidateLabel: UILabel = creatingValidateLabel()
    private lazy var emailValidateLabel: UILabel = creatingValidateLabel()
    private lazy var firstViewForTextFieldAndLabel: UIView = creatingGroupView()
    private lazy var secondViewForTextFieldAndLabel: UIView = creatingGroupView()

// MARK: - VС Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configText()
    }
}

// MARK: - Private metods
extension ViewController {
    private func creatingCardView() -> UIView {
        let view = UIView()
        view.backgroundColor = subviewBackgroundColor
        view.layer.cornerRadius = subviewCornerRadius
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }
    
    private func creatingGroupView() -> UIView {
        let view = UIView()
        view.backgroundColor = .secondarySystemFill
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }
    
    private func creatingTextField() -> UITextField {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.shadowRadius = layerShadowRadius
        textField.layer.shadowOpacity = layerShadowOpacity
        textField.layer.shadowOffset = CGSize.zero
        
        return textField
    }
    
    private func creatingValidateButton() -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Валидация...", for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = buttonCornerRadius
        button.addTarget(self, action: #selector(didTapNameValidateButton), for: .touchUpInside)
        
        return button
    }
    
    private func creatingValidateLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private func configText() {
        nameTextField.placeholder = "Введите имя"
        emailTextField.placeholder = "Введите Email"
        nameValidateLabel.text = "Ожидание валидации имени..."
        emailValidateLabel.text = "Ожидание валидации Email..."
        nameValidateButton.setTitle("Валидировать Имя", for: .normal)
        emailValidateButton.setTitle("Валидировать Email", for: .normal)
    }
    
    private func configureView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(firstCardView)
        firstCardView.addSubview(firstViewForTextFieldAndLabel)
        firstViewForTextFieldAndLabel.addSubview(nameTextField)
        firstViewForTextFieldAndLabel.addSubview(nameValidateLabel)
        firstCardView.addSubview(nameValidateButton)
        
        view.addSubview(secondCardView)
        secondCardView.addSubview(secondViewForTextFieldAndLabel)
        secondViewForTextFieldAndLabel.addSubview(emailTextField)
        secondViewForTextFieldAndLabel.addSubview(emailValidateLabel)
        secondCardView.addSubview(emailValidateButton)
        
        NSLayoutConstraint.activate([
            // First View
            firstCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            firstCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            firstCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            firstViewForTextFieldAndLabel.topAnchor.constraint(equalTo: firstCardView.topAnchor, constant: 20),
            firstViewForTextFieldAndLabel.leadingAnchor.constraint(equalTo: firstCardView.leadingAnchor, constant: 8),
            firstViewForTextFieldAndLabel.trailingAnchor.constraint(equalTo: firstCardView.trailingAnchor, constant: -8),

            nameTextField.topAnchor.constraint(equalTo: firstViewForTextFieldAndLabel.topAnchor, constant: 8),
            nameTextField.leadingAnchor.constraint(equalTo: firstViewForTextFieldAndLabel.leadingAnchor, constant: 8),
            nameTextField.trailingAnchor.constraint(equalTo: firstViewForTextFieldAndLabel.trailingAnchor, constant: -8),

            nameValidateLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            nameValidateLabel.leadingAnchor.constraint(equalTo: firstViewForTextFieldAndLabel.leadingAnchor, constant: 8),
            nameValidateLabel.trailingAnchor.constraint(equalTo: firstViewForTextFieldAndLabel.trailingAnchor, constant: -8),
            nameValidateLabel.bottomAnchor.constraint(equalTo: firstViewForTextFieldAndLabel.bottomAnchor, constant: -8),

            nameValidateButton.topAnchor.constraint(equalTo: firstViewForTextFieldAndLabel.bottomAnchor, constant: 16),
            nameValidateButton.leadingAnchor.constraint(equalTo: firstCardView.leadingAnchor, constant: 16),
            nameValidateButton.trailingAnchor.constraint(equalTo: firstCardView.trailingAnchor, constant: -16),
            nameValidateButton.bottomAnchor.constraint(equalTo: firstCardView.bottomAnchor, constant: -16),
            
            // Second View
            secondCardView.topAnchor.constraint(equalTo: firstCardView.bottomAnchor, constant: 24),
            secondCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            secondCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            secondViewForTextFieldAndLabel.topAnchor.constraint(equalTo: secondCardView.topAnchor, constant: 20),
            secondViewForTextFieldAndLabel.leadingAnchor.constraint(equalTo: secondCardView.leadingAnchor, constant: 8),
            secondViewForTextFieldAndLabel.trailingAnchor.constraint(equalTo: secondCardView.trailingAnchor, constant: -8),

            emailTextField.topAnchor.constraint(equalTo: secondViewForTextFieldAndLabel.topAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: secondViewForTextFieldAndLabel.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: secondViewForTextFieldAndLabel.trailingAnchor, constant: -8),

            emailValidateLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            emailValidateLabel.leadingAnchor.constraint(equalTo: secondViewForTextFieldAndLabel.leadingAnchor, constant: 8),
            emailValidateLabel.trailingAnchor.constraint(equalTo: secondViewForTextFieldAndLabel.trailingAnchor, constant: -8),
            emailValidateLabel.bottomAnchor.constraint(equalTo: secondViewForTextFieldAndLabel.bottomAnchor, constant: -8),

            emailValidateButton.topAnchor.constraint(equalTo: secondViewForTextFieldAndLabel.bottomAnchor, constant: 16),
            emailValidateButton.leadingAnchor.constraint(equalTo: secondCardView.leadingAnchor, constant: 16),
            emailValidateButton.trailingAnchor.constraint(equalTo: secondCardView.trailingAnchor, constant: -16),
            emailValidateButton.bottomAnchor.constraint(equalTo: secondCardView.bottomAnchor, constant: -16),
        ])
    }
    
// MARK: - Objc metods
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
