//
//  CryptoViewModel.swift
//  CryptoSample
//
//  Created by Can Kanbur on 6.04.2023.
//

import Foundation

struct CryptoListViewModel{
    
    let cryptoCurrencyList : [CryptoCurrency]

}
extension CryptoListViewModel {
    func numberOfRowsInSection () -> Int {
        return cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoVModel{
        let crypto = cryptoCurrencyList[index]
        return CryptoVModel(cryptoCurrency: crypto)
    }
}

struct CryptoVModel{
    let cryptoCurrency : CryptoCurrency
    
 
}

extension CryptoVModel {
    var name : String{
        return cryptoCurrency.currency
    }
    var price : String {
        return cryptoCurrency.price
    }
}
