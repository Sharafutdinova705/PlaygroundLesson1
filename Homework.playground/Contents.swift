//--------------------------------Homework 2.2--------------------------------------------------------

//import Cocoa
import Foundation



class Unit {
    
    var health:Int
    var damage:Int
    var protection:Int
    var dexterity:Int
    var speed:Int
    private var name:String
    
    func getName() -> String {
        return self.name
    }
    
    init(health:Int, damage:Int, protection:Int, dexterity:Int, speed:Int, name:String) {
        self.health = health
        self.damage = damage
        self.protection = protection
        self.dexterity = dexterity
        self.speed = speed
        self.name = name
    }
    
    
    func Attack(to enemy:Unit) {
        let rand = Int(arc4random_uniform(100))
        if rand > enemy.dexterity {
            enemy.health = enemy.health - self.damage * (1 - enemy.protection / 100)
        }
    }
}

class Magician:Unit {
    
}

class Assasin:Unit {
    
}

class Knight:Unit {
    
}

class Battlefield {
    
    func findCountOfHealthyFighters(arr:[Unit]) -> Int {
        var countOfHealthyFighters = 0
        for fighters in arr {
            if fighters.health > 0 { countOfHealthyFighters = countOfHealthyFighters + 1 }
        }
        return countOfHealthyFighters
    }
    
    
    
    func beginBattle(array:[Unit]) {
        
        var arr = array
        let countOfHealthyFighters = findCountOfHealthyFighters(arr: arr)
        
        while countOfHealthyFighters > 0 {
            
            var arr2:[Unit] = []
            print("_________________")
            print("Begin")
            print("_________________")
            var count:Int = 0
            var index:Int = -1
            var smbIndex = 0 //индекс борцов с health > 0
            
            for smb in arr {
                index = index + 1
                if smb.health > 0 {
                    count = count+1
                    smbIndex = index
                    arr2.append(arr[smbIndex]) //массив борцов с health > 0
                }
            }
            
            if count == 1 {
                print("The winner is ", arr[smbIndex].getName())
                print("Participants: ")
                var count:Int = 0
                for k in array {
                    count = count+1
                    print(count, "–", k.getName())
                }
                break
            } else {
                var currentSpeed = 0
                var currentIndex = -1
                var smbdIndex = 0 // индекс борца с большей скоростью, он будет наносить урон
                
                for smbd in arr2 {
                    
                    smbd.speed = smbd.speed + Int(arc4random_uniform(5))
                    currentIndex = currentIndex + 1
                    if smbd.health <= 0 {
                        arr2.remove(at: currentIndex)
                    } else {
                        
                        if smbd.speed > currentSpeed && smbd.health > 0 {
                            currentSpeed = smbd.speed
                            smbdIndex = currentIndex
                        }
                    }
                    
                }
                
                
                var i = Int(arc4random_uniform(UInt32(arr2.count))) //индекс рандомного борца из массива борцов с health > 0
                
                while i == smbdIndex { i = Int(arc4random_uniform(UInt32(arr2.count))) }
                
                if i != smbdIndex {
                    arr[smbdIndex].Attack(to: arr2[i])
                    print(arr2[i].health)
                    print(arr[smbdIndex])
                    print(arr2[i])
                    if arr2[i].health <= 0 { arr.remove(at: i) }
                }
            }
        }
    }
    
}

let mag = Magician(health: 100, damage: 20, protection: 30, dexterity: 40, speed: 1, name: "Mag")
let assasin = Assasin(health: 100, damage: 40, protection: 30, dexterity: 60, speed:2, name: "As")
let knight = Knight(health: 100, damage: 30, protection: 30, dexterity: 50, speed:3, name: "Kn")
let arr = [mag, assasin, knight]
let battle = Battlefield()
battle.beginBattle(array: arr)


//--------------------------------Homework 2.1--------------------------------------------------------




//: Playground - noun: a place where people can play

import Cocoa

func mytrim(_ word: String, letter: String) -> String {
    var cur: String = ""
    for index in 0 ..< word.count {
        let i = word.index(word.startIndex, offsetBy: index)
        let current = String(word[i])
        if current != letter {
            cur += current
            //print(current)
            //print(cur)
        }
    }
    return cur
}

//mytrim("Hello world", letter: "o")
print(mytrim("Hello world", letter: "o"))
print(mytrim("asdfasasdfs", letter: "a"))

