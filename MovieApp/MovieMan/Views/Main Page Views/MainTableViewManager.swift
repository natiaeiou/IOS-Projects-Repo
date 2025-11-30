//
//  MainTableViewManager.swift
//  MovieMan
//
//  Created by Atinati on 20.10.25.
//
import UIKit

class MainTableViewManager: NSObject, UITableViewDataSource, UITableViewDelegate,
    NowShowingContainerCellDelegate, PopularMovieCellDelegate {
    
    // MARK: Properties
    
    private let viewModel: ContentViewModel
    weak var coordinator: AppFlowCoordinator?
    
    // MARK: Initialization
    
    init(viewModel: ContentViewModel, coordinator: AppCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init()
    }
    
    // MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return viewModel.popularMovies.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NowShowingContainerCell.reuseIdentifier, for: indexPath) as? NowShowingContainerCell else {
                return UITableViewCell()
            }
            
            let collectionManager = NowShowingCollectionManager(
                viewModel: viewModel,
                delegate: self
            )
            cell.setup(with: collectionManager)
            cell.delegate = self
            
            return cell
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularMovieTableViewCell.reuseIdentifier, for: indexPath) as? PopularMovieTableViewCell else {
                return UITableViewCell()
            }
            
            if let movie = viewModel.getPopularMovie(at: indexPath.row) {
                cell.configure(with: movie, delegate: self)
            }
            return cell
        }
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 330
        } else {
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let headerLabel = UILabel()
            headerLabel.font = UIFont.boldSystemFont(ofSize: 22)
            headerLabel.textColor = .black
            headerLabel.text = "Popular"
            
            let container = UIView()
            container.backgroundColor = .clear
            container.addSubview(headerLabel)
            headerLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                headerLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
                headerLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
                headerLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10)
            ])
            
            return container
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 1 {
            if let movie = viewModel.getPopularMovie(at: indexPath.row) {
                coordinator?.showDetail(for: movie)
            }
        }
    }
    
    // MARK: - NowShowingContainerCellDelegate / PopularMovieCellDelegate
    
    func containerCell(didSelectItemAt index: Int) {
        if let movie = viewModel.getNowShowingMovie(at: index) {
            coordinator?.showDetail(for: movie)
        }
    }
    
    func didTapPosterIcon(for movie: Movie) {
        coordinator?.showPoster(for: movie)
    }
}
