//
//  FavoriteTableViewController.swift
//  NewsApp
//
//  Created by iYezan on 15/04/2022.
//

import UIKit

class FavoriteTableViewController: UITableViewController {

    let mockdata = MockData.mockdata
    let articles = UserDefaults.standard.savedArticles()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: FavoriteTableViewCell.identifier)
    }
     
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteTableViewCell.identifier) as! FavoriteTableViewCell
        cell.set(with: articles[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
