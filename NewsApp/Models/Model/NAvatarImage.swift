//
//  GFAvatarImage.swift
//  NewsApp
//
//  Created by iYezan on 21/03/2022.
//

import UIKit

class NAvatarImageView: UIImageView {

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
        layer.cornerRadius = 10
        clipsToBounds = true // sets the image to not have sharp corners in addition to the layer corner radius
//        image = placeHolderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(fromURL url: String) {
        ImageLoader.shared.downloadImage(from: url) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async { self.image = image }
        }
    }
}
