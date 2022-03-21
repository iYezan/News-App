//
//  NBodyLabel.swift
//  NewsApp
//
//  Created by iYezan on 19/03/2022.
//

import UIKit

class NBodyLabel: UILabel {
    
        override init(frame: CGRect) {
            super.init(frame: frame)
            configure()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
            super.init(frame: .zero)
            self.textAlignment = textAlignment
            self.font = UIFont.systemFont(ofSize: fontSize, weight: .semibold)

            configure()
        }
        
        private func configure() {
            textColor                 = .secondaryLabel
            adjustsFontSizeToFitWidth = true
            minimumScaleFactor        = 0.90
            numberOfLines             = 0
            translatesAutoresizingMaskIntoConstraints = false
        }
    }
