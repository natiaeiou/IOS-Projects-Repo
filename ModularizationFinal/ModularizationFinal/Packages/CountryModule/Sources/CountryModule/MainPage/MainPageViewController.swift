//
//  MainPageViewController.swift
//  CountriesModuleLibrary
//
//  Created by Atinati on 08.11.25.
//

import UIKit
import UiComponents
import TinyConstraints

public class MainPageViewController: UIViewController {
    
    private let viewModel: MainViewModel
    private let titleLabel = UILabel.make(text: "Countries", fontSize: 25, weight: .bold, color: .black)
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.itemSize = CGSize(width: 350, height: 50)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    public init(viewModel: MainViewModel) {
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
        loadData()
    }
    
    private func setupView() {
        view.addSubview(titleLabel)
        view.addSubview(collectionView)
        
        collectionView.register(CountriesCell.self, forCellWithReuseIdentifier: "CountriesCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        titleLabel.top(to: view, offset: 60)
        titleLabel.leading(to: view, offset: 20)
        
        collectionView.topToBottom(of: titleLabel, offset: 10)
        collectionView.bottom(to: view)
        collectionView.leading(to: view)
        collectionView.trailing(to: view)
    }
    
    private func loadData() {
        viewModel.fetchCountries { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

extension MainPageViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.countriesCount
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CountriesCell", for: indexPath) as? CountriesCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: viewModel.country(at: indexPath.row))
        return cell
    }
}

extension MainPageViewController: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let country = viewModel.country(at: indexPath.row)
        let detailsVM = DetailsPageViewModel(country: country)
        let detailsVC = DetailsPageViewController(viewModel: detailsVM)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
