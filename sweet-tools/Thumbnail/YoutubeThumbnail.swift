//
//  YoutubeThumbnail.swift
//  sweet-tools
//
//  Created by 박길남 on 2018. 6. 22..
//  Copyright © 2018년 swieeft. All rights reserved.
//

import Foundation

enum YouTubeThumbnail {
    case thumbNailInfo(link:String, quailty:quailty)
    
    enum quailty:String {
        case Zero = "0.jpg"
        case One = "1.jpg"
        case Two = "2.jpg"
        case Three = "3.jpg"
        
        case Default = "default.jpg"
        case Medium = "mqdefault.jpg"
        case High = "hqdefault.jpg"
        case Standard = "sddefault.jpg"
        case Max = "maxresdefault.jpg"
        
        static let allValues = [Default, One, Two, Three,  Medium, High, Zero, Standard, High]
    }
    
    var thumbnailURL:URL? {
        if case let .thumbNailInfo(link, quailty) = self {
            let videoID = getVideoID(link: link)
            
            if videoID ==  "" {
                return nil
            }
            
            Logger.warning(message: link)
            
            return URL(string: "http://i1.ytimg.com/vi/\(videoID)/\(quailty.rawValue)")
        } else {
            return nil
        }
    }
    
    private func getVideoID(link:String) -> String {
        if let videoID = URLComponents(string: link)?.queryItems?.first(where: { $0.name == "v" })?.value {
            return videoID
        } else if let videoID = URLComponents(string: link)?.path.replacingOccurrences(of: "/", with: "") {
            return videoID
        } else {
            return ""
        }
    }
}
