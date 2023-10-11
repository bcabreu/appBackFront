//
//  NftDetailVC.swift
//  AppBackFront
//
//  Created by Bruno Abreu on 10/10/23.
//

import UIKit

enum NameCellNftDetail: Int {
    case nftImage = 0
    case description = 1
}

class NftDetailVC: UIViewController {
    
    private var detailScreen: NftDetailScreen?
    private let viewModel: NftDetailViewModel?
    
    override func loadView() {
        detailScreen = NftDetailScreen()
        view = detailScreen
    }
    
    required init(nft: Nft) {
        viewModel = NftDetailViewModel(nft: nft)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailScreen?.configTableViewProtocols(delegate: self, dataSource: self)
        
    }
    



}

extension NftDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch NameCellNftDetail(rawValue: indexPath.row) {
            
        case .nftImage:
            let cell = tableView.dequeueReusableCell(withIdentifier: NftImageTableViewCell.identifier, for: indexPath) as? NftImageTableViewCell
            cell?.setupCell(urlImage: viewModel?.nftImage ?? "", delegate: self)
            return cell ?? UITableViewCell()
            
        case .description:
            let cell = tableView.dequeueReusableCell(withIdentifier: NftDescriptionTableViewCell.identifier, for: indexPath) as? NftDescriptionTableViewCell
            cell?.setupCell(id: viewModel?.nftId ?? 0, title: viewModel?.nftTitle ?? "", description: viewModel?.nftDescription ?? "")
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel?.heightForRowAt(indexPath: indexPath, width: view.frame.width) ?? 0
    }
    
    
}

extension NftDetailVC: NftImageTableViewCellScreenDelegate {
    func tappedCloseButton() {
        dismiss(animated: true)
    }
    
    func tappedMagnifyingGlassButton() {
        print(#function)
    }
    
    
}
