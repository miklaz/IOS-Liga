import UIKit

// Задание #1 (обязательно)
// Перепишите из OOP->POP
// Попробуйте использовать Traint/Mexin
// По желанию можно выполнить необязательные задания


enum AttackStyle: Int, Comparable, CustomStringConvertible {
    case melee
    case longRange
    
    static func < (first: AttackStyle, second: AttackStyle) -> Bool {
        first.rawValue < second.rawValue
    }
    
    var description: String {
        switch self {
        case .longRange:
            return "Long range attack 🏹"
        case .melee:
            return "Melee attack 🤜"
        }
    }
    
}

enum PrimaryAttribute: Int, Comparable {
    case strength
    case agility
    case intelligence
    
    static func < (first: PrimaryAttribute, second: PrimaryAttribute) -> Bool {
        first.rawValue < second.rawValue
    }
    
}

protocol Statistics {
    typealias Attributes = (armor: Float, attackPower: Float, strength: Float, agility: Float, intelligence: Float, hitPoints: Float, mana: Float)

    init(statistics: Attributes, attack: AttackStyle, attribute: PrimaryAttribute)
    
    mutating func updateStatistics(_ statistics: Attributes)
}

protocol Actionable {
    var action: AttackStyle { get }
    var primaryAttribute: PrimaryAttribute { get }
}

extension Actionable {
    func attack() {
        switch action {
        case .longRange:
            print(action.description)
        case .melee:
            print(action.description)
        }
    }
    
}

struct Hero: Statistics, Actionable {
    private(set) var armor: Float?
    private(set) var attackPower: Float?
    private(set) var strength: Float?
    private(set) var agility: Float?
    private(set) var intelligence: Float?
    private(set) var hitPoints: Float?
    private(set) var mana: Float?
    
    private(set) var action: AttackStyle
    private(set) var primaryAttribute: PrimaryAttribute
    
    init(statistics: Attributes, attack style: AttackStyle, attribute: PrimaryAttribute) {
        armor = statistics.armor
        attackPower = statistics.attackPower
        strength = statistics.strength
        agility = statistics.agility
        intelligence = statistics.intelligence
        hitPoints = statistics.hitPoints
        mana = statistics.mana
        action = style
        primaryAttribute = attribute
    }
    
    mutating func updateStatistics(_ statistics: Attributes) {
        armor = statistics.armor
        attackPower = statistics.attackPower
        strength = statistics.strength
        agility = statistics.agility
        intelligence = statistics.intelligence
        hitPoints = statistics.hitPoints
        mana = statistics.mana
    }
    
}

var demonHunterStats: Statistics.Attributes
demonHunterStats.armor = 6
demonHunterStats.agility = 30
demonHunterStats.attackPower = 40
demonHunterStats.hitPoints = 800
demonHunterStats.intelligence = 10
demonHunterStats.mana = 360
demonHunterStats.strength = 15

var demonHunter = Hero(statistics: demonHunterStats, attack: .melee, attribute: .agility)
print("Demon Hunter: \n\(demonHunter)")

var mountainKingStats: Statistics.Attributes
mountainKingStats.armor = 4
mountainKingStats.agility = 30
mountainKingStats.attackPower = 43
mountainKingStats.hitPoints = 1000
mountainKingStats.intelligence = 10
mountainKingStats.mana = 315
mountainKingStats.strength = 25

var mountainKing = Hero(statistics: mountainKingStats, attack: .longRange, attribute: .agility)
print("\nMountain King: \n\(mountainKing)")
