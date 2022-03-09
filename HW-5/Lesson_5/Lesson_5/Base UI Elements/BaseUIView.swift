//
//  BaseUIView.swift
//  Lesson_5
//
//  Created by Михаил Зайцев on 09.03.2022.
//

import UIKit

final class BaseUIView: UIView {
    
    init(backgroundColor: UIColor){
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 20
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
