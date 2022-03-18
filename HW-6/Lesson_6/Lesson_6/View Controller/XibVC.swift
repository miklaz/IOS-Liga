//
//  XibVC.swift
//  Lesson_6
//
//  Created by Михаил Зайцев on 10.03.2022.
//

import UIKit

final class XibVC: UIViewController {
    
    @IBOutlet var addButton: [UIButton]!
    @IBOutlet var cards: [UIView]!
    @IBOutlet var textInfo: UILabel!
    @IBOutlet var buttonMore: UIButton!
    @IBOutlet var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in cards {
            i.layer.cornerRadius = 10
        }
        for i in addButton {
            i.layer.cornerRadius = 4
        }
        view.backgroundColor = .secondarySystemBackground
        title = "XIB"
        textInfo.layer.cornerRadius = 13
        textInfo.layer.borderColor = UIColor.systemGray.cgColor
        textInfo.layer.borderWidth = 1
        priceLabel.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newVC))
        navigationItem.rightBarButtonItem  = barButtonItem
    }
    
    @objc
    private func newVC(){
        let newViewController = ModallyNextVC(typeViewController: .xib)
        newViewController.modalPresentationStyle = .fullScreen
        present(newViewController, animated: true, completion: nil)        
        
    }
    
    @IBAction func add2(_ sender: UIButton) {
        tabBarController?.selectedIndex = 3
    }
    
    @IBAction func modeToModally(_ sender: UIButton) {
        let newViewController = ModallyVC()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
}
