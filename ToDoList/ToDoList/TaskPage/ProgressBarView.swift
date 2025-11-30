//
//  ProgressBarView.swift
//  ToDoList
//
//  Created by Atinati on 10.10.25.
//
import UIKit

class ProgressBarView: UIView {

    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "cardColor")
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "1 Year tasks"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "3/6 Tasks are completed"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let progressLabel: UILabel = {
        let label = UILabel()
        label.text = "50%"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let progressView: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .default)
        progress.progress = 0.5
        progress.trackTintColor = .systemGray5
        progress.progressTintColor = .systemBlue
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.layer.cornerRadius = 4
        progress.clipsToBounds = true
        return progress
    }()
    

    override init(frame: CGRect){
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder){
        super.init(coder: coder)
        setupView()
    }
    func update(completed: Int, total: Int){
        _ = total - completed
        subtitleLabel.text = "\(completed)/\(total) tasks are completed"
        let progress: Float = total > 0 ? Float(completed) / Float(total) : 0
        progressView.setProgress(progress, animated: true)
        progressLabel.text = "\(Int(progress * 100))%"
    }

    private func setupView(){
        addSubview(containerView)
        [titleLabel, subtitleLabel, progressLabel, progressView].forEach {
            containerView.addSubview($0)
        }

        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            progressLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            progressLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 16),
            progressView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            progressView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            progressView.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 8),
            progressView.heightAnchor.constraint(equalToConstant: 8)
        ])
    }
}

