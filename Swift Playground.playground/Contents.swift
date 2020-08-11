import UIKit


// Playing with creating a 2D Array ================================================================

var height = 50
var width = 50

var array: [[Int]] = []

for x in 0...width {
    array.append([])

    for y in 0...height {
    array[x].append(y)

  }
}

//print(array)


// STRUCTS =========================================================================================

/* Structs are immutable, you have to mutate them, but they pass by value rather than by reference, which is what classes do */
struct Town {
    let name: String
    var citizens: [String]
    var resources: [String: Int]
    
    init(name: String, citizens: [String], resources: [String: Int]) {
        self.name = name
        self.citizens = citizens
        self.resources = resources
    }
    
}

var newTown = Town(name: "MicksTown", citizens: ["Mickle", "Anne"], resources: ["Micks": 10])

//print(newTown)


// TIMER ========================================================================================
//Timer.scheduledTimer(timeInterval: <#T##TimeInterval#>, target: <#T##Any#>, selector: <#T##Selector#>, userInfo: <#T##Any?#>, repeats: <#T##Bool#>)




// Closures and Array methods ====================================================================
var newArray = [1, 2, 3, 5, 6]

var bojangles = newArray.map({$0 + 1})

print(bojangles)


// The _ here is the name of the argument being passed to the function, the intName value is the name that it uses as reference inside the function
func tryThis(_ intName: String) {
    print (intName)
}

tryThis("Here's a name")

// Extensions =================================================================

// Extensions allow us to extend the functionality of an existing function. 

// This extension method allows us to write an extension to the existing Double method - it allows us to specify the decimal places that the number is rounded to.
extension Double {
    
    func round(to places: Int) -> Double {
        let precisionNumber = pow(10, Double(places))
        var n = self
        n = n * precisionNumber
        n.round()
        n = n / precisionNumber
        return n
    }
}


var myDouble = 3.14159

print(myDouble.round(to: 2))


