//
//  YoutubeThumbnail.swift
//  sweet-tools
//
//  Created by 박길남 on 2018. 6. 22..
//  Copyright © 2018년 swieeft. All rights reserved.
//

import Foundation

// youtube Thumbnail
enum YouTubeThumbnail {
    case thumbNailInfo(link:String, quailty:quailty)
    
    enum quailty {
        case Zero
        case One
        case Two
        case Three
        
        case Default
        case Medium
        case High
        case Standard
        case Max
        
        var string:String {
            switch self {
            case .Zero: return "0.jpg"
            case .One: return "1.jpg"
            case .Two: return "2.jpg"
            case .Three: return "3.jpg"
                
            case .Default: return "default.jpg"
            case .Medium: return "mqdefault.jpg"
            case .High: return "hqdefault.jpg"
            case .Standard: return "sddefault.jpg"
            case .Max: return "maxresdefault.jpg"
            }
        }
        
        /// All values sorted by image size (1,2,3 are the same size)
        static let allValues = [Default, One, Two, Three,  Medium, High, Zero, Standard, High]
    }
    
    var thumbnailURL:URL? {
        if case let .thumbNailInfo(link, quailty) = self {
            let videoID = getVideoID(link: link)
            
            if videoID ==  "" {
                Logger.error(message: "Invalid YouTube link : \(link)")
                return nil
            }
            
            
            let thumbnailURLStr = "http://i1.ytimg.com/vi/\(videoID)/\(quailty.string)"
            
            Logger.debug(message: thumbnailURLStr)
            
            return URL(string: thumbnailURLStr)
        } else {
            return nil
        }
    }
    
    private func getVideoID(link:String) -> String {
        if let videoID = URLComponents(string: link)?.queryItems?.first(where: { $0.name == "v" })?.value {
            return videoID
        } else {
            var link2 = link
            var videoID = ""
            
            while true {
                let last = link2.removeLast()
                
                if last == "/" || link2.count == 0 {
                    break
                } else {
                    videoID = "\(last)\(videoID)"
                }
            }
            
            return videoID
        }
        //        if let videoID = URLComponents(string: link)?.queryItems?.first(where: { $0.name == "v" })?.value {
        //            return videoID
        //        } else if let videoID = URLComponents(string: link)?.path.replacingOccurrences(of: "/embed/", with: "") {
        //            return videoID
        //        } else if let videoID = URLComponents(string: link)?.path.las .replacingOccurrences(of: "/", with: "") {
        //            return videoID
        //        } else {
        //            return ""
        //        }
    }
}
