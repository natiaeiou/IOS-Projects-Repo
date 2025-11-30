//
//  MainViewController.swift
//  MovieMan
//
//  Created by Atinati on 19.10.25.
//
import UIKit

class MainViewController: UIViewController {
    
    // MARK: Properties
    
    weak var coordinator: AppCoordinator?
    private let viewModel = ContentViewModel()
    private let tableView = UITableView(frame: .zero, style: .plain)
    private var tableManager: MainTableViewManager?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViewModel()
        setupNavigationBar()
        setupTableView()
    }
    
    // MARK: Setup/Configuration
    
    private func setupViewModel() {
        guard let coordinator = coordinator else { return }
        tableManager = MainTableViewManager(viewModel: viewModel, coordinator: coordinator)
        tableView.reloadData()
    }
    
    private func setupNavigationBar() {
        title = "MovieMan"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
            tableView.dataSource = tableManager
            tableView.delegate = tableManager
            tableView.separatorStyle = .none
            tableView.register(NowShowingContainerCell.self, forCellReuseIdentifier: NowShowingContainerCell.reuseIdentifier)
            tableView.register(PopularMovieTableViewCell.self, forCellReuseIdentifier: PopularMovieTableViewCell.reuseIdentifier)
    }
}
