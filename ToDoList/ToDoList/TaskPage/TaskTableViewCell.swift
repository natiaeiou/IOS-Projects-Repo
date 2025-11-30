//
//  TaskTableViewCell.swift
//  ToDoList
//
//  Created by Atinati on 10.10.25.
//
import UIKit

class TaskTableViewCell: UITableViewCell {
    
    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "cardColor")
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let calendarIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calendar")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .label
        return imageView
    }()
    
    private let colorBarView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let taskTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let taskDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        backgroundColor = .clear 
        selectionStyle = .none 
        
        contentView.addSubview(cardView)
        [colorBarView, taskTitleLabel, taskDateLabel, statusImageView].forEach { cardView.addSubview($0)}
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            colorBarView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            colorBarView.topAnchor.constraint(equalTo: cardView.topAnchor),
            colorBarView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),
            colorBarView.widthAnchor.constraint(equalToConstant: 4),
            taskTitleLabel.leadingAnchor.constraint(equalTo: colorBarView.trailingAnchor, constant: 16),
            taskTitleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 12),
            taskTitleLabel.trailingAnchor.constraint(equalTo: statusImageView.leadingAnchor, constant: -10),
            taskDateLabel.leadingAnchor.constraint(equalTo: colorBarView.trailingAnchor, constant: 16),
            taskDateLabel.topAnchor.constraint(equalTo: taskTitleLabel.bottomAnchor, constant: 4),
            taskDateLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -12),
            statusImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            statusImageView.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            statusImageView.widthAnchor.constraint(equalToConstant: 24),
            statusImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func configure(with task: Task, color: UIColor){
        taskTitleLabel.text = task.name
        colorBarView.backgroundColor = color
        let dayString = "\(task.day) \(task.month)"
        taskDateLabel.text = "🗓️ \(dayString)"
        
        if task.isCompleted {
            statusImageView.image = UIImage(named: "completed")
        } else {
            statusImageView.image = UIImage(named: "notCompleted")
        }
    }
}
