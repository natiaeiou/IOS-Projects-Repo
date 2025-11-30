//
//  PopularMovieTableViewCell.swift
//  MovieMan
//  Created by Atinati on 19.10.25.
//

import UIKit

protocol PopularMovieCellDelegate: AnyObject {
    func didTapPosterIcon(for movie: Movie)
}

class PopularMovieTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "PopularCell"
    weak var delegate: PopularMovieCellDelegate?
    private var movie: Movie?
    
    // MARK: UI Components
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .gray
        return label
    }()
    
    private let durationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, ratingLabel, genreStackView, durationLabel])
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var genreStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 6
        stack.tintColor = UIColor(named: "GenreColor")
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var posterIconButton: UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 50)
        let image = UIImage(named: "PosterIcon")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlePosterIconTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup Layout
    
    private func setupLayout() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(infoStackView)
        contentView.addSubview(posterIconButton)
        
        NSLayoutConstraint.activate([
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            posterImageView.widthAnchor.constraint(equalToConstant: 85),
            posterImageView.heightAnchor.constraint(equalToConstant: 120),
            posterImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),
            infoStackView.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 15),
            infoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            infoStackView.trailingAnchor.constraint(equalTo: posterIconButton.leadingAnchor, constant: -10),
            infoStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),
            posterIconButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            posterIconButton.widthAnchor.constraint(equalToConstant: 50),
            posterIconButton.heightAnchor.constraint(equalToConstant: 50),
            posterIconButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 120)
        ])
    }
    
    // MARK: Configuration
    
    func configure(with movie: Movie, delegate: PopularMovieCellDelegate) {
        self.movie = movie
        self.delegate = delegate
        posterImageView.image = UIImage(named: movie.posterName)
        titleLabel.text = movie.title
        let ratingText = String(format: "%.1f/10 IMDb", movie.imdbRating)
            ratingLabel.attributedText = ratingText.prefixedWithIcon(
                iconName: "StarIcon",
                iconSize: 12,
                verticalOffset: -2
            )
        let durationText = movie.duration
            durationLabel.attributedText = durationText.prefixedWithIcon(
                iconName: "ClockIcon",
                iconSize: 10,
                verticalOffset: -1
            )
       updateGenres(genres: movie.genres)
    }
    
    private func updateGenres(genres: [String]) {
        genreStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for genre in genres.prefix(3) {
            let label = createGenreLabel(text: genre)
            genreStackView.addArrangedSubview(label)
        }
    }
    private func createGenreLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 8)
        label.textColor = UIColor(named: "GenreTextColor")
        label.backgroundColor = UIColor(named: "GenreBackgroundColor")
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        label.widthAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        return label
    }
    
    // MARK: Actions
    
    @objc private func handlePosterIconTap() {
        guard let movie = movie else { return }
        delegate?.didTapPosterIcon(for: movie)
    }
}
