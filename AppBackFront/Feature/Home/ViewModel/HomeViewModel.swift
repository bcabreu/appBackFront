//
//  HomeViewModel.swift
//  AppBackFront
//
//  Created by Bruno Abreu on 06/10/23.
//

import UIKit

protocol HomeViewModelDelegate: AnyObject {
    func success()
    func error()
}

class HomeViewModel {

    private var service: HomeService = HomeService()
    private var nftData: NFTData?
    
    private weak var delegate: HomeViewModelDelegate?
    
    public func delegate(delegate: HomeViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetchRequest(_ typeFetch: TypeFetch) {
        switch typeFetch {
        case .mock:
            service.getHomeFromJson { result, failure in
                if let result {
                    print("Success")
                    self.nftData = result
                    self.delegate?.success()
                } else {
                    print(failure ?? "Error")
                    self.delegate?.error()
                }
            }
        case .request:
            service.getHome { result, failure in
                if let result {
                    self.nftData = result
                    self.delegate?.success()
                } else {
                    self.delegate?.error()
                }
            }
        }

        
    }
}
