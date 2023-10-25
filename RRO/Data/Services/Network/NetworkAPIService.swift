//
//  DummyAPIService.swift
//  RRO
//
//  Created by Ramona NF on 20/10/23.
//

import Foundation
import Alamofire

/// Singleton that manages the network requests for a REST api
class NetworkAPIService {
    static let shared = NetworkAPIService()
    private let _decoder = JSONDecoder()
    
    /// The constructor sets the date formater to allow dates with fractional seconds
    init() {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-DD'T'HH:mm:ss.SSS'Z'"
        _decoder.dateDecodingStrategy = .formatted(formatter)
    }
    
    /// Get request on a specified url and serialize the response into a given codable struct
    /// - Parameter url: Url where the request will be sent to
    /// - Parameter params: Dictionary for the url parameters (optional)
    /// - Returns: The serialized payload or nil if it fails
    func get<T: Codable>(url: URL, params: Parameters = [:]) async -> T? {
        do {
            return try await withCheckedThrowingContinuation {
                continuation in AF.request(url, method: .get, parameters: params)
                    .responseDecodable(of: T.self, decoder: self._decoder) {
                        response in switch response.result {
                        case .success(let data):
                            continuation.resume(returning: data)
                            
                        case .failure(_):
                            continuation.resume(throwing: NSError())
                            
                        }
                    }
            }
            
        } catch {
            debugPrint("NetworkAPIService Error")
            
        }
        
        return nil
    }
    
    /// Post request on a specified url and serialize the response into a given codable struct
    /// - Parameter url: Url where the request will be sent to
    /// - Parameter body: Dictionary with the data that will be sent in the body
    /// - Returns: The serialized payload or nil if it fails
    func post<T: Codable>(url: URL, body: Parameters) async -> T? {
        do {
            return try await withCheckedThrowingContinuation {
                continuation in AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default)
                    .responseDecodable(of: T.self, decoder: self._decoder) {
                        response in switch response.result {
                        case .success(let data):
                            continuation.resume(returning: data)
                            
                        case .failure(_):
                            continuation.resume(throwing: NSError())
                            
                        }
                    }
            }
            
        } catch {
            debugPrint("NetworkAPIService Error")
            
        }
        
        return nil
    }
}

