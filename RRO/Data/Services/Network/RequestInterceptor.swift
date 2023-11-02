//
//  SessionAdapted.swift
//  RRO
//
//  Created by peblo on 31/10/23.
//

import Foundation
import Alamofire

final class RequestInterceptor: Alamofire.RequestInterceptor {
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        guard urlRequest.url?.absoluteString.hasPrefix(API.base) == true else {
            return completion(.success(urlRequest))
        }
        var urlRequest = urlRequest
        
        let token = LocalService.shared.getCurrentSession() ?? ""
        
        if token == "" {
            debugPrint("Not authenticated")
        }
        
        urlRequest.setValue("Bearer " + token, forHTTPHeaderField: "Autorization")
        completion(.success(urlRequest))
    }
    
    // TODO: Request retrier
}
