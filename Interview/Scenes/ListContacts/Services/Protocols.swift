//
//  Protocols.swift
//  Interview
//
//  Created by Fernando Marins on 17/07/22.
//  Copyright © 2022 PicPay. All rights reserved.
//

import Foundation

protocol ListContactServiceProtocol {
    func fetchContacts(completion: @escaping (Result<[Contact], APIError>) -> Void)
}

protocol URLSessionProtocol {
    func fetchData(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: URLSessionProtocol {
    func fetchData(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let dataTask = dataTask(with: url, completionHandler: completionHandler)
        dataTask.resume()
    }
}
