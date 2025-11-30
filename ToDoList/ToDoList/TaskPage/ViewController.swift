//
//  ViewController.swift
//  ToDoList
//
//  Created by Atinati on 10.10.25.
//
import UIKit

class ViewController: UIViewController {
    
    let button = UIButton()
    let image = UIImage()
    let lable = UILabel()
    
    var tasks: [Task] = [
        Task(name: "Be Successful", isCompleted: true, month:"January", day: 14),
        Task(name: "Be Healthy", isCompleted: false, month: "October", day: 2),
        Task(name: "Be Happy", isCompleted: false, month: "April", day: 6),
        Task(name: "Be Ready", isCompleted: true, month: "July", day: 4),
        Task(name: "Win Marathon", isCompleted: true, month: "December", day: 4),
        Task(name: "Go to Vilnius", isCompleted: true, month: "March", day: 4),
    ]
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: "TaskCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(named: "backgroundColor")
        return tableView
    }()
    

    private var taskLabel: UILabel = {
        var taskLabel = UILabel()
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        taskLabel.text = "You have 2 active tasks"
        taskLabel.textColor = .label
        taskLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        return taskLabel
}()
    
    private let shalvaImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "shalva"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 22
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let progressBar: ProgressBarView = {
          let bar = ProgressBarView()
          bar.translatesAutoresizingMaskIntoConstraints = false
          return bar
      }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "tasks:"
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    
    private let progressTitle: UILabel = {
        let label = UILabel()
        label.text = "Progress"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let taskButton: UIButton = {
        let taskButton = UIButton()
        let backgroundImage = UIImage(named: "gradient")
        taskButton.translatesAutoresizingMaskIntoConstraints = false
        taskButton.setBackgroundImage(backgroundImage, for: .normal)
        taskButton.setTitle("All Completed", for: .normal)
        taskButton.layer.cornerRadius = 8
        return taskButton
}()
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.backgroundColor = UIColor(named: "backgroundColor")
        return stackView
    }()
    
    func sortTasks() {
        tasks.sort { $0.isCompleted && !$1.isCompleted }
    }

    func updateTaskStatistics() {
        let completedCount = tasks.filter { $0.isCompleted }.count
        let totalCount = tasks.count
        let uncompletedCount = totalCount - completedCount
        taskLabel.text = "You have \(uncompletedCount) active tasks"
        progressBar.update(completed: completedCount, total: totalCount)
    }
    
    @objc func completeAllTasks() {
        for i in 0..<tasks.count {
            tasks[i].isCompleted = true
        }
        sortTasks()
        updateTaskStatistics()
        tableView.reloadData()
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "backgroundColor")
        view.addSubview(stackView)
        view.addSubview(tableView)
        view.addSubview(taskButton)
        view.addSubview(shalvaImage)
        view.addSubview(taskLabel)
        view.addSubview(progressTitle)
        view.addSubview(progressBar)
        view.addSubview(headerLabel)
        taskButton.addTarget(self, action: #selector(completeAllTasks), for: .touchUpInside)
        NSLayoutConstraint.activate([
        taskLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
        taskLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        shalvaImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        shalvaImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        taskButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
        taskButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        taskButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        taskButton.heightAnchor.constraint(equalToConstant: 50),
        progressTitle.topAnchor.constraint(equalTo: taskButton.bottomAnchor, constant: 20),
        progressTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        progressTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        progressBar.topAnchor.constraint(equalTo: progressTitle.bottomAnchor, constant: 8),
        progressBar.heightAnchor.constraint(equalToConstant: 120),
        headerLabel.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 20),
        headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        tableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 5),
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}


#Preview {
    ViewController()
}
