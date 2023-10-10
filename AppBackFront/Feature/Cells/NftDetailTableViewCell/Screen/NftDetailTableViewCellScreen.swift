//
//  NftDetailTableViewCellScreen.swift
//  AppBackFront
//
//  Created by Bruno Abreu on 10/10/23.
//

import UIKit

protocol NftDetailTableViewCellScreenDelegate: AnyObject {
    func tappedCloseButton()
    func tappedMagnifyingGlassButton()
}

class NftDetailTableViewCellScreen: UIView {
    
    private weak var delegate: NftDetailTableViewCellScreenDelegate?
    
    public func delegate(delegate: NftDetailTableViewCellScreenDelegate?) {
        self.delegate = delegate
    }
    
    
    lazy var nftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.tintColor = .white
        return imageView
    }()
    
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.tintColor = .white
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedCloseButton() {
        delegate?.tappedCloseButton()
    }
    
    lazy var magnifyingGlassButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.tintColor = .white
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.addTarget(self, action: #selector(tappedMagnifyingGlassButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedMagnifyingGlassButton() {
        delegate?.tappedMagnifyingGlassButton()
    }
    
    lazy var idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints  = false
        label.textColor = UIColor(red: 240/255, green: 156/255, blue: 248/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "id"
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints  = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.numberOfLines = 0
        label.text = "Hello World!"
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints  = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.text = "Hello World description!"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1)
        addView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addView() {
        addSubview(nftImageView)
        addSubview(closeButton)
        addSubview(magnifyingGlassButton)
        addSubview(idLabel)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            nftImageView.topAnchor.constraint(equalTo: topAnchor),
            nftImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            nftImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            nftImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            closeButton.topAnchor.constraint(equalTo: nftImageView.topAnchor, constant: 30),
            closeButton.trailingAnchor.constraint(equalTo: nftImageView.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 35),
            closeButton.widthAnchor.constraint(equalToConstant: 35),
            
            magnifyingGlassButton.bottomAnchor.constraint(equalTo: nftImageView.bottomAnchor, constant: -30),
            magnifyingGlassButton.trailingAnchor.constraint(equalTo: nftImageView.trailingAnchor, constant: -20),
            magnifyingGlassButton.heightAnchor.constraint(equalToConstant: 35),
            magnifyingGlassButton.widthAnchor.constraint(equalToConstant: 35),
            
            idLabel.topAnchor.constraint(equalTo: nftImageView.bottomAnchor, constant: 10),
            idLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            idLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            idLabel.heightAnchor.constraint(equalToConstant: 24),
            
            titleLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: idLabel.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: idLabel.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
//            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 25),
        ])
    }
    
}



