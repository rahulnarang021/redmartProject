//
//  NetworkingManager.swift
//  Grid
//
//  Created by Rahul Narang on 28/10/18.
//  Copyright © 2018 Rahul Narang. All rights reserved.
//

import UIKit

enum RequestType: Int {
    case Get
    case Post
    case Put
}

class NetworkingManager: NSObject {
    
    static let sharedInstance: NetworkingManager = NetworkingManager()
    
    private let session: URLSession = URLSession(configuration: URLSessionConfiguration.default)
    
    private override init() {
        super.init()
    }
    
    //MARK: - Public Methood For API Call
    func makeAPICallWithUrl(path: String, requestType: RequestType, completion: @escaping (_ dictResponse: Any?, _ error: Error?) -> ()) {
        if let url = URL(string: ("\(baseUrl)\(path)")) {
            if(requestType == .Get) {
                self.callGetAPI(url: url, completion: completion)
            }
        }
    }
    //creditcardpnb@pnb.co.in
    //MARK: - Make API Call
    private func callGetAPI(url: URL, completion: @escaping (_ dictResponse: Any?, _ error: Error?) -> ()) {
        
        let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            var statusCode: Int = 200// taking it as default
            var json: Any?
            if let httpResponse: HTTPURLResponse = response as? HTTPURLResponse {
                statusCode = httpResponse.statusCode
            }
            if(statusCode >= 200 && statusCode < 400) {
                if let data = data {// serializing json response
                    json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                }
            }
            DispatchQueue.main.async {
                completion(json, error)
            }
        }
        task.resume()
    }
}
