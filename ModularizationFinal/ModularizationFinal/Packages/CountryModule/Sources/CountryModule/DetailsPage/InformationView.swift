//
//  InformationView.swift
//  CountriesModuleLibrary
//
//  Created by Atinati on 08.11.25.
//

import UIKit
import UiComponents
import TinyConstraints

public class InformationView: UIView {
    
    private let headerLabel = UILabel.make(text: "Basic Information:", fontSize: 16, weight: .bold, color: .black)
    private let nativeNameTitleLabel = UILabel.make(text: "Native name:", fontSize: 14, weight: .light, color: .black)
    private let nativeNameValueLabel = UILabel.make(fontSize: 14, weight: .light, color: .black)
    private let spellingTitleLabel = UILabel.make(text: "Spelling:", fontSize: 14, weight: .light, color: .black)
    private let spellingValueLabel = UILabel.make(fontSize: 14, weight: .light, color: .black)
    private let capitalTitleLabel = UILabel.make(text: "Capital:", fontSize: 14, weight: .light, color: .black)
    private let capitalValueLabel = UILabel.make(fontSize: 14, weight: .light, color: .black)
    private let currencyTitleLabel = UILabel.make(text: "Currency:", fontSize: 14, weight: .light, color: .black)
    private let currencyValueLabel = UILabel.make(fontSize: 14, weight: .light, color: .black)
    
    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
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
        addSubview(containerStackView)
        
        let nameRow = createRow(label: nativeNameTitleLabel, value: nativeNameValueLabel)
        let spellingRow = createRow(label: spellingTitleLabel, value: spellingValueLabel)
        let capitalRow = createRow(label: capitalTitleLabel, value: capitalValueLabel)
        let currencyRow = createRow(label: currencyTitleLabel, value: currencyValueLabel)
        
        containerStackView.addArrangedSubview(headerLabel)
        containerStackView.addArrangedSubview(nameRow)
        containerStackView.addArrangedSubview(spellingRow)
        containerStackView.addArrangedSubview(capitalRow)
        containerStackView.addArrangedSubview(currencyRow)
        containerStackView.addArrangedSubview(separatorView)
        
        containerStackView.edges(to: self, insets: .left(20) + .right(20))
        separatorView.height(1)
    }
    
    private func createRow(label: UILabel, value: UILabel) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [label, value])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }
    
    public func configure(native: String, spelling: String, capital: String, currency: String) {
        nativeNameValueLabel.text = native
        spellingValueLabel.text = spelling
        capitalValueLabel.text = capital
        currencyValueLabel.text = currency
    }
}
