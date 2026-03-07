//
//  AlbumsViewModel.swift
//  lab4
//
//  Created by Assylzhan on 07.03.2026.
//

import Foundation
import Combine

@MainActor
class AlbumsViewModel: ObservableObject {
    @Published var albums: [AlbumModel] = []
    private let router: AppRouter
    
    init(router: AppRouter) {
        self.router = router
        loadData()
    }
    
    func loadData() {
        Task {
            do {
                self.albums = try await MusicService.shared.fetchAlbums(query: "Tame Impala")
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func selectAlbum(_ album: AlbumModel) {
        router.routeToTracks(album: album)
    }
}
