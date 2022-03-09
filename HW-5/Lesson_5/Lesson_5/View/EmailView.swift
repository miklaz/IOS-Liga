//
//  EmailView.swift
//  Lesson_5
//
//  Created by Михаил Зайцев on 09.03.2022.
//

import UIKit

final class EmailView: UIView {
    private lazy var emailCardView = BaseUIView(backgroundColor: .secondarySystemFill)
    private lazy var emailTextField = BaseUITextField(placeholder: "Введите Email", backgroundColor: .systemBackground)
    private lazy var emailValidateButton = BaseUIButton(normalTitle: "Валидировать Email", highlightedTitle: "Валидация...")
    private lazy var emailValidateLabel = BaseUILabel(text: "Ожидание валидации Email...")
}

extension EmailView {
    func configView() {
        self.backgroundColor = .systemBackground
        emailValidateButton.addTarget(self, action: #selector(didTapEmailValidateButton), for: .touchUpInside)
        
        self.addSubview(emailCardView)
        emailCardView.addSubview(emailTextField)
        emailCardView.addSubview(emailValidateButton)
        emailCardView.addSubview(emailValidateLabel)
        
        NSLayoutConstraint.activate([
            emailCardView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            emailCardView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emailCardView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: emailCardView.topAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -20),
            
            emailValidateButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            emailValidateButton.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 20),
            emailValidateButton.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -20),
            
            emailValidateLabel.topAnchor.constraint(equalTo: emailValidateButton.bottomAnchor, constant: 20),
            emailValidateLabel.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 20),
            emailValidateLabel.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -20),
            emailValidateLabel.bottomAnchor.constraint(equalTo: emailCardView.bottomAnchor, constant: -20),
        ])
    }
    
    @objc
    private func didTapEmailValidateButton() {
        let regExString = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: emailTextField.text)
        
        emailValidateLabel.text = isValid ? "Валидация Email прошла успешно" : "В поле Email - ошибка"
        emailValidateLabel.textColor = isValid ? .systemGreen : .systemRed
    }
    
}


