//
//  ModallyNewViewController.swift
//  Lesson_6
//
//  Created by Михаил Зайцев on 17.03.2022.
//

import UIKit

enum VC {
    case autoLayout, xib
    case manual
}

final class ModallyNextVC: UIViewController {
    private var typeVC: VC
    
    override func viewDidLoad() {
        self.isModalInPresentation = false
        super.viewDidLoad()
        switch typeVC {
        case .autoLayout:
            view.backgroundColor = .secondarySystemBackground
        case .xib:
            view.backgroundColor = .secondarySystemBackground
            let closeButton: UIButton = UIButton(type: .close)
            closeButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
            view.addSubview(closeButton)
            closeButton.frame = CGRect(x: view.frame.width/2-25, y: view.bounds.height/2-25, width: 50, height: 50)
        case .manual:
            view.alpha = 0.5
            view.backgroundColor = .systemGray
            view.isOpaque = false
        }
    }
    
    @objc private func dismissVC(){
        dismiss(animated: false, completion: nil)
    }
    
    init(typeViewController: VC){
        self.typeVC = typeViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
