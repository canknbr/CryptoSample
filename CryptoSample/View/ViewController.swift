//
//  ViewController.swift
//  CryptoSample
//
//  Created by Can Kanbur on 6.04.2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var colorArray = [UIColor]()
    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    
        getData()
        self.colorArray = [
                   UIColor(red: 75/255, green: 89/255, blue: 170/255, alpha: 1.0),
                   UIColor(red: 15/255, green: 56/255, blue: 170/255, alpha: 1.0),
                   UIColor(red: 104/255, green: 66/255, blue: 170/255, alpha: 1.0),
                   UIColor(red: 108/255, green: 99/255, blue: 170/255, alpha: 1.0),
                   UIColor(red: 115/255, green: 67/255, blue: 170/255, alpha: 1.0),
                   UIColor(red: 114/255, green: 157/255, blue: 170/255, alpha: 1.0),
                   UIColor(red: 154/255, green: 36/255, blue: 170/255, alpha: 1.0)

               ]
    }
    
    func getData(){
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")
        WebService().downloadCurrency(url: url!) { cryptos in
            if let cryptos = cryptos {
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        cell.priceText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
        cell.backgroundColor = self.colorArray[indexPath.row % 6]
        return cell
    }


}

