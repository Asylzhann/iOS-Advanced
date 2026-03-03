//
//  FighterModel.swift
//  lab3
//
//  Created by Assylzhan on 28.02.2026.
//

import Foundation

struct FighterModel: Codable, Identifiable {
    let id: Int
    let name: String
    let images: FighterImage
    let powerstats: Powerstats
    let biography: Biography
    
    struct Powerstats: Codable{
        let intelligence: Int
        let strength: Int
        let speed: Int
        let durability: Int
        let power: Int
        let combat: Int
    }
    
    struct Biography: Codable{
        let alignment: String
    }
    
    struct FighterImage: Codable{
        let md: String
    }
}
