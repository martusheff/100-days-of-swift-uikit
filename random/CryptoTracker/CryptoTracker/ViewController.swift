//
//  ViewController.swift
//  CryptoTracker
//
//  Created by andronick martusheff on 4/13/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var updatePriceButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var percentChangeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePrice()
        // Do any additional setup after loading the view.
    }

    //  ca87f815-94ac-40d1-a7f4-06edb883ab91
    @IBAction func updatePriceTapped(_ sender: UIButton) {
        updatePrice()
    }
    
    func updatePrice() {
        BlockchainAPI.getBTC { btc, error in
            guard let btc = btc else { return }
            
            var lastTradePrice = btc.lastTradePrice
            let price24H = btc.price24H
           // for testing lastTradePrice = 32421.64
            var percentChange = (lastTradePrice - price24H) / price24H * 100
            let roundedPercent = round(percentChange * 10) / 10
            self.priceLabel.text = "$\(btc.lastTradePrice)"
            self.percentChangeLabel.text = "\(roundedPercent)%"
            
            let red = UIColor(red: 0.92, green: 0.32, blue: 0.44, alpha: 1.00)
            let green = UIColor(red: 0.40, green: 0.72, blue: 0.57, alpha: 1.00)
            
            if lastTradePrice < price24H {
                self.priceLabel.textColor = red
                self.percentChangeLabel.textColor = red
                self.updatePriceButton.backgroundColor = red
            } else {
                self.priceLabel.textColor = green
                self.percentChangeLabel.textColor = green
                self.updatePriceButton.backgroundColor = green
            }
        }
    }
    
}


struct Crypto: Codable {
    let symbol: String
    let price24H, volume24H, lastTradePrice: Double

    enum CodingKeys: String, CodingKey {
        case symbol
        case price24H = "price_24h"
        case volume24H = "volume_24h"
        case lastTradePrice = "last_trade_price"
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func cryptoTask(with url: URL, completionHandler: @escaping (Crypto?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}

class BlockchainAPI {
    private static let defaultSession = URLSession(configuration: .default)
    
    static func getBTC(completion: @escaping (Crypto?, String?) -> Void) {
        guard let url = URL(string: "https://api.blockchain.com/v3/exchange/tickers/BTC-USD") else {
            return
        }
        
        defaultSession.cryptoTask(with: url) { btc, response, error in
            guard let btc = btc, error == nil else {
                print(error as Any)
                return
            }
            DispatchQueue.main.async {
                completion(btc, error?.localizedDescription)
            }
        }.resume()
    }
}

