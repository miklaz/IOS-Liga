//
//  CustomTableViewHeader.swift
//  Lesson_7
//
//  Created by Михаил Зайцев on 19.03.2022.
//

import UIKit

final class CustomHeaderView: UITableViewHeaderFooterView {
    
    private var buttonTappedCallback:((_ tag: Int) -> Void)?
    
    private lazy var titleHeader = BaseUILabel(text: nil,
                                               fontSize: 20,
                                               fontWeight: .bold,
                                               textColor: .label,
                                               cornerRadius: nil,
                                               numberOfLines: .zero)
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .contactAdd)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.tintColor = .systemRed
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHeader(title: String, buttonTag: Int, buttonTappedCallback: @escaping ((_ tag: Int) -> Void)) {
        titleHeader.text = title
        button.tag = buttonTag
        self.buttonTappedCallback = buttonTappedCallback
    }
}

extension CustomHeaderView {
    private func configure() {
        addSubview(titleHeader)
        addSubview(button)
        
        NSLayoutConstraint.activate([
            titleHeader.topAnchor.constraint(equalTo: self.topAnchor),
            titleHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleHeader.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            button.topAnchor.constraint(equalTo: titleHeader.topAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            button.bottomAnchor.constraint(equalTo: titleHeader.bottomAnchor)
        ])
    }
    
    @objc
    private func didTapButton(_ sender: UIButton) {
        let item = sender.tag
        buttonTappedCallback?(item)
    }
    
}
