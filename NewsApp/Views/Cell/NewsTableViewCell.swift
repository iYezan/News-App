//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by iYezan on 18/03/2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    // MARK: - Declarations
    let titleLabel            = NTitleLabel(textAlignment: .left, fontSize: 20)
    let bodyLabel             = NBodyLabel(textAlignment: .left, fontSize: 16)
    let avatarImageView       = NewsImage(frame: .zero)
    
    static let identifier   = "NewsTableViewCell"
    
    let padding: CGFloat          = 10
    
    //Configure each cell with a view Model
    func configure(with viewModel: Article){
        //Configure all the data here
        titleLabel.text = viewModel.title
        bodyLabel.text = viewModel.description
 
        avatarImageView.downloadImage(fromURL: (viewModel.urlToImage ?? "gh-logo"))
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
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            avatarImageView.widthAnchor.constraint(equalToConstant: 140),
            avatarImageView.heightAnchor.constraint(equalToConstant: contentView.frame.size.height - 20),
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
