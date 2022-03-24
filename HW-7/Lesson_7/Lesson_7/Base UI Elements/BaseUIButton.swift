//
//  BaseUIButton.swift
//  Lesson_7
//
//  Created by Михаил Зайцев on 15.03.2022.
//

import UIKit

final class BaseUIButton: UIButton {
    init(normalTitle: String, highlightedTitle: String?, setNormalTitleColor: UIColor, setHighlightedTitleColor: UIColor?, fontSize: CGFloat, fontWeight: UIFont.Weight, cornerRadius: CGFloat?) {
        super.init(frame: .zero)
        
        self.setTitle(normalTitle, for: .normal)
        self.setTitle(highlightedTitle ?? normalTitle, for: .highlighted)
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        self.backgroundColor = .systemRed
        self.setTitleColor(setNormalTitleColor, for: .normal)
        self.setTitleColor(setHighlightedTitleColor ?? setNormalTitleColor, for: .highlighted)
        self.layer.cornerRadius = cornerRadius ?? 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
