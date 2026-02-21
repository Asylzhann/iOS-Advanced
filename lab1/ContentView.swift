//
//  ContentView.swift
//  lab1
//
//  Created by Assylzhan on 21.02.2026.
//

import SwiftUI

struct ContentView: View {
    let itemNames = [
        "Dracula",
        "End Of Summer",
        "Let It Happen",
        "Neverender",
        "New Gold",
        "Patience"
    ]
    let itemImages = [
        "dracula",
        "end_of_summer",
        "let_it_happen",
        "neverender",
        "new_gold",
        "patience"
    ]
    let itemDescriptions = [
        "Tame Impala - 2025",
        "Tame Impala - 2025",
        "Tame Impala - 2015",
        "Tame Impala - 2024",
        "Tame Impala - 2023",
        "Tame Impala - 2020"
    ]
    let itemRatings = [4, 5, 5, 4, 5, 4]
    
    @State private var currentIndex: Int = 0
    @State private var tapCount: Int = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image(itemImages[currentIndex])
                .resizable()
                .frame(width: 300)
                .frame(height: 300)
                .cornerRadius(15)
                .shadow(radius: 5)
            
            Text(itemNames[currentIndex])
                .font(.title)
                .bold()
            
            Divider()
                .padding(.horizontal, 40)
            
            Text(itemDescriptions[currentIndex])
                .font(.body)
            
            HStack {
                Text("Vibe:")
                if itemRatings[currentIndex] > 0 {
                    Text(String(repeating: "✨", count: itemRatings[currentIndex]))
                } else {
                    Text("No vibes yet")
                }
            }
            .font(.headline)
            
            Spacer()
            
            Button(action: {
                generateRandomIndex()
            }) {
                Label("Surprise Me!", systemImage: "dice")
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal, 40)
            
            Text("Cards explored: \(tapCount)")
                .font(.footnote)
                .padding(.bottom)
        }
        .padding()
    }
    
    func generateRandomIndex() {
        var newIndex: Int
        
        repeat {
            newIndex = Int.random(in: 0..<itemNames.count)
        } while newIndex == currentIndex
        
        currentIndex = newIndex
        tapCount += 1
    }
}

#Preview {
    ContentView()
}
