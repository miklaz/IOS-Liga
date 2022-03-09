//
//  BaseUITextField.swift
//  Lesson_5
//
//  Created by Михаил Зайцев on 09.03.2022.
//

import UIKit

final class BaseUITextField: UITextField {
    
    init(placeholder: String, backgroundColor: UIColor){
        super.init(frame: .zero)
        
        self.borderStyle = .roundedRect
        self.backgroundColor = backgroundColor
        self.placeholder = placeholder 
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.8
        self.layer.shadowOffset = CGSize.zero
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
