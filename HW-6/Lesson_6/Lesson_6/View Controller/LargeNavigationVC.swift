//
//  LargeNavigationVC.swift
//  Lesson_6
//
//  Created by Михаил Зайцев on 10.03.2022.
//

import UIKit

final class LargeNavigationVC: UIViewController {
    
    lazy private var newVCPress: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  Push me ", for: .normal)
        button.titleLabel!.font = UIFont.systemFont(ofSize: 20)
        button.backgroundColor = .systemOrange
        button.tintColor = .systemBlue
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(toStandart), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configuration()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tabBarController?.tabBar.isHidden = false
    }
}

extension LargeNavigationVC {
    @objc
    private func toStandart(){
        let newViewController = AfterLargeViewController()
        navigationController?.pushViewController(newViewController, animated: true)
    }
    
    private func configuration(){
        view.backgroundColor = .secondarySystemBackground
        self.title = "Large Navigation Bar"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        
        view.addSubview(newVCPress)
        NSLayoutConstraint.activate([
            newVCPress.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newVCPress.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            newVCPress.widthAnchor.constraint(equalToConstant: 110)
        ])
    }
    
}
