//
//  ViewController.swift
//  RNEmbed
//
//  Created by Jason on 16/7/28.
//  Copyright © 2016年 hicto.com. All rights reserved.
//

import UIKit
import React
import CodePush

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goToRNP1(sender: UIButton) {
        initRNP1()
    }

    @IBAction func goToRNP2(sender: UIButton) {
        initRNP2()
    }
    
    func initRNP1 () {
        let jsCodeLocation = NSURL(string: "http://localhost:9988/RNiOS/RNPage1/index.ios.bundle?platform=ios&dev=true&minify=false")
        let bridge = RCTBridge(bundleURL: jsCodeLocation,
                               moduleProvider: nil,
                               launchOptions: nil)
        
        let rootView = RCTRootView(bridge: bridge, moduleName: "RNPF", initialProperties: nil)
        let vc = UIViewController()
        rootView.frame = CGRectMake(0, 0, CGRectGetWidth(UIScreen.mainScreen().bounds), CGRectGetHeight(UIScreen.mainScreen().bounds))
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.tintColor = UIColor.blueColor()

        vc.view.addSubview(rootView)
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func initRNP2 () {
//        let jsCodeLocation = NSURL(string: "http://localhost:9988/RNiOS/RNPage2/index.ios.bundle?platform=ios&dev=true&minify=false")

        let jsCodeLocation = CodePush.bundleURLForResource("main", withExtension: "jsbundle")
        let bridge = RCTBridge(bundleURL: jsCodeLocation,
                               moduleProvider: nil,
                               launchOptions: nil)
        
        let rootView = RCTRootView(bridge: bridge, moduleName: "RNPS", initialProperties: nil)
        
        let vc = UIViewController()
        vc.view = rootView
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.tintColor = UIColor.blueColor()
        self.navigationController?.pushViewController(vc, animated: false)
    }
}

