//
//  LocalService.swift
//  RRO
//
//  Created by peblo on 31/10/23.
//

import Foundation

class LocalService {
    static let shared = LocalService()
    
    func getCurrentSession() -> String? {
        return UserDefaults.standard.string(forKey: "userSession")
    }
    
    func setCurrentSession(token: String) {
        UserDefaults.standard.set(token, forKey: "userSession")
    }
    
    func removeCurrentSession() {
        UserDefaults.standard.removeObject(forKey: "userSession")
    }
}

