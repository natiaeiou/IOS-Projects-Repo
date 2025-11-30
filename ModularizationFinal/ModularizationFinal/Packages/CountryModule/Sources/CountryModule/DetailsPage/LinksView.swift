//
//  LinksView.swift
//  CountriesModuleLibrary
//
//  Created by Atinati on 08.11.25.
//

import UIKit
import UiComponents
import TinyConstraints

public class LinksView: UIView {
    
    private let titleLabel = UILabel.make(text: "Useful links:", fontSize: 16, weight: .bold, color: .black)
    
    private let openStreetMapsButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 30
        
        if let customImage = UIImage(named: "openStreetMapIcon") {
            button.setImage(customImage, for: .normal)
        } else {
            let config = UIImage.SymbolConfiguration(pointSize: 35, weight: .medium)
            let image = UIImage(systemName: "map.circle.fill", withConfiguration: config)
            button.setImage(image, for: .normal)
        }
        
        button.tintColor = .systemGreen
        return button
    }()
    
    private let googleMapsButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 30
        
        if let customImage = UIImage(named: "googleMapIcon") {
            button.setImage(customImage, for: .normal)
        } else {
            let config = UIImage.SymbolConfiguration(pointSize: 35, weight: .medium)
            let image = UIImage(systemName: "location.circle.fill", withConfiguration: config)
            button.setImage(image, for: .normal)
        }
        
        button.tintColor = .systemBlue
        return button
    }()
    
    private let openStreetMapsLabel: UILabel = {
        let label = UILabel()
        label.text = "OpenStreetMap"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    private let googleMapsLabel: UILabel = {
        let label = UILabel()
        label.text = "Google Maps"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    private var openStreetMapsURL = ""
    private var googleMapsURL = ""
    
    public init() {
        super.init(frame: .zero)
        setupView()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(titleLabel)
        addSubview(openStreetMapsButton)
        addSubview(googleMapsButton)
        addSubview(openStreetMapsLabel)
        addSubview(googleMapsLabel)
        
        titleLabel.leading(to: self, offset: 20)
        titleLabel.top(to: self, offset: 20)
        
        openStreetMapsButton.topToBottom(of: titleLabel, offset: 20)
        openStreetMapsButton.leading(to: self, offset: 80)
        openStreetMapsButton.size(CGSize(width: 60, height: 60))
        
        openStreetMapsLabel.topToBottom(of: openStreetMapsButton, offset: 8)
        openStreetMapsLabel.centerX(to: openStreetMapsButton)
        openStreetMapsLabel.width(100)
        
        googleMapsButton.top(to: openStreetMapsButton)
        googleMapsButton.leadingToTrailing(of: openStreetMapsButton, offset: 90)
        googleMapsButton.size(CGSize(width: 60, height: 60))
        
        googleMapsLabel.topToBottom(of: googleMapsButton, offset: 8)
        googleMapsLabel.centerX(to: googleMapsButton)
        googleMapsLabel.width(100)
        googleMapsLabel.bottom(to: self, offset: -40)
    }
    
    private func setupActions() {
        openStreetMapsButton.addAction(UIAction { [weak self] _ in
            self?.openURL(self?.openStreetMapsURL ?? "")
        }, for: .touchUpInside)
        
        googleMapsButton.addAction(UIAction { [weak self] _ in
            self?.openURL(self?.googleMapsURL ?? "")
        }, for: .touchUpInside)
    }
    
    private func openURL(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
    }
    
    public func configure(openStreetsMaps: String, googleMaps: String) {
        openStreetMapsURL = openStreetsMaps
        googleMapsURL = googleMaps
    }
}
