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

        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        fetchTopStories()
        createSearchBar()
        setupNavigationController()
    }
    
    private func fetchTopStories () {
        NetworkManager.shared.getTopStories { [weak self] result in
            switch result{
            case .success(let articles):
                self?.articles = articles
           
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
    
    private func setupNavigationController() {
        view.backgroundColor = .systemBackground

        title = "News"
        navigationController?.navigationBar.prefersLargeTitles  = true
        navigationController?.navigationBar.backgroundColor     = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles  = true
        navigationController?.hidesBarsOnSwipe                  = false
        navigationItem.hidesSearchBarWhenScrolling              = false
    }
}
