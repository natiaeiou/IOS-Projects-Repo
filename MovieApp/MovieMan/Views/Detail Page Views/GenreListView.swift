//
//  GenreListComponent.swift
//  MovieMan
//
//  Created by Atinati on 20.10.25.
//
import UIKit

class GenreListView: UIView {
    
    private let genreStackView = UIStackView()
    private let viewModel: DetailViewModel
    
   // MARK: INIT

    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
        configureGenres()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setuo

    private func setupView() {
        genreStackView.axis = .horizontal
        genreStackView.spacing = 8
        genreStackView.alignment = .center
        genreStackView.distribution = .fill
        genreStackView.translatesAutoresizingMaskIntoConstraints = false
        genreStackView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        addSubview(genreStackView)
        
        NSLayoutConstraint.activate([
            genreStackView.topAnchor.constraint(equalTo: topAnchor),
            genreStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            genreStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func configureGenres() {
        viewModel.genres.forEach { genreName in
            let genreView = GenreLabel(title: genreName)
            genreStackView.addArrangedSubview(genreView)
        }
    }
}
