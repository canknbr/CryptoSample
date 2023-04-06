//
//  WebService.swift
//  CryptoSample
//
//  Created by Can Kanbur on 6.04.2023.
//

import Foundation

class WebService {
    func downloadCurrency(url:URL,completion:@escaping ([CryptoCurrency]?) -> ()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data{
                
                let cryptoList = try?  JSONDecoder().decode([CryptoCurrency].self, from: data)
                completion(cryptoList)
            }
        }.resume()
        
    }
}
