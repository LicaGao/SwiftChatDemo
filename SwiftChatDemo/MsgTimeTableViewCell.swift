//
//  MsgTimeTableViewCell.swift
//  SwiftChatDemo
//
//  Created by 高鑫 on 2017/11/13.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit
import SnapKit

class MsgTimeTableViewCell: UITableViewCell {

    var timeLable = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "timeCell")
        selectionStyle = .none
        self.backgroundColor = UIColor.groupTableViewBackground
        timeLable.font = UIFont(name: "HelveticaNeue-Thin", size: 14)
        timeLable.textColor = UIColor.darkGray
        timeLable.textAlignment = .center
        self.addSubview(timeLable)
        timeLable.snp.makeConstraints { (make) in
            make.centerX.equalTo(UIScreen.main.bounds.size.width / 2)
            make.top.equalTo(self.contentView.snp.top).offset(10)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
