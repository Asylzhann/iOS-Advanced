//
//  ContentView.swift
//  lab2
//
//  Created by Assylzhan on 21.02.2026.
//

import SwiftUI

struct FavoriteItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let emoji: String
}

struct ContentView: View {
    @State private var rockMusic: [FavoriteItem] = [
        FavoriteItem(title: "Bohemian Rhapsody", subtitle: "Queen - 1975", emoji: "🎸"),
        FavoriteItem(title: "Stairway to Heaven", subtitle: "Led Zeppelin - 1971", emoji: "⚡️"),
        FavoriteItem(title: "Comfortably Numb", subtitle: "Pink Floyd - 1979", emoji: "🧱"),
        FavoriteItem(title: "Back in Black", subtitle: "AC/DC - 1980", emoji: "🤘"),
        FavoriteItem(title: "Hotel California", subtitle: "Eagles - 1976", emoji: "🏨"),
        FavoriteItem(title: "Imagine", subtitle: "John Lennon - 1971", emoji: "🕊️"),
        FavoriteItem(title: "Purple Haze", subtitle: "Jimi Hendrix - 1967", emoji: "🟣"),
        FavoriteItem(title: "Smells Like Teen Spirit", subtitle: "Nirvana - 1991", emoji: "👟"),
        FavoriteItem(title: "Dream On", subtitle: "Aerosmith - 1973", emoji: "☁️"),
        FavoriteItem(title: "Born to Run", subtitle: "Bruce Springsteen - 1975", emoji: "🏃‍♂️")
    ]
    @State private var favoriteMovies: [FavoriteItem] = [
        FavoriteItem(title: "Inception", subtitle: "Sci-Fi - 2010", emoji: "🌀"),
        FavoriteItem(title: "The Godfather", subtitle: "Crime - 1972", emoji: "🌹"),
        FavoriteItem(title: "The Dark Knight", subtitle: "Action - 2008", emoji: "🦇"),
        FavoriteItem(title: "Pulp Fiction", subtitle: "Indie - 1994", emoji: "🍔"),
        FavoriteItem(title: "The Matrix", subtitle: "Sci-Fi - 1999", emoji: "🕶️"),
        FavoriteItem(title: "Interstellar", subtitle: "Sci-Fi - 2014", emoji: "🚀"),
        FavoriteItem(title: "Parasite", subtitle: "Thriller - 2019", emoji: "🍑"),
        FavoriteItem(title: "Spirited Away", subtitle: "Animation - 2001", emoji: "🐉"),
        FavoriteItem(title: "Gladiator", subtitle: "Drama - 2000", emoji: "⚔️"),
        FavoriteItem(title: "Jurassic Park", subtitle: "Adventure - 1993", emoji: "🦖")
    ]
    @State private var favoriteFoods: [FavoriteItem] = [
        FavoriteItem(title: "Margherita Pizza", subtitle: "Italian - Naples", emoji: "🍕"),
        FavoriteItem(title: "Tonkotsu Ramen", subtitle: "Japanese - Fukuoka", emoji: "🍜"),
        FavoriteItem(title: "Tacos al Pastor", subtitle: "Mexican - CDMX", emoji: "🌮"),
        FavoriteItem(title: "Butter Chicken", subtitle: "Indian - Delhi", emoji: "🥘"),
        FavoriteItem(title: "Croissant", subtitle: "French - Paris", emoji: "🥐"),
        FavoriteItem(title: "Sushi Moriawase", subtitle: "Japanese - Tokyo", emoji: "🍣"),
        FavoriteItem(title: "Cheeseburger", subtitle: "American - NY", emoji: "🍔"),
        FavoriteItem(title: "Pad Thai", subtitle: "Thai - Bangkok", emoji: "🥡"),
        FavoriteItem(title: "Gelato", subtitle: "Italian - Florence", emoji: "🍦"),
        FavoriteItem(title: "Dim Sum", subtitle: "Chinese - Hong Kong", emoji: "🥟")
    ]
    @State private var videoGames: [FavoriteItem] = [
        FavoriteItem(title: "Elden Ring", subtitle: "Action RPG - 2022", emoji: "💍"),
        FavoriteItem(title: "The Last of Us", subtitle: "Action Adventure - 2013", emoji: "🌿"),
        FavoriteItem(title: "Zelda: BOTW", subtitle: "Open World - 2017", emoji: "🛡️"),
        FavoriteItem(title: "Witcher 3", subtitle: "RPG - 2015", emoji: "🐺"),
        FavoriteItem(title: "Halo 3", subtitle: "FPS - 2007", emoji: "🔫"),
        FavoriteItem(title: "Minecraft", subtitle: "Sandbox - 2011", emoji: "🧱"),
        FavoriteItem(title: "Red Dead 2", subtitle: "Western - 2018", emoji: "🤠"),
        FavoriteItem(title: "Hollow Knight", subtitle: "Metroidvania - 2017", emoji: "🪲"),
        FavoriteItem(title: "God of War", subtitle: "Action - 2018", emoji: "🪓"),
        FavoriteItem(title: "Stardew Valley", subtitle: "Simulation - 2016", emoji: "👩‍🌾")
    ]

    var body: some View {
        NavigationStack {
            List {
                Section("Classic Rock Anthems") {
                    ForEach(rockMusic) { item in
                        FavoriteRow(item: item)
                    }
                }
                
                Section("Cinematic Masterpieces") {
                    ForEach(favoriteMovies) { item in
                        FavoriteRow(item: item)
                    }
                }
                
                Section("World Cuisine") {
                    ForEach(favoriteFoods) { item in
                        FavoriteRow(item: item)
                    }
                }
                
                Section("Must-Play Games") {
                    ForEach(videoGames) { item in
                        FavoriteRow(item: item)
                    }
                }
                
                Text("Total Items: \(rockMusic.count + favoriteMovies.count + favoriteFoods.count + videoGames.count)")
            }
            .navigationTitle("My Favorites")
        }
    }
}

struct FavoriteRow: View {
    let item: FavoriteItem
    
    var body: some View {
        HStack(spacing: 15) {
            Text(item.emoji)
                .font(.system(size: 30))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.headline)
                Text(item.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ContentView()
}
