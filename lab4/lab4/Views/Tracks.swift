//
//  Tracks.swift
//  lab4
//
//  Created by Assylzhan on 07.03.2026.
//

import SwiftUI

struct TracksView: View {
    @ObservedObject var viewModel: TracksViewModel
    
    var body: some View {
        List {
            Section {
                VStack {
                    AsyncImage(url: URL(string: viewModel.album.artworkURL)) { img in img.resizable() } placeholder: { Color.gray }
                        .aspectRatio(1, contentMode: .fit).cornerRadius(12).padding()
                    Text(viewModel.album.name).font(.title2).bold()
                    Text(viewModel.album.artist).foregroundColor(.secondary)
                }.frame(maxWidth: .infinity)
            }
            
            ForEach(viewModel.tracks) { track in
                Button(action: { viewModel.selectTrack(track) }) {
                    HStack {
                        Text("\(track.number)").foregroundColor(.secondary).frame(width: 25)
                        Text(track.name)
                        Spacer()
                        Text(track.duration).font(.caption).foregroundColor(.secondary)
                    }
                }
            }
        }
        .navigationTitle("Tracks")
    }
}
