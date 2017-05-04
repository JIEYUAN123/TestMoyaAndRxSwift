//
//  IHJSONParser.swift
//  TestMoyaAndRxSwift
//
//  Created by YJ on 2017/4/20.
//  Copyright © 2017年 YJ. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import HandyJSON
enum NetworkError : String {
    case canNotParseJSON
    case notLoggedIn
    case missingData
    case noInternet
    case canNotConnectService
}
extension NetworkError : Swift.Error {

}
class BaseResponse<T: HandyJSON>: HandyJSON {
    var resultCode : Int?
    var resultMsg : String?
    var data : T?
    public required init() {}
}
extension Observable where Element : Response {
    func mapJSONToObject<T: HandyJSON>(classType : T.Type) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            let jsonStr = String(data: response.data, encoding: .utf8)
            guard let c = JSONDeserializer<T>.deserializeFrom(json: jsonStr) else {
                throw NetworkError.canNotParseJSON
            }
            return Observable<T>.just(c)
//            throw NetworkError.canNotParseJSON
        }
    }
}

//extension Observable where Element : Moya.Response {
//    func mapJSONToObject<B:HandyJSON>(classType: B.Type) -> Observable<B> {
//       return self.map { response in
//        let jsonStr = String(data: response.data , encoding: .utf8)
//        guard let model = JSONDeserializer<B>.deserializeFrom(json:jsonStr) else {
//            throw NetworkError.canNotParseJSON
//        }
//        return model
//        }
//    }
//}









