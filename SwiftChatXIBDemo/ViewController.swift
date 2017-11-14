//
//  ViewController.swift
//  SwiftChatXIBDemo
//
//  Created by 高鑫 on 2017/11/14.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextViewDelegate {
    let w = UIScreen.main.bounds.size.width
    let h = UIScreen.main.bounds.size.height
    let msgs = Msg.msgs
    let formatter = DateFormatter()
    var tableView = UITableView()
    
    @IBOutlet weak var sendView: UIView!
    @IBOutlet weak var sendTextView: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = CGRect(x: 0, y: 0, width: w, height: h - 114)
        tableView.backgroundColor = UIColor.groupTableViewBackground
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
        let timeNib = UINib(nibName: "MsgTimeTableViewCell", bundle: nil)
        let outNib = UINib(nibName: "MsgOutTableViewCell", bundle: nil)
        let inNib = UINib(nibName: "MsgInTableViewCell", bundle: nil)
        tableView.register(timeNib, forCellReuseIdentifier: "timeCell")
        tableView.register(outNib, forCellReuseIdentifier: "outCell")
        tableView.register(inNib, forCellReuseIdentifier: "inCell")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKB(tapGesture:)))
        tableView.addGestureRecognizer(tapGesture)
        self.view.addSubview(tableView)
        sendTextView.layer.cornerRadius = 7.5
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
    
    @objc func keybordShow(notification:Notification)  {
        let userinfo: NSDictionary = notification.userInfo! as NSDictionary
        let nsValue = userinfo.object(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRec = nsValue.cgRectValue
        let height = keyboardRec.size.height
        UIView.animate(withDuration: 0.3, animations: {
            self.sendView.frame = self.sendView.frame.offsetBy(dx: 0, dy: -height)
            self.tableView.frame.size = CGSize(width: self.w, height: self.h - 114 - height)
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
            self.tableView.frame.size = CGSize(width: self.w, height: self.h - 114)
            self.tableView.reloadData()
        }) { (_) in
            
        }
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
            timeCell.timeLabel.text = formatter.string(from: msgs[indexPath.section][0].date as Date)
            return timeCell
        } else {
            let msg = msgs[indexPath.section][indexPath.row - 1]
            if msg.isIn == true {
                let inCell = tableView.dequeueReusableCell(withIdentifier: "inCell", for: indexPath) as! MsgInTableViewCell
                inCell.inLabel.text = msg.text
                return inCell
            } else {
                let outCell = tableView.dequeueReusableCell(withIdentifier: "outCell", for: indexPath) as! MsgOutTableViewCell
                outCell.outLabel.text = msg.text
                return outCell
            }
        }
    }

}

