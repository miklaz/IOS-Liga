//
//  ManualVC.swift
//  Lesson_6
//
//  Created by Михаил Зайцев on 10.03.2022.
//

import UIKit

final class ManualVC: UIViewController {
    
    private lazy var cardView = BaseUIView(backgroundColor: .systemBackground)
    
    private lazy var labelCource = BaseUILabel(text: "Курсы по iOS разработке + Сomputer Science + Computer Vision + System Design",
                                               fontSize: 20,
                                               fontWeight: .light,
                                               textColor: .black,
                                               cornerRadius: 0)
    
    private lazy var buttonMore = BaseUIButton(normalTitle: "Подробнее",
                                               highlightedTitle: nil,
                                               setNormalTitleColor: .systemGray,
                                               setHighlightedTitleColor: nil,
                                               fontSize: 15,
                                               fontWeight: .medium,
                                               cornerRadius: 0)
    
    private lazy var priceLabel = BaseUILabel(text: "11 760 ₽",
                                              fontSize: 23,
                                              fontWeight: .bold,
                                              textColor: .black,
                                              cornerRadius: 0)
    
    private lazy var addButton = BaseUIButton(normalTitle: "+",
                                              highlightedTitle: nil,
                                              setNormalTitleColor: .white,
                                              setHighlightedTitleColor: nil,
                                              fontSize: 35,
                                              fontWeight: .light,
                                              cornerRadius: 4)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        self.title = "Manual"
        
        buttonMore.contentHorizontalAlignment = .left
        buttonMore.addTarget(self, action: #selector(toModallyVC), for: .touchUpInside)
        addButton.backgroundColor = UIColor(red: 18/255, green: 139/255, blue: 227/255, alpha: 1)
        addButton.addTarget(self, action: #selector(toNavigationVC), for: .touchUpInside)
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newVC))
        self.navigationItem.rightBarButtonItem  = barButtonItem
    }
    
    @objc
    private func toModallyVC() {
        let newViewController = ModallyVC()
        navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @objc
    private func toNavigationVC() {
        self.tabBarController?.selectedIndex = 3
    }
    
    @objc private func newVC() {
        let newViewController = ModallyNextVC(typeViewController: .manual)
        newViewController.modalPresentationStyle = .pageSheet
        present(newViewController, animated: true, completion: nil)
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        configuration()
    }
}

extension ManualVC{
    private func configuration() {
        view.addSubview(cardView)
        cardView.addSubview(labelCource)
        cardView.addSubview(buttonMore)
        cardView.addSubview(priceLabel)
        cardView.addSubview(addButton)
        
        let viewWidth = UIScreen.main.bounds.width - 40
        cardView.frame = CGRect(x: 20, y: view.safeAreaInsets.top+20, width: viewWidth, height: 200 )
        labelCource.frame = CGRect(x: 20, y: 20, width: cardView.bounds.width - 40, height: 66)
        buttonMore.frame = CGRect(x: 20, y: labelCource.frame.maxY+4, width: 120, height: 30)
        priceLabel.frame = CGRect(x: 20, y: buttonMore.frame.maxY+23, width: 120, height: 28)
        addButton.frame = CGRect(x: cardView.bounds.width-20-82, y: priceLabel.frame.minY, width: 82, height: 41)
    }
}

