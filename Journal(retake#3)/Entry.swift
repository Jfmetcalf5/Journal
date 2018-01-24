//
//  Entry.swift
//  Entry(retake#3)
//
//  Created by Jacob Metcalf on 1/23/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    static func ==(lhs: Entry, rhs: Entry) -> Bool {
        return lhs.title == rhs.title && lhs.bodyText == rhs.bodyText
    }
    
    
    init(title: String, bodyText: String) {
        self.timeStamp = Date()
        self.title = title
        self.bodyText = bodyText
    }
    
    var timeStamp: Date
    var title: String
    var bodyText: String
    
}
