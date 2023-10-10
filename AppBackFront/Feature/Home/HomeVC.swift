//
//  HomeVC.swift
//  AppBackFront
//
//  Created by Bruno Abreu on 05/10/23.
//

import UIKit

class HomeVC: UIViewController {
    
    private var homeScreen: HomeScreen?
    private var viewModel: HomeViewModel = HomeViewModel()
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchRequest(.request)
        viewModel.delegate(delegate: self)
        

    }
    
}

extension HomeVC: HomeViewModelDelegate {
    func success() {
        print(#function)
        DispatchQueue.main.async {
            self.homeScreen?.configSearchBarDelegate(delegate: self)
            self.homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
            self.homeScreen?.configCollectionViewProtocols(delegate: self, dataSource: self)
            self.homeScreen?.tableView.reloadData()
        }
       
    }
    
    func error() {
        print(#function)
    }
    
}

extension HomeVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterSearchText(searchText)
        homeScreen?.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar)
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NftTableViewCell.identifier, for: indexPath) as? NftTableViewCell
        cell?.setupCell(data: viewModel.loadCurrentNft(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NftFilterCollectionViewCell.identifier, for: indexPath) as? NftFilterCollectionViewCell
        cell?.setupCell(filter: viewModel.loadCurrentFilterNft(indexPath: indexPath))
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.sizeForItem
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.setFilter(indexPath: indexPath, searchText: homeScreen?.searchBar.text ?? "")
        homeScreen?.collectionView.reloadData()
        homeScreen?.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        homeScreen?.tableView.reloadData()
        if viewModel.numberOfRowsInSection > 0 {
            homeScreen?.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
}
