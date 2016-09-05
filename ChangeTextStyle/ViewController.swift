//
//  ViewController.swift
//  ChangeTextStyle
//
//  Created by 张建军 on 16/9/5.
//  Copyright © 2016年 张建军. All rights reserved.
//

import UIKit
//  遵循协议
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //获取屏幕的宽、高
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    
    
    // 初始化数据源
    var data = ["测试demo", "swift编程语言", "遵循协议的方式改变了", "协议中的方法必须实现", "swift中的可选链", "swift is beautiful language"]
    
    // 初始化字体类型
    var fontName = ["PingFangSC-Medium",
                    "EuphemiaUCAS-Italic",
                    "EuphemiaUCAS"]
    
    var fontRowIndex = 0
    
    
    let changeFontButton = UIButton(type: .Custom)
    let fontTableView = UITableView()
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        self.automaticallyAdjustsScrollViewInsets = false
        
        fontTableView.scrollEnabled = false
        
        self.title = "Change Text Font"
        
        for faminly in UIFont.familyNames() {
            
            for font in UIFont.fontNamesForFamilyName(faminly) {
                
                // 可以打印font 获取系统的字体样式
                print(font)
                
            }
        }
         self.creatTableView()
        
         self.creatButton()
    
    }
    
    
    func creatTableView() {
        
        fontTableView.delegate = self
        fontTableView.dataSource = self
        
        fontTableView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT/2)
        
      self.view.addSubview(fontTableView)
        
    }

    
    
    func creatButton() {
        
        changeFontButton.frame = CGRectMake(140, 500, 100, 100)
        changeFontButton.backgroundColor = UIColor.grayColor()
        changeFontButton.layer.cornerRadius = 50
        changeFontButton.addTarget(self, action: #selector(ViewController.tap), forControlEvents: .TouchUpInside)
        
        changeFontButton.setTitle("更改样式", forState: .Normal)
        self.view.addSubview(changeFontButton)

    }
    
    
    func tap()  {
        
        fontRowIndex = (fontRowIndex + 1)%3
        fontTableView.reloadData()
        
    }
    
// tableView的代理方法
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = UITableViewCell()
        
        cell.selectionStyle = .None
        
        let text = data[indexPath.row]
        
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.blueColor()
        cell.textLabel?.font = UIFont(name: fontName[fontRowIndex], size: 17)
        return cell
        

    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 50
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

