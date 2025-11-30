//
//  GenreViewForDet.swift
//  MovieMan
//
//  Created by Atinati on 20.10.25.
//
import UIKit

class GenreLabel: UIView {
    
    // MARK: UILabels
    
    private let titleLabel = UILabel()

    // MARK: Initialization
    
    init(title: String) {
        super.init(frame: .zero)
        titleLabel.text = title.uppercased()
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup

    private func setupView() {
        backgroundColor = UIColor(named: "GenreBackgroundColor")
        layer.cornerRadius = 10
        clipsToBounds = true
        
        titleLabel.font = .systemFont(ofSize: 8, weight: .semibold)
        titleLabel.textColor = UIColor(named: "GenreTextColor")
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
}

