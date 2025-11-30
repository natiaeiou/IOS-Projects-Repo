//
//  FlagView.swift
//  CountriesModuleLibrary
//
//  Created by Atinati on 08.11.25.
//

import UIKit
import UiComponents
import TinyConstraints

public class FlagView: UIView {
    
    private let countryName = UILabel.make(fontSize: 17, weight: .bold, color: .black)
    
    private let flagContainerView: UIView = {
        let view = UIView()
        view.layer.shadowOpacity = 0.5
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowRadius = 2
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        return view
    }()
    
    private let flagImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    public init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(countryName)
        addSubview(flagContainerView)
        flagContainerView.addSubview(flagImage)
        
        countryName.top(to: self)
        countryName.centerX(to: self)
        
        flagContainerView.centerX(to: self)
        flagContainerView.topToBottom(of: countryName, offset: 30)
        flagContainerView.size(CGSize(width: 343, height: 228))
        flagContainerView.bottom(to: self, offset: -16)
        
        flagImage.edges(to: flagContainerView)
    }
    
    public func configure(title: String, image: String) {
        countryName.text = title
        if let url = URL(string: image) {
            flagImage.load(url: url)
        }
    }
}
