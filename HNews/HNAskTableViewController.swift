//
//  HNAskTableViewController.swift
//  HNews
//
//  Created by Ariunjargal on 2/23/16.
//  Copyright © 2016 Ariunjargal. All rights reserved.
//

import UIKit
import SafariServices

class HNAskTableViewController: UITableViewController {

    var errorMessageLabel: UILabel!
    
    var someData:  HNData!
    
    var tableData: [HNData.story]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.registerNib(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.backgroundColor = UIColor(red:0.91, green:0.3, blue:0.24, alpha:1.0)
        self.refreshControl?.tintColor = UIColor.whiteColor()
        self.refreshControl?.addTarget(self, action: "reloadData", forControlEvents: UIControlEvents.ValueChanged)
        
        someData = HNData()
        
        self.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.tableData.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : NewsTableViewCell = tableView.dequeueReusableCellWithIdentifier("NewsCell") as! NewsTableViewCell
        
        cell.newsTitle.text = self.tableData[indexPath.row].title
        cell.newsLink.text = self.tableData[indexPath.row].url
        cell.newsInfo.text = "by \(self.tableData[indexPath.row].by!)"
        cell.newsScore.text = String(self.tableData[indexPath.row].score!)
        
        return cell
    }
    
    func reloadData(){
        someData.getData("askstories", storyLimit: 10) { data, error in
            self.tableData = data
            self.tableView.reloadData()
        }
        
        if (self.refreshControl != nil) {
            self.refreshControl?.endRefreshing()
            //self.showErrorMessage()
        }
    }
    
    func showErrorMessage() {
        errorMessageLabel = UILabel(frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height))
        errorMessageLabel.textColor = UIColor.blackColor()
        errorMessageLabel.textAlignment = .Center
        errorMessageLabel.font = UIFont.systemFontOfSize(17)
        errorMessageLabel.text = "Network error"
        self.tableView.backgroundView = errorMessageLabel
        self.tableView.separatorStyle = .None
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let url = NSURL(string: self.tableData[indexPath.row].url!) {
            let vc = SFSafariViewController(URL: url, entersReaderIfAvailable: true)
            presentViewController(vc, animated: true, completion: nil)
        }
    }
    
}
