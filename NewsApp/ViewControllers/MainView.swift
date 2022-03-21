//
//  MainView.swift
//  NewsApp
//
//  Created by iYezan on 19/03/2022.
//

import UIKit

class MainView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        self.addSubview(someImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let someImageView: UIImageView = {
        let theImageView = UIImageView()
               theImageView.image = UIImage(named: "gh-logo")
        theImageView.frame  = CGRect(x: 50, y: 50, width: 10, height: 10)
        theImageView.layer.cornerRadius = 6
        theImageView.layer.masksToBounds = true
        theImageView.backgroundColor = .red
        theImageView.clipsToBounds = true
        theImageView.contentMode = .scaleAspectFill
        theImageView.translatesAutoresizingMaskIntoConstraints = false //You need to call this property so the image is added to your view
        return theImageView
    }()
}
