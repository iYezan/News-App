//
//  newsImageView.swift
//  NewsApp
//
//  Created by iYezan on 21/03/2022.
//

import UIKit

class NewsImage: UIImageView {
    
    let cache = ImageLoader.shared.cache
//    let placeHolderImage = Images.placeHolder
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
       
        layer.cornerRadius = 6
        layer.masksToBounds = true
        backgroundColor = .secondarySystemBackground
        clipsToBounds = true
        contentMode = .scaleAspectFill
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(fromURL url: String) {
        ImageLoader.shared.downloadImage(from: url) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async { self.image = image }
        }
    }
}
