//
//  JHConstants.swift
//  CueTime
//
//  Created by Tian He on 9/29/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

import Foundation

@objc class JHConstants: NSObject {
    class func kAPIBaseURL() -> String {
        return "localhost:3000"
    }
    class func kAPIDateFormat() -> String {
        return "yyyy-MM-dd HH:mm:ss z"
    }
    class func kDisplayDateFormat() -> String {
        return "yyyy-MM-dd hh:mm a"
    }
}