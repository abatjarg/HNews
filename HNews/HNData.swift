//
//  HNData.swift
//  HNews
//
//  Created by Ariunjargal on 2/24/16.
//  Copyright © 2016 Ariunjargal. All rights reserved.
//

import UIKit
import Firebase

class HNData {
    
    let firebase: Firebase!
    
    var stories: [story]! = []
    
    init() {
        firebase = Firebase(url: "https://hacker-news.firebaseio.com/v0/")
    }
    
    struct story {
        let title : String?
        let url   : String?
        let by    : String?
        let score : Int?
    }
    
    func queryData(storyType: String, storyLimit: Int, completionHandler: ([story]?, NSError?) -> ()) -> () {
        
        let query = firebase.childByAppendingPath(storyType).queryLimitedToFirst(10)
        
        query.observeSingleEventOfType(.Value, withBlock: { snapshot in
            let storyIds = snapshot.value as! [Int]
            var items = [story]()
            for storyId in storyIds {
                let query = self.firebase.childByAppendingPath("item").childByAppendingPath(String(storyId))
                query.observeSingleEventOfType(.Value, withBlock: { (snapshot) in
                    let queriedStory = story(title: snapshot.value["title"] as? String, url: snapshot.value["url"] as? String, by: snapshot.value["by"] as? String, score: snapshot.value["score"] as? Int)
                    items.append(queriedStory)
                    if items.count == 10 {
                        self.stories = items
                        completionHandler(self.stories, nil)
                    }
                }, withCancelBlock: { error in
                    print("\(error.description)")
                    completionHandler(nil, error)
                    
            })
            }
            }, withCancelBlock: { error in
                print("\(error.description)")
                completionHandler(nil, error)
                
        })
    }
    
    func getData(storyType: String, storyLimit: Int, completionHandler: ([story]?, NSError?) -> ()) -> () {
        queryData(storyType, storyLimit: storyLimit, completionHandler: completionHandler)
    }

}
