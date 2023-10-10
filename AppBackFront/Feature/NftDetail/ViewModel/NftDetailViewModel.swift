//
//  NftDetailViewModel.swift
//  AppBackFront
//
//  Created by Bruno Abreu on 10/10/23.
//

import UIKit

class NftDetailViewModel {

    private let nft: Nft
    
    init(nft: Nft) {
        self.nft = nft
    }
    
    public var numberOfRowsInSection: Int {
        return 1
    }
    
    
    public var nftImage: String {
        return nft.nftImage ?? ""
    }
    
    
    
}
