//
//  Message.swift
//  SwiftChatDemo
//
//  Created by 高鑫 on 2017/11/13.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import Foundation
import UIKit

struct Message {
    let isIn : Bool
    let date : NSDate
    let text : String
}

class Msg {
    static let msgs = [
    [Message(isIn: false, date: NSDate(timeIntervalSinceNow: -12*60*60*24), text: "你叫什么名字?"),
     Message(isIn: true, date: NSDate(timeIntervalSinceNow: -12*60*60*24), text: "我叫Siri")
        ],
    [Message(isIn: false, date: NSDate(timeIntervalSinceNow: -6*60*60*24 - 200), text: "你今年多大？"),
     Message(isIn: true, date: NSDate(timeIntervalSinceNow: -6*60*60*24 - 200), text: "我也不知道")
        ],
    [Message(isIn: false, date: NSDate(timeIntervalSinceNow: -60), text: "你在干嘛？"),
     Message(isIn: true, date: NSDate(timeIntervalSinceNow: -60), text: "我在跟你聊天呀,是不是傻")
        ]
    ]
}
