//
//  DetailsPageViewModel.swift
//  CountriesModuleLibrary
//
//  Created by Atinati on 08.11.25.
//

import Foundation

public class DetailsPageViewModel {
    
    private let country: Country
    
    public init(country: Country) {
        self.country = country
    }
    
    public var name: String {
        country.name.common
    }
    
    public var native: String {
        country.name.nativeName?.values.first?.common ?? "Unknown"
    }
    
    public var spelling: String {
        country.altSpellings.last ?? "Spelling Unknown"
    }
    
    public var capital: String {
        country.capital?.last ?? "Capital Unknown"
    }
    
    public var currencyName: String {
        country.currencies?.values.first?.name ?? "Currency Unknown"
    }
    
    public var currencySymbol: String {
        country.currencies?.values.first?.symbol ?? "Currency Unknown"
    }
    
    public var openStreetMapsURL: String {
        country.maps.openStreetMaps
    }
    
    public var googleMapsURL: String {
        country.maps.googleMaps
    }
    
    public var flagImage: String {
        country.flags.png
    }
    
    public var flagInfo: String {
        country.flags.alt ?? "Flag Unknown"
    }
    
    
    public var links: [CountryLink] {
        [
            CountryLink(title: "OpenStreetMap",
                        urlString: country.maps.openStreetMaps,
                        systemImage: nil,
                        assetImageName: "openStreetMapIcon"),
            
            CountryLink(title: "Google Maps",
                        urlString: country.maps.googleMaps,
                        systemImage: nil,
                        assetImageName: "googleMapIcon")
        ]
    }
}
