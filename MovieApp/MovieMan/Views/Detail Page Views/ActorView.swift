//
//  ActorItemView.swift
//  MovieMan
//
//  Created by Atinati on 20.10.25.
//
import UIKit

class ActorView: UIView {
    
    // MARK: UILabels
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: INIT
    
    init(actor: Actor) {
        super.init(frame: .zero)
        setupLayout()
        configure(with: actor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    
    private func setupLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        addSubview(photoImageView)
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: self.topAnchor),
            photoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            photoImageView.widthAnchor.constraint(equalToConstant: 72),
            photoImageView.heightAnchor.constraint(equalToConstant: 72),
            
            nameLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            nameLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor)
        ])
    }
    
    // MARK: Configuration
    
    func configure(with actor: Actor) {
        photoImageView.image = UIImage(named: actor.photoName)
        nameLabel.text = actor.name
    }
}
