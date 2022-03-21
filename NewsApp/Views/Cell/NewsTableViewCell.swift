//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by iYezan on 18/03/2022.
//

import UIKit

//struct NewsTableViewCellViewModel {
//    let title: String
//    let subtitle: String
//    let imageURL: URL?
//    var imageData: Data?
//}

class NewsTableViewCell: UITableViewCell {

    static let identifier   = "NewsTableViewCell"
    let logoImageView       = NAvatarImageView(frame: .zero)
    
 
    
    
    //Configure each cell with a view Model
    func configure(with viewModel: Article){
        //Configure all the data here
        newsTitleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.description
        logoImageView.downloadImage(fromURL: (viewModel.urlToImage)!)
    }
    
    // NewsTitle
    private let newsTitleLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    // News Subtitle
    private let subtitleLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //Add all the subviews to ContentView
        contentView.addSubview(newsTitleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(logoImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        newsTitleLabel.frame = CGRect(
            x: 10,
            y: 0,
            width: contentView.frame.size.width - 170,
            height: 70)
        subtitleLabel.frame = CGRect(
            x: 10,
            y: 70,
            width: contentView.frame.size.width - 170,
            height: contentView.frame.size.height/2)
        logoImageView.frame = CGRect(
            x: contentView.frame.size.width - 150,
            y: 5,
            width: 140,
            height: contentView.frame.size.height - 10)
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        newsTitleLabel.text = nil
//        subtitleLabel.text = nil
//        logoImageView.image = nil
//    }

}
