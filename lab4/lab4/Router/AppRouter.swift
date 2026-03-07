//
//  AppRouter.swift
//  lab4
//
//  Created by Assylzhan on 07.03.2026.
//

import UIKit
import SwiftUI

final class AppRouter {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let albumsViewModel = AlbumsViewModel(router: self)
        let rootView = AlbumsView(viewModel: albumsViewModel)
        let rootVC = UIHostingController(rootView: rootView)
        navigationController.setViewControllers([rootVC], animated: false)
    }
    
    func routeToTracks(album: AlbumModel) {
        let viewModel = TracksViewModel(album: album, router: self)
        let tracksVC = UIHostingController(
            rootView: TracksView(viewModel: viewModel)
        )
        navigationController.pushViewController(tracksVC, animated: true)
    }
    
    func routeToPlayer(track: TrackModel) {
        let viewModel = PlayerViewModel(track: track)
        let playerVC = UIHostingController(
            rootView: PlayerView(viewModel: viewModel)
        )
        navigationController.pushViewController(playerVC, animated: true)
    }
}
