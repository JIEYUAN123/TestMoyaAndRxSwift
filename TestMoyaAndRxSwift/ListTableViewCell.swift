//
//  ListTableViewCell.swift
//  TestMoyaAndRxSwift
//
//  Created by YJ on 2017/4/24.
//  Copyright © 2017年 YJ. All rights reserved.
//

import UIKit


class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
