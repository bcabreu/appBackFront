//
//  LastestDealTableViewCellViewModel.swift
//  AppBackFront
//
//  Created by Bruno Abreu on 11/10/23.
//

import UIKit

class LastestDealTableViewCellViewModel {

    private var nft: Nft?
    
    public func setNft(To nft: Nft) {
        self.nft = nft
    }

    
    public var title: String {
        return nft?.titleLatestDeals ?? ""
    }
    
    public var numberOfRowsInSection: Int {
        return nft?.latestDeals?.count ?? 0
    }
    
    public var heightForRowAt: CGFloat {
        return 70
    }
}
