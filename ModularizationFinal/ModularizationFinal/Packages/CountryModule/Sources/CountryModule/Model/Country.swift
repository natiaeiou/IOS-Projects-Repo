//
//  Country.swift
//  CountriesModuleLibrary
//
//  Created by Atinati on 07.11.25.
//

import Foundation

public struct Country: Decodable {
    public let name: Name
    public let altSpellings: [String]
    public let capital: [String]?
    public let currencies: [String: Currency]?
    public let maps: Maps
    public let flags: Flags
    
    public struct Name: Decodable {
        public let common: String
        public let official: String
        public let nativeName: [String: NativeName]?
        
        public struct NativeName: Decodable {
            public let official: String
            public let common: String
        }
    }
    
    public struct Currency: Decodable {
        public let name: String
        public let symbol: String
    }
    
    public struct Maps: Decodable {
        public let googleMaps: String
        public let openStreetMaps: String
    }
    
    public struct Flags: Decodable {
        public let png: String
        public let svg: String
        public let alt: String?
    }
}

public struct CountryLink {
    public let title: String
    public let urlString: String
    public let systemImage: String?
    public let assetImageName: String?
}
