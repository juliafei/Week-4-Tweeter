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
        //        let timestampString = dictionary["created _at"] as? String
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
    
    func getTimeDifference() -> String! {
            let elapsedTime = NSDate().timeIntervalSinceDate(createdAt!)
            let time_in_int = NSInteger(elapsedTime)
            let (year, month, day, hours, minutes, seconds)  = convertSeconds(time_in_int)
                if year > 1 {
                    return "\(year)y"
                }
                else if month > 1 {
                    return "\(month)m"
                }
                else if day > 1 {
                    return "\(day)d"
                }
                else if hours > 1 {
                    return "\(hours)h"
                }
                else if minutes > 1 {
                    return "\(minutes)m"
                }
                else {
                    return "\(seconds)s"
            }


}

    func convertSeconds (seconds : Int) -> (Int, Int, Int, Int, Int, Int) {
        return (seconds / 31557600, seconds / 2628000, seconds / (3600 * 24), seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
}







}

