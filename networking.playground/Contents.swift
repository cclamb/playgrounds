//: Playground - noun: a place where people can play

import UIKit
import Foundation

typealias CompletionHandler = () -> Void
class MySessionDelegate : NSObject,
    URLSessionDelegate,
    URLSessionTaskDelegate,
    URLSessionDataDelegate,
    URLSessionStreamDelegate {
    var completionHandlers: [String:CompletionHandler] = [:]
}

print("foo")

let defaultConfig = URLSessionConfiguration.default
let delegate = MySessionDelegate()
let operationQueue = OperationQueue.main
let defaultSession = URLSession(configuration: defaultConfig,
                                delegate: delegate,
                                delegateQueue: operationQueue)

let session = URLSession(configuration: defaultConfig)
if let url = URL(string: "http://www.cnn.com") {
    (session.dataTask(with: url) { (data, resp, err) in
        if let error = err {
            print("Error: \(err)")
        } else if let resp = resp,
            let data = data,
            let string = String(data: data, encoding: .utf8) {
            print("Response: \(resp)")
            print("DATA: \n\(string)\nend data\n")
        }
    }).resume()
}
