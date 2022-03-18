//
//  AfterLargeViewController.swift
//  Lesson_6
//
//  Created by Михаил Зайцев on 17.03.2022.
//

import UIKit

final class AfterLargeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        self.title = "Standard Navigation Bar"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .never
        tabBarController?.tabBar.isHidden = true
    }
}
