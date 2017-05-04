//
//  IHNetWorkTool.swift
//  TestMoyaAndRxSwift
//
//  Created by YJ on 2017/4/25.
//  Copyright © 2017年 YJ. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import HandyJSON

typealias successClosure<T> = (T) -> ()
typealias failureClosure = (NetworkError) -> ()

class IHNetWorkTool: NSObject {
    private let disposeBag = DisposeBag()
    static let sharedNetWorkTool = IHNetWorkTool()
    private let provider = RxMoyaProvider<IHNetwork>()
    func requestDataWithTarget<T : HandyJSON>(target: IHNetwork,classType:T.Type) -> Observable<T> {
        return provider.request(target).filterSuccessfulStatusCodes().mapJSONToObject(classType:classType)
    }
    func getDataWithTarget<T:HandyJSON>(target:IHNetwork,classType:T.Type,success: @escaping successClosure<T>,failure:@escaping failureClosure) {
        self.requestDataWithTarget(target: target, classType: classType).subscribe(onNext:{ model in
            success(model)
        },onError:{ error in
            if let netWorkError = error as? NetworkError {
                failure(netWorkError)
            } else {
                failure(NetworkError.noInternet)
            }
        }).addDisposableTo(disposeBag)
    }
    
}
