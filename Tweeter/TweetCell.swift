//
//  TweetCell.swift
//  Tweeter
//
//  Created by Julia Lau on 3/12/16.
//  Copyright © 2016 Julia Lau. All rights reserved.
//

import UIKit

protocol CellDelegate {
    func userMentionClicked(username: String)
}


class TweetCell: UITableViewCell {

    @IBOutlet weak var pictureLabel: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var timestamp: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var favoriteCountLabel: UILabel!
    var id: String = ""
    
    var tweet: Tweet!
        {
        didSet{
            id = tweet.number
            nameLabel.text = tweet.user?.name as? String
            bodyLabel.text = tweet.text
            favoriteCountLabel.text = String(tweet.favoriteCount)
            retweetCountLabel.text = String(tweet.retweetCount)
            pictureLabel.setImageWithURL((tweet.user?.profileUrl)!)
            timestamp.text = tweet?.getTimeDifference()
        }
    }
    
   /* @IBAction func onRetweet(sender: AnyObject) {
        TwitterClient.sharedInstance.Retweet(Int(id)!, params: nil, completion: {(error) -> () in
            self.retweetButton.setImage(UIImage(named: "retweet"), forState: UIControlState.Normal)
            self.retweetCountLabel.text = String(self.tweet.retweetCount + 1)
        })
    }
    
    @IBAction func onFavorite(sender: AnyObject) {
        TwitterClient.sharedInstance.Favorite(Int(id)!, params: nil, completion: {(error) -> () in
            self.favoriteButton.setImage(UIImage(named: "favorite"), forState: UIControlState.Normal)
            self.favoriteCountLabel.text = String(self.tweet.favoriteCount + 1)
        })
        

    }
    
    */
    
    
    
    
   
    /*
    var retweeted: Bool!
    var favorited: Bool!
   // var media_url: NSURL?
    var delegate: CellDelegate?
    var tweet: Tweet! {
        didSet {
            nameLabel.text = tweet?.user?.name as! String
            timestamp.text = tweet?.getTimeDifference()
            //handleLabel.text = "@\(tweet!.user!.screenName!)"
            bodyLabel.text = tweet?.text
            
            //let profile_picture_url = NSURL(string: (tweet.user?.profileImageUrl!)!)
            //pictureLabel.setImageWithURL(profile_picture_url!)
            //pictureLabel.layer.cornerRadius = 10.0
            //pictureLabel.clipsToBounds = true
            if tweet.favoriteCount > 10 {
                favoriteCountLabel.hidden = false
                favoriteCountLabel.text = "\(tweet.favoriteCount!)"
            }
            else {
                favoriteCountLabel.hidden = true
            }
            if tweet.retweetCount > 5 {
                retweetCountLabel.hidden = false
                retweetCountLabel.text = "\(tweet.retweetCount!)"
            }
            else {
                retweetCountLabel.hidden = true
            }
            retweeted = tweet.retweeted
            favorited = tweet.favorited
            
            bodyLabel.handleMentionTap { userHandle in
                self.delegate?.userMentionClicked(userHandle)
            }
            bodyLabel.handleURLTap { url in
                print(url)
                UIApplication.sharedApplication().openURL(url)
            }
            setButtons()

        }

    }
    */
        override func awakeFromNib() {
        super.awakeFromNib()
        }
        
        override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        }
}
