//
//  DescriptionComponent.swift
//  MovieMan
//
//  Created by Atinati on 20.10.25.
//
import UIKit

class DescriptionView: UIView {
    
    // MARK: UILabels
    
    private let descriptionHeaderLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let viewModel: DetailViewModel
    
    // MARK: INIT

    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setup
    
    private func setupView() {
        let stackView = UIStackView(arrangedSubviews: [descriptionHeaderLabel, descriptionLabel])
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
        descriptionHeaderLabel.text = "Description"
        descriptionHeaderLabel.font = .boldSystemFont(ofSize: 16)
        descriptionLabel.text = viewModel.overviewText
        descriptionLabel.font = .systemFont(ofSize: 15)
        descriptionLabel.textColor = .lightGray
        descriptionLabel.numberOfLines = 0
    }
}
