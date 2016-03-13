//
//  TweetsViewController.swift
//  Tweeter
//
//  Created by Julia Lau on 3/12/16.
//  Copyright © 2016 Julia Lau. All rights reserved.
//

import UIKit



class TweetsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var tweets: [Tweet]!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        TwitterClient.sharedInstance.homeTimeLine({(tweets: [Tweet]) -> () in
            self.tweets = tweets
            self.tableView.reloadData()
            for tweet in tweets{
                print(tweet.text)
            }
            }) { (error: NSError) -> () in
                print(error.localizedDescription)
        }
        
        // Do any additional setup after loading the view.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tweets != nil{
            return tweets!.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        //let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell!
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath: indexPath) as! TweetCell
    
        //let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        cell.tweet = tweets[indexPath.row]
        // cell.textLabel?.text = tweets?[indexPath.row]
        
        // let tweet = self.tableView.dataSource[indexPath.row] as! NSDictionary
        
        
        
        return cell
    }
    

    @IBAction func onLogoutButton(sender: AnyObject) {

        TwitterClient.sharedInstance.logout()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
