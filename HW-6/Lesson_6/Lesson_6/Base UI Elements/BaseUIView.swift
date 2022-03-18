//
//  BaseUIView.swift
//  Lesson_6
//
//  Created by Михаил Зайцев on 15.03.2022.
//

import UIKit

final class BaseUIView: UIView {
    
    init(backgroundColor: UIColor){
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 12
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
