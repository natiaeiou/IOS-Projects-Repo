//
//  CountriesCell.swift
//  CountriesModuleLibrary
//
//  Created by Atinati on 08.11.25.
//

import UIKit
import UiComponents
import TinyConstraints

public class CountriesCell: UICollectionViewCell {
    
    private let flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let countryNameLabel = UILabel.make(fontSize: 15, weight: .light, color: .black)
    
    private let chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .systemGray
        return imageView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(flagImageView)
        contentView.addSubview(countryNameLabel)
        contentView.addSubview(chevronImageView)
        contentView.layer.cornerRadius = 25
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.darkGray.cgColor
        
        flagImageView.leading(to: contentView, offset: 25)
        flagImageView.top(to: contentView, offset: 16)
        flagImageView.bottom(to: contentView, offset: -16)
        flagImageView.size(CGSize(width: 30, height: 30))
        
        chevronImageView.trailing(to: contentView, offset: -12)
        chevronImageView.width(12)
        chevronImageView.centerY(to: countryNameLabel)
        
        countryNameLabel.centerY(to: flagImageView)
        countryNameLabel.trailing(to: chevronImageView, offset: -15)
    }
    
    public func configure(with country: Country) {
        if let url = URL(string: country.flags.png) {
            flagImageView.load(url: url)
        }
        countryNameLabel.text = country.name.common
    }
}
