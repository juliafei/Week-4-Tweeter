//
//  Tweet.swift
//  Tweeter
//
//  Created by Julia Lau on 3/12/16.
//  Copyright © 2016 Julia Lau. All rights reserved.
//

import UIKit

class Tweet: NSObject {

    var createdAt: NSDate?
    var user: User?
    var text: String?
    var timestamp: NSDate?
    var timeString: String?
    var number: String
    var retweetCount: Int = 0
    var favoriteCount: Int = 0
    
    init (dictionary: NSDictionary)
    {
        text = dictionary["text"] as? String
        retweetCount = (dictionary ["retweet_count"] as? Int) ?? 0
        favoriteCount = (dictionary ["favorite_count"] as? Int) ?? 0
        number = String(dictionary["id"]!)
        user = User(dictionary: dictionary ["user"] as! NSDictionary)
        
        timeString = dictionary["created_at"] as? String
        if let timestampString = timeString{
            let formatter = NSDateFormatter()
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            timestamp = formatter.dateFromString(timestampString)
            
        }
    }
    
    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet]{
        var tweets = [Tweet]()
        
        
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            
            tweets.append(tweet)
        }
        return tweets
    }
    
  



}

