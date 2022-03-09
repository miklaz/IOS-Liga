//
//  NameView.swift
//  Lesson_5
//
//  Created by Михаил Зайцев on 09.03.2022.
//

import UIKit

final class NameView: UIView  {
    private lazy var nameCardView = BaseUIView(backgroundColor: .secondarySystemFill)
    private lazy var nameTextField = BaseUITextField(placeholder: "Введите имя", backgroundColor: .systemBackground)
    private lazy var nameValidateButton = BaseUIButton(normalTitle: "Валидировать Имя", highlightedTitle: "Валидация...")
    private lazy var nameValidateLabel = BaseUILabel(text: "Ожидание валидации имени...")
}

extension NameView {
    func configView() {
        self.backgroundColor = .systemBackground
        nameValidateButton.addTarget(self, action: #selector(didTapNameValidateButton), for: .touchUpInside)
        
        self.addSubview(nameCardView)
        nameCardView.addSubview(nameTextField)
        nameCardView.addSubview(nameValidateButton)
        nameCardView.addSubview(nameValidateLabel)
        
        NSLayoutConstraint.activate([
            nameCardView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameCardView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nameCardView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            nameTextField.topAnchor.constraint(equalTo: nameCardView.topAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: nameCardView.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: nameCardView.trailingAnchor, constant: -20),
            
            nameValidateButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            nameValidateButton.leadingAnchor.constraint(equalTo: nameCardView.leadingAnchor, constant: 20),
            nameValidateButton.trailingAnchor.constraint(equalTo: nameCardView.trailingAnchor, constant: -20),
            
            nameValidateLabel.topAnchor.constraint(equalTo: nameValidateButton.bottomAnchor, constant: 20),
            nameValidateLabel.leadingAnchor.constraint(equalTo: nameCardView.leadingAnchor, constant: 20),
            nameValidateLabel.trailingAnchor.constraint(equalTo: nameCardView.trailingAnchor, constant: -20),
            nameValidateLabel.bottomAnchor.constraint(equalTo: nameCardView.bottomAnchor, constant: -20),
        ])
    }
    
    @objc
    private func didTapNameValidateButton() {
        let regExString = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: nameTextField.text)
        
        nameValidateLabel.text = isValid ? "Валидация имени прошла успешно" : "В поле Имя - ошибка"
        nameValidateLabel.textColor = isValid ? .systemGreen : .systemRed
    }
}
