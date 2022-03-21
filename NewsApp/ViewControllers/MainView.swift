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
        self.addSubview(contentView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let contentView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 200))
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
}
