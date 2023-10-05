//
//  HomeVC.swift
//  AppBackFront
//
//  Created by Bruno Abreu on 05/10/23.
//

import UIKit

class HomeVC: UIViewController {
    
    private var homeScreen: HomeScreen?
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen?.configSearchBarDelegate(delegate: self)
        homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
        homeScreen?.configCollectionViewProtocols(delegate: self, dataSource: self)

    }
    
}

extension HomeVC: UISearchBarDelegate {
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
