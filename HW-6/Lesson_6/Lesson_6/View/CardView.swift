//
//  CardView.swift
//  Lesson_6
//
//  Created by Михаил Зайцев on 17.03.2022.
//

import UIKit

final class CardsView: UIView {
    
    var goToNavigationVC: (() -> Void)?
    var goToModallyVC: (() -> Void)?
    
    private lazy var textInfo = BaseUILabel(text: "Первые три занятия бесплатно",
                                            fontSize: 15,
                                            fontWeight: .light,
                                            textColor: .systemGray,
                                            cornerRadius: 13)
    
    private lazy var labelCource = BaseUILabel(text: "Backend разработка",
                                               fontSize: 20,
                                               fontWeight: .light,
                                               textColor: .black,
                                               cornerRadius: 0)
    
    private lazy var buttonMore = BaseUIButton(normalTitle: "Подробнее",
                                               highlightedTitle: nil,
                                               setNormalTitleColor: .systemGray,
                                               setHighlightedTitleColor: nil,
                                               fontSize: 15,
                                               fontWeight: .medium,
                                               cornerRadius: 0)
    
    private lazy var priceLabel = BaseUILabel(text: "7 840 ₽",
                                              fontSize: 23,
                                              fontWeight: .bold,
                                              textColor: .black,
                                              cornerRadius: 0)
    
    private lazy var addButton = BaseUIButton(normalTitle: "+",
                                              highlightedTitle: nil,
                                              setNormalTitleColor: .white,
                                              setHighlightedTitleColor: nil,
                                              fontSize: 35,
                                              fontWeight: .light,
                                              cornerRadius: 4)
    
    @objc
    private func toNavigationVC(){
        goToNavigationVC!()
    }
    @objc
    private func toModallyVC(){
        goToModallyVC!()
    }
    
    init(){
        super.init(frame: .zero)
        configuration()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardsView {
    private func configuration(){
        textInfo.layer.borderColor = UIColor.systemGray.cgColor
        textInfo.layer.borderWidth = 1
        textInfo.textAlignment = .center
        buttonMore.contentHorizontalAlignment = .left
        buttonMore.addTarget(self, action: #selector(toModallyVC), for: .touchUpInside)
        addButton.backgroundColor = UIColor(red: 18/255, green: 139/255, blue: 227/255, alpha: 1)
        addButton.addTarget(self, action: #selector(toNavigationVC), for: .touchUpInside)
        
        self.layer.cornerRadius = 12
        self.backgroundColor = .systemBackground
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(textInfo)
        self.addSubview(labelCource)
        self.addSubview(buttonMore)
        self.addSubview(priceLabel)
        self.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            textInfo.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            textInfo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            textInfo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -107),
            textInfo.heightAnchor.constraint(equalToConstant: 28),
            
            labelCource.topAnchor.constraint(equalTo: textInfo.bottomAnchor, constant: 16),
            labelCource.leadingAnchor.constraint(equalTo: textInfo.leadingAnchor),
            labelCource.trailingAnchor.constraint(equalTo: textInfo.trailingAnchor),
            
            buttonMore.topAnchor.constraint(equalTo: labelCource.bottomAnchor, constant: 4),
            buttonMore.leadingAnchor.constraint(equalTo: textInfo.leadingAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: buttonMore.bottomAnchor, constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: textInfo.leadingAnchor),
            
            addButton.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            addButton.leadingAnchor.constraint(greaterThanOrEqualTo: priceLabel.trailingAnchor, constant: 40),
            addButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            addButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            addButton.heightAnchor.constraint(equalToConstant: 41),
            addButton.widthAnchor.constraint(equalToConstant: 82)
        ])
    }
    
}
