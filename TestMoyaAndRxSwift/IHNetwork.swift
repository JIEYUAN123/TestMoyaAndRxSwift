//
//  IHNetwork.swift
//  TestMoyaAndRxSwift
//
//  Created by YJ on 2017/4/19.
//  Copyright © 2017年 YJ. All rights reserved.
//

import UIKit
import Moya

enum IHNetwork {
    case getLaunchImg
    case getNewsList
    case getMoreNews(String)
    case getThemeList
    case getThemeDesc(Int)
    case getNewsDesc(Int)
}
extension IHNetwork :TargetType {
    var sampleData: Data {
        return Data()
    }
    
    /// The method used for parameter encoding.
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    public var task: Task {
        return .request
    }
    /// The parameters to be incoded in the request.
    var parameters: [String : Any]? {
        return nil
    }
    
    
    var base :String{
        return "http://news-at.zhihu.com/api/"
        //return "https://api.github.com"
        //return "http://api.xingzhuangmall.com"
        //return "http://res.xingzhuangmall.com"
    }
    
    var baseURL: URL { return URL(string: base)! }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String {
        switch self {
//        case .login( let username):
//            return "/labs/bubbler/user/\(username)"
//        }
        case .getLaunchImg:
            return "7/prefetch-launch-images/750*1142"
        case .getNewsList:
            return "4/news/latest"
        case .getMoreNews(let date):
            return "4/news/before/" + date
        case .getThemeList:
            return "4/themes"
        case .getThemeDesc(let id):
            return "4/theme/\(id)"
        case .getNewsDesc(let id):
            return "4/news/\(id)"
        //return "/Mall/Handler/HotSmartHandler.aspx";
    }
    }
    /// The HTTP method used in the request.
    var method: Moya.Method { return .get }
    }
