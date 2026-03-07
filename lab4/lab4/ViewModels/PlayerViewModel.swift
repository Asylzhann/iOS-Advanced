//
//  PlayerViewModel.swift
//  lab4
//
//  Created by Assylzhan on 07.03.2026.
//

import Foundation
import Combine
import AVFoundation

class PlayerViewModel: ObservableObject {
    let track: TrackModel
    private var player: AVPlayer?
    
    @Published var isPlaying = false
    
    init(track: TrackModel) {
        self.track = track
        setupPlayer()
    }
    
    private func setupPlayer() {
        guard let urlString = track.previewURL, let url = URL(string: urlString) else { return }
        player = AVPlayer(url: url)
    }
    
    func togglePlay() {
        if isPlaying {
            player?.pause()
        } else {
            player?.play()
        }
        isPlaying.toggle()
    }
    
    deinit {
        player?.pause()
        player = nil
    }
}
