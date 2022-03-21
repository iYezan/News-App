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
    let bodyLabel           = NBodyLabel(textAlignment: .left, fontSize: 18)
    let contentView         = MainView()
    let logoImageView       = UIImageView()
    
    var article: Article?
    
    static let identifier = "DetailVC"
    // MARK: - Initialisers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor    = .systemBackground
        setupContentViewConstraints()
        configureLogoImage()
        configureWeatherLabel()
        configureBodyLabel()
        
    }
    // MARK: - Layout configrations
    
    func configureWeatherLabel() {

        view.addSubview(titleLabel)
        titleLabel.text = article?.title
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 150),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),            
        ])
    }
    
        func configureBodyLabel() {
            view.addSubview(bodyLabel)
            bodyLabel.text  = article?.description
            bodyLabel.translatesAutoresizingMaskIntoConstraints = false
    
            NSLayoutConstraint.activate([
                
                bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
                bodyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                bodyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
                bodyLabel.heightAnchor.constraint(equalToConstant: 250)
            ])
        }
    
    fileprivate func setupContentViewConstraints() {
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        contentView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
        contentView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
        contentView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
        contentView.bottomAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0)
        ])
    }
    
    func configureLogoImage() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.backgroundColor   = .systemBackground
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 50),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
