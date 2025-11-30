//
//  ComplaintListViewController.swift
//  SawuwunoHub
//
//  Created by Atinati on 15.10.25.
import UIKit
import SwiftUI

class ComplaintListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, AddComplaintDelegate {
    
    private lazy var collectionView: UICollectionView = {
        let layout = self.createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ComplaintCollectionViewCell.self, forCellWithReuseIdentifier: ComplaintCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    var complaints: [Complaint] = [
        Complaint(
            title: "OMG",
            description: "GIT CONFLICTS!!!HELP",
            iconChoice: .redDefault
        ),
        Complaint(
            title: "HELP",
            description: "Deadlines!!!",
            iconChoice: .purple
        ),
        Complaint(
            title: "PLEASE",
            description: "I need sleep",
            iconChoice: .green
        ),
        Complaint(
            title: "I",
            description: "Need mom",
            iconChoice: .yellow
        )]
    
    private let addComplaintButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add new complaint card", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0/255.0, green: 117/255.0, blue: 255/255.0, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 24
        button.layer.masksToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        setupBackground()
        configureCollectionView()
        setupAddComplaintButton()
        addComplaintButton.addTarget(self, action: #selector(navigateUsingNavController), for: .touchUpInside)
    }
    
    private func setupBackground() {
        let backgroundImageView = UIImageView(image: UIImage(named: "background"))
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        view.sendSubviewToBack(backgroundImageView)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(180))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func configureCollectionView() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func setupAddComplaintButton() {
        view.addSubview(addComplaintButton)
        NSLayoutConstraint.activate([
            collectionView.bottomAnchor.constraint(equalTo: addComplaintButton.topAnchor, constant: -20),
            addComplaintButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            addComplaintButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            addComplaintButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            addComplaintButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    @objc private func navigateUsingNavController() {
        let addVC = AddNewCardViewController()
        addVC.delegate = self
        navigationController?.pushViewController(addVC, animated: true)
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return complaints.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ComplaintCollectionViewCell.identifier, for: indexPath) as? ComplaintCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if indexPath.item < complaints.count {
            let complaint = complaints[indexPath.item]
            cell.configure(with: complaint)
        }
        
        return cell
    }
        
    func didAddNewComplaint(_ complaint: Complaint) {
        complaints.append(complaint)
        collectionView.reloadData()
    }
}
#Preview {
    ComplaintListViewController()
}
