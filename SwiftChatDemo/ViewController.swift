//
//  ViewController.swift
//  SwiftChatDemo
//
//  Created by 高鑫 on 2017/11/12.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var sendView: UIView!
    @IBOutlet weak var sendTextView: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    
    var tableView = UITableView()
    let formatter = DateFormatter()
    let w = UIScreen.main.bounds.width
    let h = UIScreen.main.bounds.height
    let msgs = Msg.msgs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.frame = CGRect(x: 0, y: 0, width: w, height: h - 104)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.groupTableViewBackground
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(MsgTimeTableViewCell.self, forCellReuseIdentifier: "timeCell")
        tableView.register(MsgDetailTableViewCell.self, forCellReuseIdentifier: "msgCell")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKB(tapGesture:)))
        tableView.addGestureRecognizer(tapGesture)
        self.view.addSubview(tableView)
        
        sendTextView.layer.cornerRadius = 7.5
        sendTextView.textAlignment = .left
        NotificationCenter.default.addObserver(self, selector: #selector(keybordShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keybordHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func hideKB(tapGesture: UITapGestureRecognizer) {
        sendTextView.resignFirstResponder()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return msgs.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return msgs[section].count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let timeCell = tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath) as! MsgTimeTableViewCell
            formatter.dateFormat = "MM月dd日 EEEE HH:mm"
            formatter.locale = Locale(identifier: "zh_CN")
            let dateStr = formatter.string(from: msgs[indexPath.section][0].date as Date)
            timeCell.timeLable.text = dateStr
            return timeCell
            
        } else {
            let msgCell = tableView.dequeueReusableCell(withIdentifier: "msgCell", for: indexPath) as! MsgDetailTableViewCell
            let msg = msgs[indexPath.section][indexPath.row - 1]
            if msg.isIn == true {
                msgCell.msgInLabel.text = msg.text
                msgCell.bubbleOutImgView.isHidden = true
            } else {
                msgCell.msgOutLabel.text = msg.text
                msgCell.bubbleInImgView.isHidden = true
            }
            return msgCell
        }
    }
    
    @objc func keybordShow(notification:Notification)  {
        let userinfo: NSDictionary = notification.userInfo! as NSDictionary
        let nsValue = userinfo.object(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRec = nsValue.cgRectValue
        let height = keyboardRec.size.height
        UIView.animate(withDuration: 0.3, animations: {
            self.sendView.frame = self.sendView.frame.offsetBy(dx: 0, dy: -height)
            self.tableView.frame.size = CGSize(width: self.w, height: self.h - 104 - height)
            self.tableView.reloadData()
        }) { (_) in
            
        }
    }
    
    @objc func keybordHide(notification:Notification)  {
        let userinfo: NSDictionary = notification.userInfo! as NSDictionary
        let nsValue = userinfo.object(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRec = nsValue.cgRectValue
        let height = keyboardRec.size.height
        UIView.animate(withDuration: 0.3, animations: {
            self.sendView.frame = self.sendView.frame.offsetBy(dx: 0, dy: height)
            self.tableView.frame.size = CGSize(width: self.w, height: self.h - 104)
            self.tableView.reloadData()
        }) { (_) in
            
        }
    }
}

