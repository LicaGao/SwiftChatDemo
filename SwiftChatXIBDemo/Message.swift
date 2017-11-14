//
//  Message.swift
//  SwiftChatXIBDemo
//
//  Created by 高鑫 on 2017/11/14.
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
        [Message(isIn: false, date: NSDate(timeIntervalSinceNow: -6*60*60*24 - 200), text: "今天的足球新闻"),
         Message(isIn: true, date: NSDate(timeIntervalSinceNow: -6*60*60*24 - 200), text: """
世界杯欧洲区预选赛附加赛比赛中，意大利被瑞典淘汰，无缘世界杯。赛后，布冯宣布退出国家队。德罗西、巴尔扎利随后也宣布退出。
布冯1978年1月28日出生，现年39岁。1995年效力于帕尔马，代表球队出战168场。2001年转会加盟尤文图斯，效力至今为球队出战491场。1997年布冯入选国家队，今晨他宣布退出国家队。
""")
        ],
        [Message(isIn: false, date: NSDate(timeIntervalSinceNow: -60), text: "你在干嘛？"),
         Message(isIn: true, date: NSDate(timeIntervalSinceNow: -60), text: "我在跟你聊天呀,是不是傻")
        ]
    ]
}
