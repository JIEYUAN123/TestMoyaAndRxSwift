//
//  ViewController.swift
//  TestMoyaAndRxSwift
//
//  Created by YJ on 2017/4/19.
//  Copyright © 2017年 YJ. All rights reserved.
//

import UIKit
import Moya
import NSObject_Rx
import RxSwift
class ViewController: UIViewController {
    fileprivate let tableView : UITableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.login(userName: "ahbei")
        
    }

}
extension ViewController {
//    func login(userName:String) {
//        let requestProvider = RxMoyaProvider<IHNetwork>()
//        requestProvider.request(.login(userName: userName)).filterSuccessfulStatusAndRedirectCodes().mapJSONToObject(classType: IHUserModel.self).subscribe { event in
//            print(event)
//            guard let targetModel = event.element else {
//                return
//            }
//            print(targetModel)
//        }.addDisposableTo(self.rx_disposeBag)
//    }
}
