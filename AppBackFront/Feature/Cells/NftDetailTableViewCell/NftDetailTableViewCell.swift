//
//  TableViewCell.swift
//  AppBackFront
//
//  Created by Bruno Abreu on 10/10/23.
//

import UIKit
import AlamofireImage

class NftDetailTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: NftDetailTableViewCell.self)

    private lazy var screen: NftDetailTableViewCellScreen = {
        let view = NftDetailTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addView() {
        contentView.addSubview(screen)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: topAnchor),
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func setupCell(urlImage: String, id: Int, title: String, description: String, delegate: NftDetailTableViewCellScreenDelegate) {
        if let url: URL = URL(string: urlImage) {
            screen.nftImageView.af.setImage(withURL: url)
        }
        screen.delegate(delegate: delegate)
        screen.idLabel.text = "ID: \(id)"
        screen.titleLabel.text = title
        screen.descriptionLabel.text = description
    }
    
    
}
