//
//  CustomCell.swift
//  Lesson_7
//
//  Created by Михаил Зайцев on 19.03.2022.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    
// MARK: - Private Const & Var
    private lazy var arrayStars = [UIImageView]()
    
    private lazy var imageCover: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .systemRed
        image.layer.borderColor = UIColor.systemRed.cgColor
        image.layer.borderWidth = 2
        image.layer.cornerRadius = 8
        return image
    }()
    
    lazy private var stackStars: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 3
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var titleSinger = BaseUILabel(text: nil,
                                               fontSize: 15,
                                               fontWeight: .medium,
                                               textColor: .label,
                                               cornerRadius: nil,
                                               numberOfLines: 2)
    
    private lazy var titleRating = BaseUILabel(text: nil,
                                               fontSize: 15,
                                               fontWeight: .bold,
                                               textColor: .systemGray,
                                               cornerRadius: nil,
                                               numberOfLines: 1)
    
    private lazy var plusButton = BaseUIButton(normalTitle: "+",
                                               highlightedTitle: nil,
                                               setNormalTitleColor: .white,
                                               setHighlightedTitleColor: nil,
                                               fontSize: 15,
                                               fontWeight: .bold,
                                               cornerRadius: 6)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        initCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell(model: ModelSong) {
        imageCover.image = model.cover
        titleSinger.text = model.nameSinger
        titleRating.text = "Rateing: \(model.rating)"
    }
    
}

extension CustomTableViewCell {
    private func initCell() {
        for i in 0..<3 {
            let imageView = UIImageView()
            if i == 0 {
                imageView.image = UIImage(systemName: "star.fill")
                imageView.tintColor = .systemRed
            } else {
                imageView.image = UIImage(systemName: "star")
                imageView.tintColor = .systemRed }
            stackStars.addArrangedSubview(imageView)
            arrayStars.append(imageView)
        }
        
        contentView.addSubview(imageCover)
        contentView.addSubview(titleSinger)
        contentView.addSubview(titleRating)
        contentView.addSubview(plusButton)
        contentView.addSubview(stackStars)
        
        NSLayoutConstraint.activate([
            imageCover.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            imageCover.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageCover.widthAnchor.constraint(equalToConstant: 60),
            imageCover.heightAnchor.constraint(equalToConstant: 60),
            imageCover.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -20),
            
            titleSinger.topAnchor.constraint(equalTo: imageCover.topAnchor),
            titleSinger.leadingAnchor.constraint(equalTo: imageCover.leadingAnchor, constant: 100),
            titleSinger.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            plusButton.topAnchor.constraint(equalTo: titleSinger.topAnchor, constant: 50),
            plusButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            plusButton.leadingAnchor.constraint(equalTo: titleSinger.leadingAnchor, constant: 200),
            plusButton.heightAnchor.constraint(equalToConstant: 24),
            
            titleRating.topAnchor.constraint(equalTo: plusButton.topAnchor),
            titleRating.leadingAnchor.constraint(equalTo: titleSinger.leadingAnchor),
            
            stackStars.centerYAnchor.constraint(equalTo: plusButton.centerYAnchor),
            stackStars.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -20),
        ])
    }
    
}
