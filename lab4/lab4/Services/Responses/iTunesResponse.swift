//
//  iTunesResponse.swift
//  lab4
//
//  Created by Assylzhan on 07.03.2026.
//

import Foundation

struct iTunesResponse: Codable {
    let results: [iTunesResult]
}

struct iTunesResult: Codable {
    let wrapperType: String
    let collectionId: Int?
    let collectionName: String?
    let artistName: String
    let artworkUrl100: String
    let trackId: Int?
    let trackName: String?
    let trackNumber: Int?
    let trackTimeMillis: Int?
    let previewUrl: String?
}
