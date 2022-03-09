//
//  BaseUIButton.swift
//  Lesson_5
//
//  Created by Михаил Зайцев on 05.03.2022.
//

import UIKit

final class BaseUIButton: UIButton {
    
    init(normalTitle: String, highlightedTitle: String){
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(normalTitle, for: .normal)
        self.setTitle(highlightedTitle, for: .highlighted)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        self.backgroundColor = .systemBlue
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
