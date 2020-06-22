

/*
class A {
    deinit {
        print("A")
    }
}

class B: A {
    deinit {
        print("B")
    }
}

do {
    let a = B()
}
 
*/

class A {
    var id: Int
    init(id: Int) {
        self.id = id
    }
}

struct B {
    var grade: Int
    var a: A
}

var a = A(id: 1)
var a_copy = a

var b1 = B(grade: 2, a: a)
var copy_b1 = b1

//print(b1.a.id)
//b1.a.id = 5
//print(copy_b1.a.id)
//
//print(b1.grade)
//b1.grade = 3
//print(copy_b1.grade)

//var a = A(id: 1)
//var a_copy = a
//
//withUnsafePointer(to: &a) { (address) in
//    print("address of a (class) = \(address)")
//}
//withUnsafePointer(to: &a_copy) { (address) in
//    print("address of a_copy (class) = \(address)")
//}
//withUnsafePointer(to: &a.id) { (address) in
//    print("address of a.id (struct) = \(address)")
//}
//withUnsafePointer(to: &a_copy.id) { (address) in
//    print("address of a_copy.id (struct) = \(address)")
//}

//
//
//struct Address {
//  var streetAddress: String
//  var city: String
//  var state: String
//  var postalCode: String
//}
//
//class Person {          // Reference type
//  var name: String      // Value type
//  var address: Address  // Value type
//
//  init(name: String, address: Address) {
//    self.name = name
//    self.address = address
//  }
//
//
//}
//
//// 1
//let kingsLanding = Address(
//  streetAddress: "1 King Way",
//  city: "Kings Landing",
//  state: "Westeros",
//  postalCode: "12345")
//let madKing = Person(name: "Aerys", address: kingsLanding)
//let kingSlayer = Person(name: "Jaime", address: kingsLanding)
//
//// 2
//kingSlayer.address.streetAddress = "1 King Way Apt. 1"
//
//// 3
//madKing.address.streetAddress  // 1 King Way
//kingSlayer.address.streetAddress // 1 King Way Apt. 1
//
//
//struct Bill {
//  let amount: Float
//  let billedTo: Person
//
//    init(amount: Float, billedTo: Person) {
//      self.amount = amount
//      // Create a new Person reference from the parameter
//      self.billedTo = Person(name: billedTo.name, address: billedTo.address)
//    }
//}
//
//// 1
//let billPayer = Person(name: "Robert", address: kingsLanding) // ref type
//
//// 2
//let bill = Bill(amount: 42.99, billedTo: billPayer)
//let bill2 = bill
//
//// 3
//billPayer.name = "Bob"
//
//// Inspect values
//bill.billedTo.name    // "Bob"
//bill2.billedTo.name   // "Bob"
