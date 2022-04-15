import UIKit
import Foundation

// https://api.blockchain.com/v3/exchange/tickers/BTC-USD

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let crypto = try? newJSONDecoder().decode(Crypto.self, from: jsonData)

//
// To read values from URLs:
//
//   let task = URLSession.shared.cryptoTask(with: url) { crypto, response, error in
//     if let crypto = crypto {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Crypto
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

BlockchainAPI.getBTC { btc, error in
    guard let btc = btc else { return }
    
    let lastTradePrice = btc.lastTradePrice
    let price24H = btc.price24H
    
    let percentChange = (lastTradePrice - price24H) / price24H * 100
}
