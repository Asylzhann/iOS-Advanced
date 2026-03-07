//
//  TracksViewModel.swift
//  lab4
//
//  Created by Assylzhan on 07.03.2026.
//

import Foundation
import Combine

@MainActor
class TracksViewModel: ObservableObject {
    @Published var tracks: [TrackModel] = []
    let album: AlbumModel
    private let router: AppRouter
    
    init(album: AlbumModel, router: AppRouter) {
        self.album = album
        self.router = router
        loadData()
    }
    
    func loadData() {
        Task {
            do {
                self.tracks = try await MusicService.shared.fetchTracks(collectionId: album.id)
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func selectTrack(_ track: TrackModel) {
        router.routeToPlayer(track: track)
    }
}
