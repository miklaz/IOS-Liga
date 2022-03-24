//
//  BaseUILabel.swift
//  Lesson_7
//
//  Created by Михаил Зайцев on 15.03.2022.
//

import UIKit

final class BaseUILabel: UILabel {
    init(text: String?, fontSize: CGFloat, fontWeight: UIFont.Weight, textColor: UIColor?, cornerRadius: CGFloat?, numberOfLines: Int) {
        super.init(frame: .zero)
        
        self.text = text ?? ""
        self.textColor = textColor ?? .black
        font = .systemFont(ofSize: fontSize, weight: fontWeight)
        layer.cornerRadius = cornerRadius ?? 0
        self.numberOfLines = numberOfLines
        textAlignment = .left
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
