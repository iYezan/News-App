//
//  Search+Ext.swift
//  NewsApp
//
//  Created by iYezan on 19/03/2022.
//

import UIKit

extension NewsVC: UISearchBarDelegate {
    
    func createSearchBar(){
        navigationItem.searchController = searchVC
        searchVC.searchBar.delegate = self
    }
    
    //Search
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, !text.isEmpty else {
            return
        }
        NetworkManager.shared.search(with: text) { [weak self] result in
            switch result{
            case .success(let articles):
                self?.articles = articles
                
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.searchVC.dismiss(animated: true, completion: nil)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
