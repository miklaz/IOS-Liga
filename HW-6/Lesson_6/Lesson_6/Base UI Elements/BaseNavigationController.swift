//
//  BaseNavigationController.swift
//  Lesson_6
//
//  Created by Михаил Зайцев on 10.03.2022.
//

import UIKit

final class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.isTranslucent = false
        additionalSetup()
    }
    
    private func additionalSetup() {

            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.shadowImage = nil
            appearance.shadowColor = .clear
            appearance.titleTextAttributes = [
                .foregroundColor: UIColor.systemCyan
            ]
            appearance.largeTitleTextAttributes = [
                .foregroundColor: UIColor.black
            ]
            
            UINavigationBar.appearance().tintColor = .systemCyan
            
            navigationBar.standardAppearance = appearance
            navigationBar.compactAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
            
    }
}
