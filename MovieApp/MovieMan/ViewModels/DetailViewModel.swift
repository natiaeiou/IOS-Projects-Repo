//
//  DetailViewModel.swift
//  MovieMan
//
//  Created by Atinati on 20.10.25.
//
import Foundation
import UIKit

class DetailViewModel {
    
    // MARK: Model Reference
    
    private let movie: Movie
    
    // MARK: Initializer
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    // MARK: Properties
    
    var movieTitle: String {
        return movie.title
    }
    
    var overviewText: String {
        return movie.description
    }
    
    var posterImageName: String {
        return movie.posterName
    }
    
    var genres: [String] {
        return movie.genres
    }
    
    var castMembers: [Actor] {
        return movie.cast
    }
    
    var movieObject: Movie {
            return movie
        }
    
    var metaData: (runtime: String, language: String, certification: String) {
        return (
            runtime: movie.duration,
            language: movie.language,
            certification: movie.rating
        )
    }
    lazy var ratingText: String = {
        return "\(String(format: "%.1f", movie.imdbRating))/10 IMDb"
    }()
    
}
