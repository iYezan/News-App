//
//  FavoriteTableViewCell.swift
//  NewsApp
//
//  Created by iYezan on 15/04/2022.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    // MARK: - Declarations
    let titleLabel            = NTitleLabel(textAlignment: .left, fontSize: 20)
    let bodyLabel             = NBodyLabel(textAlignment: .left, fontSize: 16)
    let avatarImageView       = NewsImage(frame: .zero)
    
    static let identifier   = "NewsTableViewCell"
    
    let mockdata = MockData.mockdata
    let articles = UserDefaults.standard.savedArticles()
    
    let padding: CGFloat          = 10
    
    //Configure each cell with a view Model
    func set(with viewModel: Article){
        //Configure all the data here
        titleLabel.text       = viewModel.title
        bodyLabel.text        = viewModel.descriptionTitle
        avatarImageView.downloadImage(fromURL: (viewModel.urlToImage ?? "placeholder"))
    }

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //Add all the subviews to ContentView
        contentView.addSubview(titleLabel)
        contentView.addSubview(bodyLabel)
        contentView.addSubview(avatarImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatarImage()
        configureWeatherLabel()
        configureBodyLabel()

    }
    
    func avatarImage() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor),
            avatarImageView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant: -40),
            avatarImageView.widthAnchor.constraint(equalToConstant:70),
            avatarImageView.heightAnchor.constraint(equalToConstant:70)
        ])
    }
    
    func configureWeatherLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -150),
            titleLabel.widthAnchor.constraint(equalToConstant: contentView.frame.size.width - 170),
            titleLabel.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func configureBodyLabel() {
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 60),
            bodyLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            bodyLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -150),
            bodyLabel.widthAnchor.constraint(equalToConstant: contentView.frame.size.width - 170),
            bodyLabel.heightAnchor.constraint(equalToConstant: contentView.frame.size.height/2),
        ])
    }
}
