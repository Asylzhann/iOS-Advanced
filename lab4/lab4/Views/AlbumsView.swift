//
//  AlbumsView.swift
//  lab4
//
//  Created by Assylzhan on 07.03.2026.
//

import SwiftUI

struct AlbumsView: View {
    @ObservedObject var viewModel: AlbumsViewModel
    
    var body: some View {
        List(viewModel.albums) { album in
            Button(action: { viewModel.selectAlbum(album) }) {
                HStack(spacing: 15) {
                    AsyncImage(url: URL(string: album.artworkURL)) { img in img.resizable() } placeholder: { Color.gray }
                        .frame(width: 60, height: 60).cornerRadius(8)
                    VStack(alignment: .leading) {
                        Text(album.name).font(.headline)
                        Text(album.artist).font(.subheadline).foregroundColor(.secondary)
                    }
                }
            }
        }
        .navigationTitle("Music App")
    }
}
