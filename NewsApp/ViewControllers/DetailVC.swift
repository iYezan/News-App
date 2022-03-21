//
//  DetailVC.swift
//  NewsApp
//
//  Created by iYezan on 19/03/2022.
//

import UIKit

class DetailVC: UIViewController {
    
    // MARK: - Declarations
    let titleLabel          = NTitleLabel(textAlignment: .left, fontSize: 20)
    let bodyLabel           = NBodyLabel(textAlignment: .left, fontSize: 16)
    let logoImageView       = NewsImage(frame: .zero)
    
    var article: Article?
    
    // MARK: - Initialisers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor    = .systemBackground
        
        configureLogoImage()
        configureWeatherLabel()
        configureBodyLabel()
        
    }
    // MARK: - Layout configrations
    let imageURL = Date()
    
    func configureLogoImage() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        logoImageView.downloadImage(fromURL: (article?.urlToImage)!)

        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            logoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            logoImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 250),
            logoImageView.widthAnchor.constraint(equalToConstant: 0)
        ])
    }
    
    func configureWeatherLabel() {
        view.addSubview(titleLabel)
        titleLabel.text = article?.title
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
    
    func configureBodyLabel() {
        view.addSubview(bodyLabel)
        bodyLabel.text  = article?.description
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 40),
            bodyLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            bodyLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            bodyLabel.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
