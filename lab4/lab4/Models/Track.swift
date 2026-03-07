//
//  Track.swift
//  lab4
//
//  Created by Assylzhan on 07.03.2026.
//

import Foundation

struct TrackModel: Identifiable {
    let id: Int
    let name: String
    let artist: String
    let number: Int
    let duration: String
    let previewURL: String?
    let artworkURL: String
    
    init?(from result: iTunesResult) {
        guard let id = result.trackId, let name = result.trackName else { return nil }
        self.id = id
        self.name = name
        self.artist = result.artistName
        self.number = result.trackNumber ?? 0
        self.previewURL = result.previewUrl
        self.artworkURL = result.artworkUrl100.replacingOccurrences(of: "100x100", with: "600x600")
        
        let seconds = (result.trackTimeMillis ?? 0) / 1000
        self.duration = String(format: "%02d:%02d", seconds / 60, seconds % 60)
    }
}
