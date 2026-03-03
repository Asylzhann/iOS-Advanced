import Foundation
import Combine

@MainActor
class FighterViewModel: ObservableObject {
    @Published var fighter1: FighterModel?
    @Published var fighter2: FighterModel?
    @Published var isLoading = false
    @Published var resultMessage: String = ""
    
    func startFight() async {
        isLoading = true
        
        let id1 = Int.random(in: 1...731)
        var id2 = Int.random(in: 1...731)
        while id1 == id2 { id2 = Int.random(in: 1...731) }
        
        do {
            async let fetch1 = fetchFighter(id: id1)
            async let fetch2 = fetchFighter(id: id2)
            
            let (f1, f2) = try await (fetch1, fetch2)
            self.fighter1 = f1
            self.fighter2 = f2
            calculateWinner(f1, f2)
        } catch {
            self.resultMessage = "Network error. Try again."
        }
        isLoading = false
    }
    
    private func fetchFighter(id: Int) async throws -> FighterModel {
        let url = URL(string: "https://akabab.github.io/superhero-api/api/id/\(id).json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(FighterModel.self, from: data)
    }
    
    private func calculateWinner(_ f1: FighterModel, _ f2: FighterModel) {
        var f1Wins = 0
        var f2Wins = 0
        
        if f1.powerstats.intelligence > f2.powerstats.intelligence { f1Wins += 1 } else { f2Wins += 1 }
        if f1.powerstats.strength > f2.powerstats.strength { f1Wins += 1 } else { f2Wins += 1 }
        if f1.powerstats.speed > f2.powerstats.speed { f1Wins += 1 } else { f2Wins += 1 }
        if f1.powerstats.durability > f2.powerstats.durability { f1Wins += 1 } else { f2Wins += 1 }
        if f1.powerstats.power > f2.powerstats.power { f1Wins += 1 } else { f2Wins += 1 }
        if f1.powerstats.combat > f2.powerstats.combat { f1Wins += 1 } else { f2Wins += 1 }
        
        if f1Wins > f2Wins {
            resultMessage = "\(f1.name) wins!"
        } else if f2Wins > f1Wins {
            resultMessage = "\(f2.name) wins!"
        } else {
            resultMessage = "Draw!"
        }
    }
}
