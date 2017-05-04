//
//  ListViewController.swift
//  TestMoyaAndRxSwift
//
//  Created by YJ on 2017/4/24.
//  Copyright © 2017年 YJ. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import Kingfisher
import RxCocoa
import RxDataSources

class ListViewController: UIViewController {
    let provider = RxMoyaProvider<IHNetwork>()
    let disposeBag = DisposeBag()
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String,storyModel>>()
    let dataArray = Variable([SectionModel<String, storyModel>]())
    lazy var tableView : UITableView = {
        var tb = UITableView(frame: self.view.bounds, style: UITableViewStyle.grouped)
        return tb
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        loadData()
        tableView.register(UINib.init(nibName: "ListTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ListTableViewCell")
        dataSource.configureCell = {(dataSource, tv, indexPath, model) in
            let cell = tv.dequeueReusableCell(withIdentifier: "ListTableViewCell") as! ListTableViewCell
            cell.contentLabel.text = model.title
            tv.rowHeight = 90
            guard let imageURL = model.images?.first else {
                cell.contentImageView.kf.setImage(with: URL.init(string: ""))
                return cell
            }
            cell.contentImageView.kf.setImage(with: URL.init(string: imageURL))
            return cell
        }
        dataArray.asObservable().bindTo(tableView.rx.items(dataSource: dataSource)).addDisposableTo(disposeBag)
        tableView.delegate = self
    }
    
    

}
extension ListViewController {
    func loadData() {
//        provider.request(.getNewsList).filterSuccessfulStatusCodes().mapJSONToObject(classType: listModel.self).subscribe(onNext: { model in
//            self.dataArray.value = [SectionModel(model:model.date!,items:model.stories!)]
//        }, onError:{ error in
//            print("123\(error)")
//        }).addDisposableTo(disposeBag)
        
//        IHNetWorkTool.sharedNetWorkTool.requestDataWithTarget(target: .getNewsList, classType: listModel.self).subscribe(onNext:{ model in
//            self.dataArray.value = [SectionModel(model:model.date!,items:model.stories!)]
//            print(model)
//        }, onError: {
//            error in print("123\(error)")
//        }).addDisposableTo(disposeBag)
        IHNetWorkTool.sharedNetWorkTool.getDataWithTarget(target: .getNewsList, classType: listModel.self, success: { (model) in
            self.dataArray.value = [SectionModel(model:model.date!,items:model.stories!)]
        }) { (error) in
            switch error {
            case .noInternet:
                print("无网络")
                break
            case .canNotParseJSON:
                print("无法解析")
                break
            default :
                print("未知错误")
                break
            }
        }
    }
}
extension ListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 38
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionLabel = UILabel(frame:CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 38))
        sectionLabel.backgroundColor = UIColor.blue
        sectionLabel.textColor = UIColor.white
        sectionLabel.font = UIFont.systemFont(ofSize: 15)
        sectionLabel.textAlignment = .center
        sectionLabel.text = "\(section)"
        return sectionLabel
    }
//    func tableview
}

