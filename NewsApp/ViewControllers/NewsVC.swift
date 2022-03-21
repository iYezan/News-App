//
//  NewsVC.swift
//  NewsApp
//
//  Created by iYezan on 18/03/2022.
//

import UIKit

class NewsVC: UIViewController {
    
    //Create a tableView
    let tableView: UITableView = {
        let table = UITableView()
        table.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        return table
    }()
    
    let searchVC = UISearchController(searchResultsController: nil)

    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        fetchTopStories()
        createSearchBar()
    }
    
    private func fetchTopStories () {
        NetworkManager.shared.getTopStories { [weak self] result in
            switch result{
            case .success(let articles):
                self?.articles = articles
           
                // Once ViewModels are ready, table view should refresh
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    //MARK: - ViewDidLayoutSubViews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}
