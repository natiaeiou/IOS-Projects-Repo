//
//  DetailViewController.swift
//  MovieMan
//
//  Created by Atinati on 19.10.25.

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: Properties
    
    weak var coordinator: DetailNavigation?
    private let viewModel: DetailViewModel
    private let posterImageView = UIImageView()
    private let contentContainerView = UIView()
    private let mainStackView = UIStackView()
    private lazy var titleComponent = TitleAndRatingView(viewModel: viewModel)
    private lazy var genresComponent = GenreListView(viewModel: viewModel)
    private lazy var infoComponent = DetailInfoView(viewModel: viewModel)
    private lazy var descriptionComponent = DescriptionView(viewModel: viewModel)
    private lazy var castComponent = CastSectionView(viewModel: viewModel)
    
    // MARK: Initialization
    
    init(viewModel: DetailViewModel, coordinator: DetailNavigation) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupLayout()
        configureView()
        setupPosterTapGesture()
    }
    
    // MARK: Layout Setup
    
    private func setupLayout() {
        setupStackView()
        setupPosterAndContainer()
        addArrangedSubviews()
    }
    
    private func setupStackView() {
        mainStackView.axis = .vertical
        mainStackView.spacing = 16
        mainStackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.distribution = .fill
        mainStackView.alignment = .leading
    }
    
    private func setupPosterAndContainer() {
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        contentContainerView.backgroundColor = .systemBackground
        contentContainerView.layer.cornerRadius = 30
        contentContainerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        contentContainerView.clipsToBounds = true
        contentContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(posterImageView)
        view.addSubview(contentContainerView)
        contentContainerView.addSubview(mainStackView)

        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: view.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: 400),
            
            contentContainerView.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: -80),
            contentContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: contentContainerView.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: contentContainerView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentContainerView.trailingAnchor),
            mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentContainerView.bottomAnchor)
        ])
    }
    
    private func addArrangedSubviews() {
        mainStackView.addArrangedSubview(titleComponent)
        mainStackView.addArrangedSubview(genresComponent)
        mainStackView.setCustomSpacing(24, after: genresComponent)
        mainStackView.addArrangedSubview(infoComponent)
        mainStackView.setCustomSpacing(24, after: infoComponent)
        mainStackView.addArrangedSubview(descriptionComponent)
        mainStackView.setCustomSpacing(24, after: descriptionComponent)
        mainStackView.addArrangedSubview(castComponent)
    }
    // MARK: Configuration
    
    private func configureView() {
        posterImageView.image = UIImage(named: viewModel.posterImageName)
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.clipsToBounds = true
    }
    
    // MARK: Actions
    
    private func setupPosterTapGesture() {
        posterImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(posterTapped))
        posterImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func posterTapped() {
        coordinator?.showPoster(for: viewModel.movieObject)
    }
}
