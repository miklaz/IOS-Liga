//
//  TabBarController.swift
//  Lesson_6
//
//  Created by Михаил Зайцев on 10.03.2022.
//

import UIKit

final class TabBarController: UITabBarController{
// MARK: - VС Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBar()
        configTabBar()
    }
}
// MARK: - Private Metods
extension TabBarController: UITabBarControllerDelegate {
    private func createTabBar() {
        let autoLayoutView = BaseNavigationController(rootViewController: AutoLayoutVC())
        let xibView = BaseNavigationController(rootViewController: XibVC(nibName: "XibView", bundle: nil))
        let manualView = BaseNavigationController(rootViewController: ManualVC())
        let navigationView = BaseNavigationController(rootViewController: NavigationVC())
        let largeNavigationView = BaseNavigationController(rootViewController: LargeNavigationVC())
        
        autoLayoutView.title = "Auto Layout"
        xibView.title = "XIB"
        manualView.title = "Manual"
        navigationView.title = "Navigation"
        largeNavigationView.title = "Large Navigation"
        
        setViewControllers([autoLayoutView, xibView, manualView, navigationView, largeNavigationView], animated: true)
        
        let images = ["rectangle.lefthalf.inset.fill.arrow.left",
                      "ruler",
                      "wrench.and.screwdriver",
                      "arrowshape.bounce.forward",
                      "textformat"]
        let selectedImages = ["rectangle.leftthird.inset.filled",
                              "ruler.fill",
                              "wrench.and.screwdriver.fill",
                              "arrowshape.bounce.forward.fill",
                              "textformat.alt"]
        guard let items = tabBar.items else { return }
        for i in 0..<items.count{
            items[i].image = UIImage(systemName: images[i])
            items[i].selectedImage = UIImage(systemName: selectedImages[i])
        }
    }
    
    private func configTabBar(){
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemCyan.withAlphaComponent(0.2)
        
        tabBar.standardAppearance = appearance
        setTabBarItemColors(appearance.stackedLayoutAppearance)
        setTabBarItemColors(appearance.inlineLayoutAppearance)
        setTabBarItemColors(appearance.compactInlineLayoutAppearance)
        self.tabBar.standardAppearance = appearance
        
        if #available(iOS 15.0, *) {
            self.tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
    }
    
    private func setTabBarItemColors(_ itemAppearance: UITabBarItemAppearance) {
        itemAppearance.normal.iconColor = .label
        itemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.label]
        itemAppearance.selected.iconColor = .systemCyan
        itemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemCyan]
    }
}
