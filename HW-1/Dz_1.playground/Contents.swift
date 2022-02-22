import UIKit

protocol Creature {
    var name: String { get set }
    var birthDate: DateComponents { get }
    var color: String { get }
    var breed: String { get }
    var height: Int { get set }
    var weight: Int { get set }
    
    func changeName()
    mutating func move(weight: Int)
    func eat()
    func printObject()
}

struct Cat: Creature {
    var name: String
    var birthDate: DateComponents
    var color: String
    var breed: String
    var height: Int
    var weight: Int
    
    var hair: Bool
    
    func rustle() {
        print("Shvark, shvark, shvark...")
    }
    
    func changeName() {
        print(#function)
    }
    
    mutating func move(weight: Int) {
        self.weight -= 15
        print("\nCat moving!")
    }
    
    func eat() {
        print(#function)
    }
    
    func printObject() {
        print("Cat name: \(name) \nBirth date: \(birthDate) \nColor: \(color) \nBreed: \(breed) \nHeight: \(height) cm \nWeight: \(weight) gr \nHair: \(hair)")
    }
    
}

struct Dog: Creature {
    var name: String
    var birthDate: DateComponents
    var color: String
    var breed: String
    var height: Int
    var weight: Int
    
    var walkTime: Int
    
    func  walkDog(timeInMinutes: Int) {
        print("Walking Dog \(timeInMinutes) minutes")
    }
    
    func changeName() {
        print(#function)
    }
    
    func move(weight: Int) {
        print(#function)
    }
    
    func eat() {
        print(#function)
    }
    
    func printObject() {
        print(#function)
    }

}

var cat = Cat(name: "Barsik", birthDate: DateComponents(year: 2016, month: 4, day: 15, hour: 3), color: "Black", breed: "British", height: 40, weight: 3000, hair: true)

cat.printObject()

cat.move(weight: cat.weight)
print("Cat weight after moving: \(cat.weight)")
