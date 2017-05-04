//
//  StoryModel.swift
//  TestMoyaAndRxSwift
//
//  Created by YJ on 2017/4/24.
//  Copyright © 2017年 YJ. All rights reserved.
//

import UIKit
import HandyJSON
struct listModel : HandyJSON{
    var date : String?
    var stories : [storyModel]?
    var top_stories : [storyModel]?
}

struct storyModel : HandyJSON {
    var ga_prefix : String?
    var id : Int?
    var images : [String]?
    var title : String?
    var type : Int?
    var image : String?
    var multipic = false
}
