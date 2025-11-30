//
//  CastComponent.swift
//  MovieMan
//
//  Created by Atinati on 20.10.25.
//
import UIKit

class CastSectionView: UIView {
    
    // MARK: Properties
    
    private let castHeaderLabel = UILabel()
    private let castStackView = UIStackView()
    private let viewModel: DetailViewModel

    // MARK: Initialization
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
        configureCast()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setup\Layout
    
    private func setupView() {
        let mainStack = UIStackView(arrangedSubviews: [castHeaderLabel, castStackView])
        mainStack.axis = .vertical
        mainStack.spacing = 16
        mainStack.alignment = .leading
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        castStackView.axis = .horizontal
        castStackView.spacing = 10
        
        addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func configureCast() {
        castHeaderLabel.text = "Cast"
        castHeaderLabel.font = .boldSystemFont(ofSize: 16)
        
        viewModel.castMembers.prefix(4).forEach { actor in
            let actorView = ActorView(actor: actor)
            castStackView.addArrangedSubview(actorView)
        }
    }
}
