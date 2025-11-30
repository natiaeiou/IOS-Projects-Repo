//
//  MainViewModel.swift
//  CountriesModuleLibrary
//
//  Created by Atinati on 07.11.25.
//

import Foundation
import Network
@MainActor

public class MainViewModel {
    
    public private(set) var countries: [Country] = []
    
    private let networkManager: NetworkManager
    private let countryURL = "https://restcountries.com/v3.1/region/asia"
    
    public init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    public func fetchCountries(completion: @MainActor @escaping () -> ()) {
        networkManager.getData(url: countryURL) { [weak self] (result: Result<[Country], Error>) in
            switch result {
            case .success(let data):
                self?.countries = data
            case .failure(let error):
                print(error.localizedDescription)
            }
            completion()
        }
    }
    
    public var countriesCount: Int {
        countries.count
    }
    
    public func country(at index: Int) -> Country {
        countries[index]
    }
}
