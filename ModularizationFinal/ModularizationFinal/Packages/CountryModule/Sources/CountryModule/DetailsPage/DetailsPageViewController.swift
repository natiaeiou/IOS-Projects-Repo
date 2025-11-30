//
//  DetailsPageViewController.swift
//  CountriesModuleLibrary
//
//  Created by Atinati on 08.11.25.
//

import UIKit
import TinyConstraints

public class DetailsPageViewController: UIViewController {
    
    private let viewModel: DetailsPageViewModel
    
    private let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    
    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 1
        return stackView
    }()
    
    private let flagView = FlagView()
    private let descriptionView = DescriptionView()
    private let informationView = InformationView()
    private let linksView = LinksView()
    
    public init(viewModel: DetailsPageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        configure()
    }
    
    private func setupView() {
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(containerStackView)
        
        [flagView, descriptionView, informationView, linksView].forEach {
            containerStackView.addArrangedSubview($0)
        }
        
        mainScrollView.edgesToSuperview(usingSafeArea: true)
        
        containerStackView.edges(to: mainScrollView)
        containerStackView.width(to: mainScrollView)
    }
    
    private func configure() {
        flagView.configure(title: viewModel.name, image: viewModel.flagImage)
        descriptionView.configure(with: viewModel.flagInfo)
        informationView.configure(
            native: viewModel.native,
            spelling: viewModel.spelling,
            capital: viewModel.capital,
            currency: "\(viewModel.currencyName), \(viewModel.currencySymbol)"
        )
        linksView.configure(
            openStreetsMaps: viewModel.openStreetMapsURL,
            googleMaps: viewModel.googleMapsURL
        )
    }
}
