import Foundation

protocol Guessable {
    init()
    mutating func getClue() -> String
    mutating func guess(_: String) -> Bool
}

struct EvenNumbers: Guessable {
    var round: Int
    var secret: String {
        String(round * 2)
    }

    init() {
        round = 1
    }

    mutating func getClue() -> String {
        let temp = secret
        round += 1
        return temp
    }

    mutating func guess(_ answer: String) -> Bool {
        answer == secret
    }
}

struct RainbowColors: Guessable {
    var round: Int
    var colors: [String]

    init() {
        colors = ["red", "orange", "yellow", "green",
                  "blue", "indigo", "violet"]
        round = 1
    }

    mutating func getClue() -> String {
        let temp = colors[round - 1]
        round %= colors.count
        round += 1
        return temp
    }

    mutating func guess(_ answer: String) -> Bool {
        answer == colors[round - 1]
    }
}

struct MoonPhases: Guessable {
    var round: Int
    var moonPhases: [String]

    init() {
        moonPhases = ["New Moon", "Waxing Cresent", "First Quarter", "Waxing Gibbous",
                      "Full Moon", "Waning Gibbous", "Third Quarter", "Waning Cresent"]
        round = 1
    }

    mutating func getClue() -> String {
        let temp = moonPhases[round - 1]
        round %= moonPhases.count
        round += 1
        return temp
    }

    mutating func guess(_ answer: String) -> Bool {
        answer == moonPhases[round - 1]
    }
}

struct GameHistory: Codable {
    var games: [Int]
    var gamesPlayed: Int {
        games.count
    }

    var averageClues: Double {
        guard games.count > 0 else {
            return 0
        }
        var sum: Double = 0.0
        for clues in games {
            sum += Double(clues)
        }
        return sum / Double(games.count)
    }

    init() {
        games = []
    }
}

struct Game {
    var history: GameHistory
    var urlLink = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("game").appendingPathExtension("plist")

    init() {
        if let sessionData = try? Data(contentsOf: urlLink), let gameSession = try? PropertyListDecoder().decode(GameHistory.self, from: sessionData) {
            history = gameSession
        } else {
            history = GameHistory()
        }
    }

    func getGenerator() -> Guessable {
        let num = Int.random(in: 1 ... 3)
        switch num {
        case 1: return EvenNumbers()
        case 2: return RainbowColors()
        case 3: return MoonPhases()
        default: return EvenNumbers()
        }
    }

    mutating func reset() {
        history = GameHistory()
    }

    func save() {
        // TODO: Save the history object into a file called game.plist
        if let sessionData = try? PropertyListEncoder().encode(history) {
            try? sessionData.write(to: urlLink)
        }
    }
}
