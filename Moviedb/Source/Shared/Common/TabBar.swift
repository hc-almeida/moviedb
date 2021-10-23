//
//  TabBar.swift
//  Moviedb
//
//  Created by Hellen on 22/10/21.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBar = UITabBar.appearance()
        tabBar.tintColor = .white
        tabBar.barTintColor = .black
        tabBar.isTranslucent = false
        viewControllers = [movieListNavigationController(),
                           favoritesNavigationController()]
    }
    
    func movieListNavigationController() -> UINavigationController {
        let character = MovieListBuilder.build()
        character.title = "Filmes"
        character.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        
        let navigation = UINavigationController(rootViewController: character)
        setupAppearanceNavigationBar(navigation: navigation)
        
        return navigation
    }
    
    func favoritesNavigationController() -> UINavigationController {
        let favoriteVC = FavoriteMovieViewController()
        favoriteVC.title = "Favoritos"
        favoriteVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoriteVC)
    }
        
    private func setupAppearanceNavigationBar(navigation: UINavigationController) {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigation.navigationBar.tintColor = .white
        navigation.navigationBar.standardAppearance = appearance
        navigation.navigationBar.compactAppearance = appearance
        navigation.navigationBar.scrollEdgeAppearance = appearance
    }
}
