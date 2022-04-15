//
//  MockData.swift
//  NewsApp
//
//  Created by iYezan on 15/04/2022.
//

import UIKit

struct MockData {
    let name: String
    let description: String
    let ImageUrl: UIImage
}

extension MockData {
    static let mockdata = [
        MockData(name: "Item", description: "Nil", ImageUrl: UIImage(named: "placeholder")!)
    ]
}
