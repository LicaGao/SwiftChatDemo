//
//  MsgInTableViewCell.swift
//  SwiftChatXIBDemo
//
//  Created by 高鑫 on 2017/11/14.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class MsgInTableViewCell: UITableViewCell {
    @IBOutlet weak var inBubble: UIImageView!
    @IBOutlet weak var inLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        let capInsetsIn = UIEdgeInsets(top: 17, left: 35, bottom: 17, right: 17)
        let inImg = #imageLiteral(resourceName: "in").resizableImage(withCapInsets: capInsetsIn)
        inBubble.image = inImg
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
