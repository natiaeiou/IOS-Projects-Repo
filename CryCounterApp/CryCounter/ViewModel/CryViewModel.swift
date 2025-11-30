//
//  CryViewModel.swift
//  CryCounter
//
//  Created by Atinati on 26.11.25.
//
import SwiftUI
import Combine

class CryViewModel: ObservableObject {
    @Published var cryEntries: [CryEntry] = []
    @Published var funnyMessage: String = ""
    @Published var showMessage: Bool = false
    
    private let repository: CryRepositoryProtocol
    private var messageTimer: Timer?
    
    private let funnyMessages = [
        "Cry again tomorrow! 😢",
        "Hydration level: Expert 💧",
        "Oscar-worthy performance! 🎭",
        "10/10 would cry again! ⭐",
        "Same time tomorrow? 📅",
        "Your tear ducts say thank you 💦",
        "Consistency is key! 📊",
        "Another one for the books 📖",
        "You're really committed to this 🎯",
        "Breaking your own records! 🏆",
        "The grind never stops 💪",
        "Tears: unlimited plan activated ♾️",
        "Professional crier status unlocked 🎖️",
        "That's what we call dedication 🔥",
        "Add it to your resume 📝",
        "Efficiency: 100% 📈",
        "You make it look easy 😎",
        "Logged and loaded 🎮",
        "Coming back for more, I see 👀",
        "Bold strategy, Cotton 🎪",
        "Achievement unlocked 🔓",
        "Still got it! 💯"
    ]
    
    init(repository: CryRepositoryProtocol = CryRepository()) {
        self.repository = repository
        self.cryEntries = repository.loadCryEntries()
    }
    
    // MARK: Computed Properties
    var totalCries: Int {
        cryEntries.count
    }
    
    var criesThisMonth: Int {
        let calendar = Calendar.current
        let now = Date()
        return cryEntries.filter { entry in
            calendar.isDate(entry.date, equalTo: now, toGranularity: .month)
        }.count
    }
    
    var criedToday: Bool {
        let calendar = Calendar.current
        let today = Date()
        return cryEntries.contains { entry in
            calendar.isDate(entry.date, inSameDayAs: today)
        }
    }
    
    var sortedEntries: [CryEntry] {
        cryEntries.sorted { $0.date > $1.date }
    }
    
    // MARK:  Public Methods
    func addCryEntry() {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        
        guard !criedToday else {
            showRandomMessage()
            return
        }
        
        let newEntry = CryEntry(date: today)
        cryEntries.append(newEntry)
        repository.saveCryEntries(cryEntries)
        
        showRandomMessage()
    }
    
    func daysAgo(from date: Date) -> String {
        let calendar = Calendar.current
        let days = calendar.dateComponents([.day], from: date, to: Date()).day ?? 0
        
        if days == 0 {
            return "Today"
        } else if days == 1 {
            return "Yesterday"
        } else {
            return "\(days) days ago"
        }
    }
    
    // MARK: Private Methods
    private func showRandomMessage() {
        funnyMessage = funnyMessages.randomElement() ?? "Keep going! 💙"
        showMessage = true
        
        messageTimer?.invalidate()
        messageTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { [weak self] _ in
            self?.hideMessage()
        }
    }
    
    private func hideMessage() {
        showMessage = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.funnyMessage = ""
        }
    }
}
