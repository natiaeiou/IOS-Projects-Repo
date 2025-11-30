//
//  TimerViewModel.swift
//  Timer
//
//  Created by Atinati on 23.11.25.
//

import Combine
import SwiftUI
import AVFoundation

class TimerViewModel: ObservableObject {
    
    @Published var timers: [TimerItem] = [
        TimerItem(
            title: "ვარჯიში",
            totalSeconds: 2700,
            remainingSeconds: 2700,
            history: []
        ),
        TimerItem(
            title: "მედიტაცია",
            totalSeconds: 930,
            remainingSeconds: 930,
            history: []
        )
    ]
    
    private var timer: Timer?
    
    init() {
        startTimer()
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.updateTimers()
        }
    }
    
    deinit {
        timer?.invalidate()
    }
    
    private func stopTimer(at index: Int) {
          saveHistory(at: index)
          timers[index].isRunning = false
          timers[index].isPaused = false
      }
    
    private func updateTimers() {
        for index in timers.indices where timers[index].isRunning {
            guard timers[index].remainingSeconds > 0 else {
                stopTimer(at: index)
                playNotification()
                continue
            }
            timers[index].remainingSeconds -= 1
            if timers[index].remainingSeconds == 0 {
                stopTimer(at: index)
                playNotification()
            }
        }
    }
    
    func toggleTimer(id: UUID) {
            guard let index = timers.firstIndex(where: { timer in timer.id == id }),
                  timers[index].remainingSeconds > 0 else { return }
            
            if timers[index].isRunning {
                saveHistory(at: index)
            }
            timers[index].isRunning.toggle()
            timers[index].isPaused = !timers[index].isRunning
        }
        
    
    func resetTimer(id: UUID) {
        guard let index = timers.firstIndex(where: { timer in timer.id == id }) else { return }
        
        timers[index].remainingSeconds = timers[index].totalSeconds
        timers[index].isRunning = false
        timers[index].isPaused = false
    }
    
    func deleteTimer(id: UUID) {
        timers.removeAll { timer in timer.id == id }
        deleteNotification()
    }
    
    func addNewTimer(title: String, hours: String, minutes: String, seconds: String) {
        let hoursConverted = (Int(hours) ?? 0) * 3600
        let minutesConverted = (Int(minutes) ?? 0) * 60
        let secondsConverted = Int(seconds) ?? 0
        
        let totalSeconds = hoursConverted + minutesConverted + secondsConverted
        
        guard totalSeconds > 0 else { return }
        
        let timerTitle = title.isEmpty ? "ახალი ტაიმერი" : title
        
        let newTimer = TimerItem(
            title: timerTitle,
            totalSeconds: totalSeconds,
            remainingSeconds: totalSeconds
        )
        
        timers.append(newTimer)
    }
    
    private func saveHistory(at index: Int) {
           let completedDuration = timers[index].totalSeconds - timers[index].remainingSeconds
           
           if completedDuration > 0 {
               let newHistoryItem = HistoryItem(date: Date(), duration: completedDuration)
               timers[index].history.insert(newHistoryItem, at: 0)
           }
       }
    
    private func playNotification() {
        AudioServicesPlaySystemSound(SystemSoundID(1016))
    }
    
    private func deleteNotification() {
        AudioServicesPlaySystemSound(SystemSoundID(1156))
    }
}
