//
//  DescriptionView.swift
//  CountriesModuleLibrary
//
//  Created by Atinati on 08.11.25.
//

import UIKit
import UiComponents
import TinyConstraints

public class DescriptionView: UIView {
    
    private let titleLabel = UILabel.make(text: "About the flag:", fontSize: 16, weight: .bold, color: .black)
    
    private let descriptionTextLabel = UILabel.make(fontSize: 14, weight: .regular, color: .black, numberOfLines: 0)
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        return view
    }()
    
    public init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(titleLabel)
        addSubview(descriptionTextLabel)
        addSubview(separatorView)
        
        titleLabel.top(to: self, offset: 20)
        titleLabel.leading(to: self, offset: 20)
        
        descriptionTextLabel.topToBottom(of: titleLabel, offset: 15)
        descriptionTextLabel.leading(to: self, offset: 20)
        descriptionTextLabel.trailing(to: self, offset: -20)
        
        separatorView.topToBottom(of: descriptionTextLabel, offset: 15)
        separatorView.leading(to: self, offset: 20)
        separatorView.trailing(to: self, offset: -20)
        separatorView.height(1)
        separatorView.bottom(to: self, offset: -20)
    }
    
    public func configure(with description: String) {
        descriptionTextLabel.text = description
    }
}
