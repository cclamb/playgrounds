//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var str1: String = "hola plagroundo"

let str2 = "macaroni"
let str3: String = "and cheez"
let str4 = "mac"

let pi = 3.141_568

print("let's eat some \(pi)")

let result = str2.compare(str4)
result.rawValue

str2.hasPrefix(str4)

let idx = 1..<4

idx.count

var c1: String? = nil
c1 = "foobar"
print("c1 is \(str2)")

var sl: [String] = []
var sl1 = [String]()

sl.append("1")
sl1.append("1")

print(sl1)

var al: [Any] = []
al.append(1)
al.append("2")
al.append(3.14)

var range = [1,2,3,4,5,6]
print(range[1...4])
print(range[1..<4])

range.sort() { $0 > $1 }
print(range)

var blech = (1, "bar")
var (foo, bar) = blech
print("\(foo) \(bar)")

func testTuple(input: (Int, String)) -> (team: String, num:String)? {
    return ("one", "two")
}

let ret = testTuple(input: blech)
if let val = ret {
    print("team: \(val.team)")
}

let testarr = [1, 2, 3, 4, 5]
for val in testarr {
    print(val)
}

func gf(str: String?) -> Void {
    guard let goodstr = str else {
        print("was nil")
        return
    }
    print("\(goodstr)")
}
gf(str: nil)
gf(str: "bar")

struct TestMe {
    var value: UInt8
    var percentage: Float {
        willSet(value) { print("setting...") }
        didSet(value) { print("set.") }
    }
    var split: Float {
        get { return Float(value) * percentage }
    }
}

var tm = TestMe(value: 100, percentage: 0.5)
print(tm.split)
tm.percentage = 0.3
print(tm.split)











