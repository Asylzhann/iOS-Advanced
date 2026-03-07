//
//  Player.swift
//  lab4
//
//  Created by Assylzhan on 07.03.2026.
//

import SwiftUI

struct PlayerView: View {
    @ObservedObject var viewModel: PlayerViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            AsyncImage(url: URL(string: viewModel.track.artworkURL)) { image in
                image.resizable()
            } placeholder: {
                Rectangle().fill(Color.gray.opacity(0.3))
            }
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(20)
            .padding(30)
            
            VStack {
                Text(viewModel.track.name)
                    .font(.title)
                    .bold()
                Text(viewModel.track.artist)
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
            
            HStack(spacing: 60) {
                Button(action: {/* */}) {
                    Image(systemName: "backward.fill")
                }
                
                Button(action: { viewModel.togglePlay() }) {
                    Image(systemName: viewModel.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .font(.system(size: 80))
                }
                
                Button(action: { /* */ }) {
                    Image(systemName: "forward.fill")
                }
            }
            .font(.title)
            .foregroundColor(.primary)
            
            Slider(value: .constant(0.5))
                .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Now Playing")
    }
}
