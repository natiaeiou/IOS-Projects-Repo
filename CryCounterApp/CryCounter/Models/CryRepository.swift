//
//  CryRepository.swift
//  CryCounter
//
//  Created by Atinati on 26.11.25.
//
import SwiftUI

protocol CryRepositoryProtocol {
    func loadCryEntries() -> [CryEntry]
    func saveCryEntries(_ entries: [CryEntry])
}

class CryRepository: CryRepositoryProtocol {
    private let userDefaults = UserDefaults.standard
    private let key = "cryEntries"
    
    func loadCryEntries() -> [CryEntry] {
        guard let data = userDefaults.data(forKey: key),
              let entries = try? JSONDecoder().decode([CryEntry].self, from: data) else {
            return []
        }
        return entries
    }
    
    func saveCryEntries(_ entries: [CryEntry]) {
        if let encoded = try? JSONEncoder().encode(entries) {
            userDefaults.set(encoded, forKey: key)
        }
    }
}
