//
//  MusicService.swift
//  lab4
//
//  Created by Assylzhan on 07.03.2026.
//

import Foundation

class MusicService {
    static let shared = MusicService()
    
    func fetchAlbums(query: String) async throws -> [AlbumModel] {
        let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "https://itunes.apple.com/search?term=\(encoded)&entity=album&limit=25"
        guard let url = URL(string: urlString) else { return [] }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(iTunesResponse.self, from: data)
        return response.results.compactMap { AlbumModel(from: $0) }
    }
    
    func fetchTracks(collectionId: Int) async throws -> [TrackModel] {
        let urlString = "https://itunes.apple.com/lookup?id=\(collectionId)&entity=song"
        guard let url = URL(string: urlString) else { return [] }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(iTunesResponse.self, from: data)

        return response.results.filter { $0.wrapperType == "track" }.compactMap { TrackModel(from: $0) }
    }
}
