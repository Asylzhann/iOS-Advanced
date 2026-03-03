import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = FighterViewModel()
    
    var body: some View {
        VStack {
            Text("HERO BATTLE")
                .font(.largeTitle)
                .padding(.top)

            if viewModel.isLoading {
                ProgressView("Fetching fighters...")
                    .frame(maxHeight: .infinity)
            } else {
                HStack(alignment: .top) {
                    if let f1 = viewModel.fighter1 { FighterColumn(fighter: f1) }
                    Spacer().frame(width: 10)
                    Text("VS")
                        .font(.largeTitle)
                        .padding(.vertical, 60)
                    if let f2 = viewModel.fighter2 { FighterColumn(fighter: f2) }
                }
                .padding(.horizontal)
                .frame(maxHeight: .infinity)
            }
            
            Text(viewModel.resultMessage)
                .font(.headline)
                .padding(.bottom)

            Button(action: { Task { await viewModel.startFight() } }) {
                Text("FIGHT!")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding()
            .task(viewModel.startFight)
        }
    }
}

struct FighterColumn: View {
    let fighter: FighterModel
    
    var body: some View {
        VStack(spacing: 12) {
            AsyncImage(url: URL(string: fighter.images.md)) { img in
                img.resizable().scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 150, height: 180)
            .cornerRadius(10)
            .clipped()
            
            var fighterColor: Color {
                if fighter.biography.alignment == "good" { return .green }
                if fighter.biography.alignment == "bad" { return .red }
                return .black
            }

            Text(fighter.name)
                .font(.subheadline.bold())
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .foregroundColor(fighterColor)

            VStack(alignment: .leading, spacing: 4) {
                StatView(label: "INT", value: fighter.powerstats.intelligence)
                StatView(label: "STR", value: fighter.powerstats.strength)
                StatView(label: "SPD", value: fighter.powerstats.speed)
                StatView(label: "DUR", value: fighter.powerstats.durability)
                StatView(label: "POW", value: fighter.powerstats.power)
                StatView(label: "CBT", value: fighter.powerstats.combat)
            }
        }
    }
}

struct StatView: View {
    let label: String
    let value: Int
    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            Text("\(label): \(value)").font(.system(size: 10, weight: .bold))
        }
    }
}

#Preview {
    ContentView()
}
