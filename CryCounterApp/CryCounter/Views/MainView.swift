//
//  MainView.swift
//  CryCounter
//
//  Created by Atinati on 26.11.25.
//
import SwiftUI
import Combine

struct MainView: View {
    @ObservedObject var viewModel: CryViewModel
    @State private var isPressed = false
    
    var body: some View {
        ZStack {
            backgroundGradient
            
            VStack(spacing: 30) {
                headerSection
                
                Spacer()
                
                cryButtonSection
                
                Spacer()
                
                statsSection
            }
        }
    }
    
    // MARK: View Components
    private var backgroundGradient: some View {
        LinearGradient(
            colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
    
    private var headerSection: some View {
        VStack(spacing: 8) {
            Text("CryCounter")
                .font(.system(size: 40, weight: .bold))
                .padding(.top, 40)
            
            Text("It's okay to cry 💙")
                .font(.system(size: 18))
                .foregroundColor(.gray)
        }
    }
    
    private var cryButtonSection: some View {
        VStack(spacing: 20) {
            CryButton(
                isPressed: $isPressed,
                criedToday: viewModel.criedToday,
                showMessage: viewModel.showMessage,
                action: handleButtonTap
            )
            
            if viewModel.showMessage {
                MessageBubble(message: viewModel.funnyMessage)
                    .transition(.scale.combined(with: .opacity))
            } else if viewModel.criedToday {
                Text("Already logged for today")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
        }
    }
    
    private var statsSection: some View {
        StatsCardView(
            totalCries: viewModel.totalCries,
            criesThisMonth: viewModel.criesThisMonth
        )
        .padding(.horizontal)
        .padding(.bottom, 30)
    }
    
    // MARK: Actions
    private func handleButtonTap() {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
            isPressed = true
        }
        
        viewModel.addCryEntry()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation {
                isPressed = false
            }
        }
    }
}
