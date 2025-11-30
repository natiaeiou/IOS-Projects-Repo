//
//  extensionView.swift
//  ToDoList
//
//  Created by Atinati on 10.10.25.
//

import UIKit

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskTableViewCell else {
            return UITableViewCell()
        }
        
        let task = tasks[indexPath.row]
        let barColor: UIColor
        switch indexPath.row % 3 {
        case 0:
            barColor = UIColor(red: 1.0, green: 0.8, blue: 0.8, alpha: 1.0)
        case 1:
            barColor = UIColor(red: 0.8, green: 0.8, blue: 1.0, alpha: 1.0)
        default:
            barColor = UIColor(red: 0.9, green: 0.7, blue: 1.0, alpha: 1.0)
        }
        
        cell.configure(with: task, color: barColor)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if tasks[indexPath.row].isCompleted == true {
                    tasks[indexPath.row].isCompleted = false
                } else {
                    tasks[indexPath.row].isCompleted = true
                }
        sortTasks()
        updateTaskStatistics()
        tableView.reloadData()
        
}
}
