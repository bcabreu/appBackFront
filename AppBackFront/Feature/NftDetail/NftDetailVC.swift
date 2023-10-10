//
//  NftDetailVC.swift
//  AppBackFront
//
//  Created by Bruno Abreu on 10/10/23.
//

import UIKit

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
        let cell = tableView.dequeueReusableCell(withIdentifier: NftDetailTableViewCell.identifier, for: indexPath) as? NftDetailTableViewCell
        cell?.setupCell(urlImage: viewModel?.nftImage ?? "", id: viewModel?.nftId ?? 0, title: viewModel?.nftTitle ?? "", description: viewModel?.nftDescription ?? "", delegate: self)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    
}

extension NftDetailVC: NftDetailTableViewCellScreenDelegate {
    func tappedCloseButton() {
        dismiss(animated: true)
    }
    
    func tappedMagnifyingGlassButton() {
        print(#function)
    }
    
    
}
