//
//  SceneDelegate.swift
//  NewsApp
//
//  Created by iYezan on 18/03/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
  
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
            window = UIWindow(frame: windowScene.coordinateSpace.bounds)
            window?.windowScene = windowScene
            window?.rootViewController  = UINavigationController(rootViewController: createTabbar())
            window?.makeKeyAndVisible()
            configureNavigationBar()
    }
    
    func createSearchNavigationController() -> UINavigationController {
        let searchVC        = NewsVC()
        searchVC.title      = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return  UINavigationController(rootViewController: searchVC)
    }
    
    func createFavoritesNavigationController() -> UINavigationController {
        let favoritesListVC             = FavoriteTableViewController()
        favoritesListVC.title           = "Favorites"
        favoritesListVC.tabBarItem      = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return  UINavigationController(rootViewController: favoritesListVC)
    }

    func createTabbar() -> UITabBarController  {
        let tabbar      = UITabBarController()
        UITabBar.appearance().tintColor = .systemGreen
        tabbar.viewControllers          = [createSearchNavigationController(), createFavoritesNavigationController()]
        
        return  tabbar
    }
    
    func configureNavigationBar() {
        UINavigationBar.appearance().tintColor  = .systemGreen
    }
}

