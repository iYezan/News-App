//
//  UserDefaults.swift
//  NewsApp
//
//  Created by iYezan on 15/04/2022.
//

import Foundation

extension UserDefaults {
    
    static let favoritedArticleKey = "favoritedArticleKey"
    
    func savedArticles() -> [Article] {
        
        // fetch our saved articles first
        guard let savedArticlesData = UserDefaults.standard.data(forKey: UserDefaults.favoritedArticleKey) else { return [] }
        guard let savedArticles = NSKeyedUnarchiver.unarchiveObject(with: savedArticlesData) as? [Article] else { return [] }
        
        return savedArticles
    }
}
