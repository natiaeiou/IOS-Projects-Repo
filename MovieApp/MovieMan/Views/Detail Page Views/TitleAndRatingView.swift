//
//  TitleAndRatingComponent.swift
//  MovieMan
//
//  Created by Atinati on 20.10.25.
//
import UIKit

class TitleAndRatingView: UIView {
    
    private let titleLabel = UILabel()
    private let ratingLabel = UILabel()
    private let viewModel: DetailViewModel

    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, ratingLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func configure() {
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.text = viewModel.movieTitle
        titleLabel.numberOfLines = 0

        let iconSize: CGFloat = 12
        let verticalOffset: CGFloat = -2
        let ratedText = viewModel.ratingText.prefixedWithIcon(
            iconName: "StarIcon",
            iconSize: iconSize,
            verticalOffset: verticalOffset
        )
        ratingLabel.attributedText = ratedText
        ratingLabel.font = .systemFont(ofSize: 12)
        ratingLabel.textColor = .lightGray
    }
}
