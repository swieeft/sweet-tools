//
//  Logger.swift
//  sweet-tools
//
//  Created by swieeft on 2018. 6. 12..
//  Copyright © 2018년 swieeft. All rights reserved.
//

import Foundation
import UIKit

enum LogLevel:String {
    case debug = "💚[DEBUG]"
    case info = "💙[INFO]"
    case warning = "🧡[WARNING]"
    case error = "💔[ERROR]"
}

class Logger {
    
    public static var logLevel = LogLevel.debug
    
    class func debug(message:String, function:String = #function, file:String = #file, line:Int = #line) {
        #if DEBUG
        write(type: .debug, message: message, function: function, file: file, line: line)
        #endif
    }
    
    class func info(message:String, function:String = #function, file:String = #file, line:Int = #line) {
        write(type: .info, message: message, function: function, file: file, line: line)
    }
    
    class func warning(message:String, function:String = #function, file:String = #file, line:Int = #line) {
        write(type: .warning, message: message, function: function, file: file, line: line)
    }
    
    class func error(message:String, function:String = #function, file:String = #file, line:Int = #line) {
        write(type: .error, message: message, function: function, file: file, line: line)
    }
    
    private class func write(type:LogLevel, message:String, function:String, file:String, line:Int) {
        
        if checkLogLevel(type: type) == false {
            return
        }
        
        let date = getCurrentDate()
        let file = getFileName(file: file)
        let bundleName = Bundle.main.object(forInfoDictionaryKey: kCFBundleNameKey as String) as? String ?? "MyApp"
        
        print("\(type.rawValue) \(bundleName) Logger [\(date)]")
        print("|| \(file):\(line) \(function)")
        print("|| → \(message)\n")
    }
    
    private class func getCurrentDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateStr = dateFormatter.string(from: date)
        
        return dateStr
    }
    
    private class func getFileName(file:String) -> String {
        var file = file
        file = NSString(string: file).lastPathComponent
        file = NSString(string: file).deletingPathExtension
        
        return file
    }
    
    private class func checkLogLevel(type:LogLevel) -> Bool {
        switch logLevel {
        case .debug:
            return true
        case .info:
            if type == LogLevel.debug {
                return false
            } else {
                return true
            }
        case .warning:
            if type == LogLevel.debug || type == LogLevel.info {
                return false
            } else {
                return true
            }
        case .error:
            if type == LogLevel.error {
                return true
            } else {
                return false
            }
        }
    }
}

