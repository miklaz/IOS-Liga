//
//  EmailCardVC.swift
//  Lesson_5
//
//  Created by Михаил Зайцев on 09.03.2022.
//

import UIKit

final class EmailCardVC: UIViewController {
    
    private var emailView: EmailView
    
    init(_ emailView: EmailView) {
        self.emailView = emailView
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = emailView
        view.isOpaque = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailView.configView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.subviews.first?.frame = self.view.frame
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
