//
//  CustomHeader.swift
//  Lesson_8
//
//  Created by Михаил Зайцев on 30.03.2022.
//

import UIKit

final class TableViewHeader: UITableViewHeaderFooterView {
    
    lazy var buttonAddItem: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var labelForSection: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupHeaderView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TableViewHeader {
    private func setupHeaderView() {
        addSubview(labelForSection)
        addSubview(buttonAddItem)
                
        NSLayoutConstraint.activate([
            labelForSection.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            labelForSection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            labelForSection.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -12),
            
            buttonAddItem.topAnchor.constraint(equalTo: labelForSection.topAnchor),
            buttonAddItem.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            buttonAddItem.bottomAnchor.constraint(equalTo: labelForSection.bottomAnchor)
        ])
    }
    
}
