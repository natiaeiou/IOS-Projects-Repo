//
//  AlbumDetailVC.swift
//  MacMiller
//
//  Created by Atinati on 14.10.25.
//
import UIKit
import SafariServices

class AlbumDetailVC: UIViewController {
    
    var album: Album?
    
    private let imageView = UIImageView()
    private let descriptionLabel = UILabel()
    private let linkButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.97, green: 0.73, blue: 0.82, alpha: 1.0)
        setupUI()
    }
    
    private func setupUI() {
        guard let album = album else { return }
        
        title = album.title
        
        imageView.image = album.image
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        descriptionLabel.text = album.description
        descriptionLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        
        linkButton.setTitle("Open Album", for: .normal)
        linkButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        linkButton.setTitleColor(.black, for: .normal)
        linkButton.addTarget(self, action: #selector(openAlbumLink), for: .touchUpInside)
        
        let stack = UIStackView(arrangedSubviews: [imageView, descriptionLabel, linkButton])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            imageView.heightAnchor.constraint(equalToConstant: 250),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }
    
    @objc private func openAlbumLink() {
        guard let album = album,
              let url = URL(string: album.link) else { return }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
}

