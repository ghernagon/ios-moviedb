//
//  NavigationController.swift
//  movies
//
//  Created by Gerardo Hernández González on 29-04-20.
//  Copyright © 2020 Gerardo Hernández González. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - NavigationBar Appearance
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            
            appearance.configureWithOpaqueBackground()
            
            appearance.backgroundColor = .purple
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            
            navigationItem.standardAppearance = appearance
            navigationItem.scrollEdgeAppearance = appearance
            
            let button = UIBarButtonItemAppearance(style: .plain)
            button.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.buttonAppearance = button
            
            navigationBar.scrollEdgeAppearance = appearance
            navigationBar.standardAppearance = appearance
        } else {
            navigationController?.navigationBar.tintColor = UIColor.purple
        }
            
    }

}
