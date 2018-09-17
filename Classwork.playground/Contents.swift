//--------------------------------Classwork 1.1--------------------------------------------------------
//: Playground - noun: a place where people can play

import Cocoa
func insertionSort(_ array:[Int]) -> [Int] {
    
    var mutableArray = array
    
    if array.count == 1 || array.count == 0 {
        
        return mutableArray
        
    } else {
        
        for i in 0 ..< mutableArray.count {
            
            var value = mutableArray[i]
            var j = i
            
            while j > 0 && mutableArray[j - 1] > value{
                mutableArray[j] = mutableArray[j - 1]
                j = j-1
            }
            mutableArray[j] = value
            //print(mutableArray)
        }
    }
    return mutableArray
}

let list = [4, 24, 6, 2, 0, 7, 29]
insertionSort(list)


//--------------------------------Classwork 1.2--------------------------------------------------------


//: Playground - noun: a place where people can play

import Cocoa

class People {
    
    var name:String
    private var lastName:String
    private var age:Int
    
    
    init(name:String, lastName:String, age:Int) {
        self.name = name
        self.lastName = lastName
        self.age = age
    }
    
    func saySomething() {
        print("Hello. I'm ", age)
    }
    
}

class Ann:People {
    
    override func saySomething() {
        print(super.saySomething(), "I'm student")
    }
}

class Joe:People {
    override func saySomething() {
        print(super.saySomething(), "I'm employee")
    }
}

class Marse:People {
    override func saySomething() {
        print(super.saySomething(), "I'm kid")
    }
}

let ann = Ann(name: "Ann", lastName: "Smit", age: 18)
let joe = Joe(name: "Joe", lastName: "Marsh", age: 29)
let marse = Marse(name: "Marse", lastName: "Lin", age: 19)

var array = [ann, joe, marse]

for i in array{
    print(i.saySomething(), "And my name is " + i.name)
}




//--------------------------------Classwork 1.3--------------------------------------------------------


//: Playground - noun: a place where people can play

//import Cocoa

class BinaryTree{
    
    var root:Node? = nil
    
    func add(value:Any) {
        let element = Node.init(parent: nil, left: nil, right: nil, value: value)
        if self.root == nil {
            self.root = element
        } else {
            var newel = self.root
            while newel != nil {
                if compareTwoAny(a: newel?.value as Any, b: value) {
                    if newel?.left != nil {
                        newel = newel?.left
                    } else {
                        element.parent = newel
                        newel?.left = element
                        newel = newel?.left
                        break
                    }
                    
                } else {
                    if newel?.right != nil {
                        newel = newel?.right
                    } else {
                        element.parent = newel
                        newel?.right = element
                        newel = newel?.right
                        break
                    }
                    
                }
            }
            
            while newel?.parent != nil {
                newel = newel?.parent
            }
            self.root = newel
        }
    }
    
    
    func search(value:Any) -> Node {
        var node:Node? = self.root
        while ObjectIdentifier(node?.value as AnyObject) != ObjectIdentifier(value as AnyObject) {
            if ObjectIdentifier(node?.value as AnyObject) > ObjectIdentifier(value as AnyObject) {
                node = node?.left
            } else {
                node = node?.right
            }
        }
        return node!
    }
    
}


func compareTwoAny(a: Any, b: Any) -> Bool {
    return ObjectIdentifier(a as AnyObject) > ObjectIdentifier(b as AnyObject)
}


class Node {
    
    var parent:Node?
    var left:Node?
    var right:Node?
    var value:Any?
    
    init(parent:Node?, left:Node?, right:Node?, value:Any?) {
        
        self.parent = parent
        self.left = left
        self.right = right
        self.value = value
    }
}





var tree = BinaryTree()
tree.add(value: 5)
tree.add(value: 7)
tree.add(value: 3)
tree.add(value: 2)
tree.add(value: 8)
print(tree.root?.value as Any)
print(tree.root?.right?.value)
print(tree.root?.left?.value)
print(tree.root?.right?.right?.value)
print(tree.root?.left?.left?.value)

print("______")

print(tree.search(value: 2))
print(tree.root?.left?.left)






