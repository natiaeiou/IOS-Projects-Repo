//
//  MainCoordinator.swift
//  MovieMan
//
//  Created by Atinati on 20.10.25.
//
import UIKit

class AppCoordinator: NSObject, AppFlowCoordinator, DetailNavigation {
    
    // MARK: Properties
 
    let navigationController: UINavigationController
    
    // MARK: Initialization
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: MainFlowCoordinator
    
    func start() {
        let viewController = MainViewController()
        viewController.coordinator = self
        viewController.title = "MovieMan"
        navigationController.navigationBar.prefersLargeTitles = false
        navigationController.viewControllers = [viewController]
    }
    
    func showDetail(for movie: Movie) {
        let viewModel = DetailViewModel(movie: movie)
        let detailVC = DetailViewController(viewModel: viewModel, coordinator: self)
        navigationController.pushViewController(detailVC, animated: true)
    }
    
    func showPoster(for movie: Movie) {
        let posterVC = PosterViewController(movie: movie)
        posterVC.modalPresentationStyle = .fullScreen
        navigationController.present(posterVC, animated: true, completion: nil)
    }
}
