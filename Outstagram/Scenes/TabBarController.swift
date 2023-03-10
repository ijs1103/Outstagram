//
//  TabBarController.swift
//  Outstagram
//
//  Created by Eunyeong Kim on 2021/08/13.
//

import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let feedViewContoller = UINavigationController(rootViewController: FeedViewController())
        feedViewContoller.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )

        let profileViewContoller = UINavigationController(rootViewController: ProfileViewController())
        profileViewContoller.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )

        viewControllers = [feedViewContoller, profileViewContoller]
    }
}
