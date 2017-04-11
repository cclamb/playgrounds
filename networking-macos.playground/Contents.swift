//: Playground - noun: a place where people can play

import Cocoa
import Foundation

typealias CompletionHandler = () -> Void
class MySessionDelegate : NSObject,
    URLSessionDelegate,
    URLSessionTaskDelegate,
    URLSessionDataDelegate,
URLSessionStreamDelegate {
    var completionHandlers: [String:CompletionHandler] = [:]
}

// Creating session configurations
let defaultConfiguration = URLSessionConfiguration.default
let ephemeralConfiguration = URLSessionConfiguration.ephemeral
let backgroundConfiguration = URLSessionConfiguration.backgroundSessionConfiguration("com.myapp.networking.background")

// Configuring caching behavior for the default session
let cachesDirectoryURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
let cacheURL = try! cachesDirectoryURL.appendingPathComponent("MyCache")
var diskPath = cacheURL.path

/* Note:
 iOS requires the cache path to be
 a path relative to the ~/Library/Caches directory,
 but OS X expects an absolute path.
 */
#if os(OSX)
diskPath = cacheURL.absoluteString
#endif

let cache = URLCache(memoryCapacity:16384, diskCapacity: 268435456, diskPath: diskPath)
defaultConfiguration.urlCache = cache
defaultConfiguration.requestCachePolicy = .useProtocolCachePolicy
// Creating sessions
let delegate = MySessionDelegate()
let operationQueue = OperationQueue.main

let defaultSession = URLSession(configuration: defaultConfiguration, delegate: delegate, delegateQueue: operationQueue)
let ephemeralSession = URLSession(configuration: ephemeralConfiguration, delegate: delegate, delegateQueue: operationQueue)
let backgroundSession = URLSession(configuration: backgroundConfiguration, delegate: delegate, delegateQueue: operationQueue)

let sessionWithoutADelegate = URLSession(configuration: defaultConfiguration)
if let url = URL(string: "https://www.slashdot.com/") {
    (sessionWithoutADelegate.dataTask(with: url) { (data, response, error) in
        print("got a response!")
        if let error = error {
            print("Error: \(error)")
        } else if let response = response,
            let data = data,
            let string = String(data: data, encoding: .utf8) {
            print("Response: \(response)")
            print("DATA:\n\(string)\nEND DATA\n")
        }
    }).resume()
}

if let url = URL(string: "https://www.cnn.com/") {
    let dataTask = defaultSession.dataTask(with: url)
    dataTask.resume()
}




