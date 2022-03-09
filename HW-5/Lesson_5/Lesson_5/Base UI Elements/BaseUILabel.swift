//
//  BaseUILabel.swift
//  Lesson_5
//
//  Created by Михаил Зайцев on 09.03.2022.
//

import UIKit

final class BaseUILabel: UILabel {
    
    init(text: String){
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

