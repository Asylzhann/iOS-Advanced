//
//  Album.swift
//  lab4
//
//  Created by Assylzhan on 07.03.2026.
//

import Foundation

struct AlbumModel: Identifiable {
    let id: Int
    let name: String
    let artist: String
    let artworkURL: String
    
    init?(from result: iTunesResult) {
        guard let id = result.collectionId, let name = result.collectionName else { return nil }
        self.id = id
        self.name = name
        self.artist = result.artistName
        self.artworkURL = result.artworkUrl100.replacingOccurrences(of: "100x100", with: "600x600")
    }
}
