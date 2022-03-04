import UIKit

// Задание №1
// Написать код, где можно будет сравнивать перечисления.
// Где перечисления могут быть =>, >, <=, < исходя их rating и их названия самого перечисления

enum LessonType {
    case math(rating: Int)
    case nativeLanguage(rating: Int)
    case computerScience(rating: Int)
    case literature(rating: Int)
}

extension LessonType: Comparable {
    
    static func > (first: LessonType, second: LessonType) -> Bool {
        switch (first, second) {
        case (.math(rating: let a), .math(rating: let b)):
            return a > b
        case (.nativeLanguage(rating: let a), .nativeLanguage(rating: let b)):
            return a > b
        case (.computerScience(rating: let a), .computerScience(rating: let b)):
            return a > b
        case (.literature(rating: let a), .literature(rating: let b)):
            return a > b
        default:
            return false
        }
    }
    
    static func < (first: LessonType, second: LessonType) -> Bool {
        switch (first, second) {
        case (.math(rating: let a), .math(rating: let b)):
            return a < b
        case (.nativeLanguage(rating: let a), .nativeLanguage(rating: let b)):
            return a < b
        case (.computerScience(rating: let a), .computerScience(rating: let b)):
            return a < b
        case (.literature(rating: let a), .literature(rating: let b)):
            return a < b
        default:
            return false
        }
    }

    static func >= (first: LessonType, second: LessonType) -> Bool {
        switch (first, second) {
        case (.math(rating: let a), .math(rating: let b)):
            return a >= b
        case (.nativeLanguage(rating: let a), .nativeLanguage(rating: let b)):
            return a >= b
        case (.computerScience(rating: let a), .computerScience(rating: let b)):
            return a >= b
        case (.literature(rating: let a), .literature(rating: let b)):
            return a >= b
        default:
            return false
        }
    }
    
    static func <= (first: LessonType, second: LessonType) -> Bool {
        switch (first, second) {
        case (.math(rating: let a), .math(rating: let b)):
            return a <= b
        case (.nativeLanguage(rating: let a), .nativeLanguage(rating: let b)):
            return a <= b
        case (.computerScience(rating: let a), .computerScience(rating: let b)):
            return a <= b
        case (.literature(rating: let a), .literature(rating: let b)):
            return a <= b
        default:
            return false
        }
    }
    
}

// Задание №2
// Реализуйте протокол Equitable у LessonType

extension LessonType: Equatable {
    static func == (first: LessonType, second: LessonType) -> Bool {
        switch (first, second) {
        case (.math(rating: let a), .math(rating: let b)):
            return a == b
        case (.nativeLanguage(rating: let a), .nativeLanguage(rating: let b)):
            return a == b
        case (.computerScience(rating: let a), .computerScience(rating: let b)):
            return a == b
        case (.literature(rating: let a), .literature(rating: let b)):
            return a == b
        default:
            return false
        }
    }
    
}

let less = LessonType.math(rating: 5) < LessonType.math(rating: 6)
let moreOrEqual = LessonType.literature(rating: 60) <= LessonType.literature(rating: 6)
let semanticallyDifferent = LessonType.computerScience(rating: 1) <= LessonType.nativeLanguage(rating: 2)
let equal = LessonType.computerScience(rating: 10) == LessonType.computerScience(rating:10)

print(less)  // true
print(equal)  // true
print(moreOrEqual)  // false
print(semanticallyDifferent)  // false


