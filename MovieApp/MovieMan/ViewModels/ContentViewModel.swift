//
//  ContentViewModel.swift
//  MovieMan
//
//  Created by Atinati on 19.10.25.
//
import UIKit

class ContentViewModel {
    
    private(set) var nowShowingMovies: [Movie] = []
    private(set) var popularMovies: [Movie] = []
    
    init() {
        loadMovies()
    }
    
    private func loadMovies() {
        let allMovies = Movie.sampleData
        
        self.nowShowingMovies = allMovies.filter { movie in
            movie.type == .nowShowing || movie.type == .both
        }
        
        self.popularMovies = allMovies.filter { movie in
            movie.type == .popular || movie.type == .both
        }
        
        print("Movies Loaded. Now Showing: \(nowShowingMovies.count), Popular: \(popularMovies.count)")
    }
    
    func getPopularMovie(at index: Int) -> Movie? {
        guard index < popularMovies.count else { return nil }
        return popularMovies[index]
    }
    
    func getNowShowingMovie(at index: Int) -> Movie? {
        guard index < nowShowingMovies.count else { return nil }
        return nowShowingMovies[index]
    }
}
