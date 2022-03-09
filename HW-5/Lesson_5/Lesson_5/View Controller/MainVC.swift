//
//  ViewController.swift
//  Lesson_5
//
//  Created by Михаил Зайцев on 01.03.2022.
//

import UIKit

final class MainVC: UIViewController {
    
    private lazy var nameButton = BaseUIButton(normalTitle: "Перейти к валидации имени (modal)", highlightedTitle: "Переход...")
    private lazy var emailButton = BaseUIButton(normalTitle: "Перейти к валидации Email (push)", highlightedTitle: "Переход...")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }

}

extension MainVC {
    private func configView() {
        //view.backgroundColor = .systemBackground
        nameButton.addTarget(self, action: #selector(openNameCardVC), for: .touchUpInside)
        emailButton.addTarget(self, action: #selector(openEmailCardVC), for: .touchUpInside)
        
        view.addSubview(nameButton)
        view.addSubview(emailButton)
        
        NSLayoutConstraint.activate([
            nameButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -48),
            nameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameButton.heightAnchor.constraint(equalToConstant: 64),
                                                                                             
            emailButton.topAnchor.constraint(equalTo: nameButton.bottomAnchor, constant: 32),
            emailButton.leadingAnchor.constraint(equalTo: nameButton.leadingAnchor),
            emailButton.trailingAnchor.constraint(equalTo: nameButton.trailingAnchor),
            emailButton.heightAnchor.constraint(equalTo: nameButton.heightAnchor)
        ])
    }
    
    @objc
    private func openNameCardVC() {
        let nameCardVC = NameCardVC(NameView())
        navigationController?.present(nameCardVC, animated: true)
    }
    
    @objc
    private func openEmailCardVC() {
        let emailCardVC = EmailCardVC(EmailView())
        navigationController?.pushViewController(emailCardVC, animated: true)
    }
    
}
