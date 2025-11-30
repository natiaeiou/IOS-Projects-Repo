//
//  AlbumCell.swift
//  MacMiller
//
//  Created by Atinati on 13.10.25.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    var albumImageView = UIImageView()
    var albumNameLabel = UILabel()
    var albumDescriptionLabel = UILabel()
    
  
    override init(style: UITableViewCell.CellStyle,reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 1.0, green: 0.85, blue: 0.9, alpha: 1.0)
        addSubview(albumImageView)
        addSubview(albumNameLabel)
        
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setTitleLabelConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(album: Album) {
        albumImageView.image = album.image
        albumNameLabel.text = album.title
        albumDescriptionLabel.text = album.description
    }
    
    func configureImageView() {
        albumImageView.layer.cornerRadius = 8
        albumImageView.clipsToBounds      = true
    }
    
    func configureTitleLabel() {
        albumNameLabel.numberOfLines = 0
        albumNameLabel.adjustsFontSizeToFitWidth = true
        albumNameLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
    }
    
    func configureDescriptionLabel() {
        albumDescriptionLabel.adjustsFontSizeToFitWidth = true
        albumDescriptionLabel.numberOfLines = 0
        albumNameLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
    }
    

    
    func setImageConstraints() {
        albumImageView.translatesAutoresizingMaskIntoConstraints = false
        albumImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        albumImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        albumImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        albumImageView.widthAnchor.constraint(equalTo: albumImageView.heightAnchor).isActive = true
    }
    
    func setTitleLabelConstraint(){
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        albumNameLabel.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor, constant: 12).isActive = true
        albumNameLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        albumNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setAlbumDescriptionLabelConstraint(){
        albumDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        albumDescriptionLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 4).isActive = true
        albumDescriptionLabel.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor, constant: 12).isActive = true
        albumDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
