//
//  MsgDetailTableViewCell.swift
//  SwiftChatDemo
//
//  Created by 高鑫 on 2017/11/13.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit
import SnapKit

class MsgDetailTableViewCell: UITableViewCell {
    
    var bubbleOutImgView = UIImageView()
    var msgOutLabel = UILabel()
    var bubbleInImgView = UIImageView()
    var msgInLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "msgCell")
        self.backgroundColor = UIColor.groupTableViewBackground
        bubbleOutImgView.image = bubbleImage.outImg
        bubbleOutImgView.isUserInteractionEnabled = true
        self.addSubview(bubbleOutImgView)
        msgOutLabel = UILabel(frame: .zero)
        msgOutLabel.textColor = UIColor.white
        msgOutLabel.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        msgOutLabel.isUserInteractionEnabled = false
        msgOutLabel.numberOfLines = 0
        bubbleOutImgView.addSubview(msgOutLabel)
        selectionStyle = .none
        
        bubbleOutImgView.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(-10)
            make.top.equalTo(self.contentView.snp.top).offset(5)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-5)
            make.width.equalTo(msgOutLabel.snp.width).offset(30)
        }
        msgOutLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(bubbleOutImgView.snp.centerX).offset(-5)
            make.centerY.equalTo(bubbleOutImgView.snp.centerY)
            make.width.lessThanOrEqualTo(220)
            make.height.equalTo(bubbleOutImgView.snp.height).offset(-15)
        }
        
        bubbleInImgView.image = bubbleImage.inImg
        bubbleInImgView.isUserInteractionEnabled = true
        self.addSubview(bubbleInImgView)
        msgInLabel = UILabel(frame: .zero)
        msgInLabel.textColor = UIColor.darkGray
        msgInLabel.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        msgInLabel.isUserInteractionEnabled = false
        msgInLabel.numberOfLines = 0
        bubbleInImgView.addSubview(msgInLabel)
        selectionStyle = .none
        
        bubbleInImgView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left).offset(10)
            make.top.equalTo(self.contentView.snp.top).offset(5)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-5)
            make.width.equalTo(msgInLabel.snp.width).offset(30)
        }
        msgInLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(bubbleInImgView.snp.centerX).offset(5)
            make.centerY.equalTo(bubbleInImgView.snp.centerY)
            make.width.lessThanOrEqualTo(220)
            make.height.equalTo(bubbleInImgView.snp.height).offset(-15)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

let bubbleImage = bubbleImageMake()

func bubbleImageMake() -> (inImg: UIImage, outImg: UIImage) {
    let capInsetsOut = UIEdgeInsets(top: 17, left: 27, bottom: 17.5, right: 27)
    let capInsetsIn = UIEdgeInsets(top: 17, left: 27, bottom: 17.5, right: 27)
    let outImg = #imageLiteral(resourceName: "out").resizableImage(withCapInsets: capInsetsOut)
    let inImg = #imageLiteral(resourceName: "in").resizableImage(withCapInsets: capInsetsIn)
    return (inImg, outImg)
}
