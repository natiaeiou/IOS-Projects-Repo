//
//  PosterViewController.swift
//  MovieMan
//
//  Created by Atinati on 19.10.25.
//
import UIKit

class PosterViewController: UIViewController {
    
    let movie: Movie
    
    // MARK: UI Components
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: Initialization
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
        configure(with: movie)
    }
    
    // MARK: Setup
    
    private func setupUI() {
        view.addSubview(posterImageView)
        
        NSLayoutConstraint.activate([
            posterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            posterImageView.topAnchor.constraint(equalTo: view.topAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func configure(with movie: Movie) {
        posterImageView.image = UIImage(named: movie.posterName)
    }
    
    // MARK: Actions
    
    @objc private func handleTap() {
        self.dismiss(animated: true, completion: nil)
    }
}
