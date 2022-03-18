//
//  AutoLayoutVC.swift
//  Lesson_6
//
//  Created by Михаил Зайцев on 10.03.2022.
//

import UIKit

final class AutoLayoutVC: UIViewController {
    private lazy var cardView1 = CardsView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Auto Layout"
        configuration()
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newVC))
        navigationItem.rightBarButtonItem  = barButtonItem
    }
    
    @objc
    private func newVC() {
        let newViewController = ModallyNextVC(typeViewController: .autoLayout)
        newViewController.modalPresentationStyle = .pageSheet
        present(newViewController, animated: true, completion: nil)
    }
}

extension AutoLayoutVC {
    private func configuration() {
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(cardView1)
        cardView1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            cardView1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            cardView1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
        
        cardView1.goToNavigationVC = {
            self.tabBarController?.selectedIndex = 3
        }
        cardView1.goToModallyVC = {
            let newViewController = ModallyVC()
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
    }
    
}
