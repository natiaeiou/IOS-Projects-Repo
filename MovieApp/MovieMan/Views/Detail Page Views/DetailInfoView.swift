//
//  DetailInfoComponent.swift
//  MovieMan
//
//  Created by Atinati on 20.10.25.
//
import UIKit

class DetailInfoView: UIView {
    
    private let detailInfoStack = UIStackView()
    private let viewModel: DetailViewModel
    
    // MARK: INIT

    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
        configureInfo()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup/Config

    private func setupView() {
        detailInfoStack.axis = .horizontal
        detailInfoStack.distribution = .fillEqually
        detailInfoStack.spacing = 30
        detailInfoStack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(detailInfoStack)
        
        NSLayoutConstraint.activate([
            detailInfoStack.topAnchor.constraint(equalTo: topAnchor),
            detailInfoStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            detailInfoStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            detailInfoStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func configureInfo() {
        detailInfoStack.addArrangedSubview(DetailItemView(title: viewModel.metaData.runtime, subtitle: "Length"));
        detailInfoStack.addArrangedSubview(DetailItemView(title: viewModel.metaData.language, subtitle: "Language"))
        detailInfoStack.addArrangedSubview(DetailItemView(title: viewModel.metaData.certification, subtitle: "Rating"))
    }
}
