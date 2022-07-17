//
//  ListContactServiceMock.swift
//  InterviewTests
//
//  Created by Fernando Marins on 17/07/22.
//  Copyright © 2022 PicPay. All rights reserved.
//

import Foundation
@testable import Interview

class ListContactServiceMock: URLSessionProtocol {
    func fetchData(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let data = mockData!
        let urlResponse = HTTPURLResponse(url: URL(string: "https://run.mocky.io/v3/d26d86ec-fb82-48a7-9c73-69e2cb728070")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        completionHandler(data, urlResponse, nil)
    }
}

class ListContactServiceMockError: URLSessionProtocol {
    func fetchData(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        let urlResponse = HTTPURLResponse(url: URL(string: "https://run.mocky.io/v3/d26d86ec-fb82-48a7-9c73-69e2cb728070")!, statusCode: 500, httpVersion: nil, headerFields: nil)
        let error: APIError = .networkError
        
        completionHandler(nil, urlResponse, error)
    }
}
