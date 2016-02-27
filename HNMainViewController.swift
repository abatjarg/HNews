//
//  HNMainViewController.swift
//  HNews
//
//  Created by Ariunjargal on 2/22/16.
//  Copyright © 2016 Ariunjargal. All rights reserved.
//

import UIKit

class HNMainViewController: UIViewController {

    var pageMenu : CAPSPageMenu?
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // MARK: - UI Setup
        
        self.title = "HNews"
        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.91, green:0.3, blue:0.24, alpha:1.0)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        // MARK: - Scroll menu setup
        
        // Initialize view controllers to display and place in array
        var controllerArray : [UIViewController] = []
        
        let controller1 : HNTopTableViewController = HNTopTableViewController(nibName: "HNTopTableView", bundle: nil)
        controller1.title = "TOP"
        controllerArray.append(controller1)
        
        let controller2 : HNNewTableViewController = HNNewTableViewController(nibName: "HNNewTableView", bundle: nil)
        controller2.title = "NEW"
        controllerArray.append(controller2)
        
        let controller3 : HNAskTableViewController = HNAskTableViewController(nibName: "HNTopTableView", bundle: nil)
        controller3.title = "ASK"
        controllerArray.append(controller3)
        
        let controller4 : HNShowTableViewController = HNShowTableViewController(nibName: "HNNewTableView", bundle: nil)
        controller4.title = "SHOW"
        controllerArray.append(controller4)
        
        let controller5 : HNJobTableViewController = HNJobTableViewController(nibName: "HNNewTableView", bundle: nil)
        controller5.title = "JOB"
        controllerArray.append(controller5)
        
        // Customize menu (Optional)
        let parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor.whiteColor()),
            .ViewBackgroundColor(UIColor.whiteColor()),
            .SelectionIndicatorColor(UIColor(red:0.91, green:0.3, blue:0.24, alpha:1.0)),
            .BottomMenuHairlineColor(UIColor(red:0.91, green:0.3, blue:0.24, alpha:1.0)),
            .MenuItemFont(UIFont(name: "HelveticaNeue", size: 12.0)!),
            .SelectedMenuItemLabelColor(UIColor.blackColor()),
            .UnselectedMenuItemLabelColor(UIColor.blackColor()),
            .MenuHeight(40.0),
            .MenuItemWidth(50.0),
            .CenterMenuItems(true)
        ]
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        
        pageMenu!.didMoveToParentViewController(self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Container View Controller
    override func shouldAutomaticallyForwardAppearanceMethods() -> Bool {
        return true
    }
    
    override func shouldAutomaticallyForwardRotationMethods() -> Bool {
        return true
    }

}
