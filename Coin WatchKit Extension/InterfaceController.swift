//
//  InterfaceController.swift
//  Coin WatchKit Extension
//
//  Created by Dhruvil Patel on 7/9/18.
//  Copyright © 2018 Dhruvil. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var table: WKInterfaceTable!
    
    
    @IBAction func refreshBtn() {
        
        getPrice()
        
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        getPrice()
    }
    
    func getPrice() {
        
        let url = URL(string: "https://api.coinmarketcap.com/v2/ticker/")!
        
        URLSession.shared.dataTask(with: url) { (data:Data?, response:URLResponse?, error:Error?) in
            if error == nil {
                print("It worked")
                
                if data != nil {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                        self.table.setNumberOfRows(7, withRowType: "coinValueRow")
                        
                     if let data = json["data"] as? [String: Any],
                        let number = data["1"] as? [String: Any],
                        let quotes = number["quotes"] as? [String: Any],
                        let usd = quotes["USD"] as? [String: Any],
                        let price = usd["price"] as? NSNumber {
                            let a = self.table.rowController(at: 0) as? CoinValueRowController
                            a?.coinValueLbl.setText("\(price)")
                        }
                        
                        if let data = json["data"] as? [String: Any],
                            let number = data["1831"] as? [String: Any],
                            let quotes = number["quotes"] as? [String: Any],
                            let usd = quotes["USD"] as? [String: Any],
                            let price = usd["price"] as? NSNumber {
                            let a = self.table.rowController(at: 1) as? CoinValueRowController
                            a?.coinNameLbl.setText("Bit Cash")
                            a?.coinValueLbl.setText("\(price)")
                        }
                        
                        if let data = json["data"] as? [String: Any],
                            let number = data["1027"] as? [String: Any],
                            let quotes = number["quotes"] as? [String: Any],
                            let usd = quotes["USD"] as? [String: Any],
                            let price = usd["price"] as? NSNumber {
                            let a = self.table.rowController(at: 2) as? CoinValueRowController
                            a?.coinNameLbl.setText("Ethereum")
                            a?.coinValueLbl.setText("\(price)")
                        }
                        
                        if let data = json["data"] as? [String: Any],
                            let number = data["2"] as? [String: Any],
                            let quotes = number["quotes"] as? [String: Any],
                            let usd = quotes["USD"] as? [String: Any],
                            let price = usd["price"] as? NSNumber {
                            let a = self.table.rowController(at: 3) as? CoinValueRowController
                            a?.coinNameLbl.setText("LiteCoin")
                            a?.coinValueLbl.setText("\(price)")
                        }
                        
                        if let data = json["data"] as? [String: Any],
                            let number = data["52"] as? [String: Any],
                            let quotes = number["quotes"] as? [String: Any],
                            let usd = quotes["USD"] as? [String: Any],
                            let price = usd["price"] as? NSNumber {
                            let a = self.table.rowController(at: 4) as? CoinValueRowController
                            a?.coinNameLbl.setText("Ripple")
                            a?.coinValueLbl.setText("\(price)")
                        }
                        
                        if let data = json["data"] as? [String: Any],
                            let number = data["1765"] as? [String: Any],
                            let quotes = number["quotes"] as? [String: Any],
                            let usd = quotes["USD"] as? [String: Any],
                            let price = usd["price"] as? NSNumber {
                            let a = self.table.rowController(at: 5) as? CoinValueRowController
                            a?.coinNameLbl.setText("EOS")
                            a?.coinValueLbl.setText("\(price)")
                        }
                        
                        if let data = json["data"] as? [String: Any],
                            let number = data["512"] as? [String: Any],
                            let quotes = number["quotes"] as? [String: Any],
                            let usd = quotes["USD"] as? [String: Any],
                            let price = usd["price"] as? NSNumber {
                            let a = self.table.rowController(at: 6) as? CoinValueRowController
                            a?.coinNameLbl.setText("Stellar")
                            a?.coinValueLbl.setText("\(price)")
                        }
                    } catch {}
                }
            } else {
               print("Error is not equal to nil")
            }
        }.resume()
    }
}
