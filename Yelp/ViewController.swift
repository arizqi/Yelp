//
//  ViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 9/19/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, FilterViewDelegate {
    
    var results: Array<Business> = []
    var searchBar: UISearchBar!
    
    var latitude: Double = 37.4118220
    var longitude: Double = -121.9411250
    
    @IBOutlet weak var tableView: UITableView!
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 196.0/255.0, green: 18.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        
        self.searchBar = UISearchBar()
        self.searchBar.delegate = self
        self.searchBar.placeholder = "e.g. sushi, cheeseburger"
        self.searchBar.text = "Thai"
        self.navigationItem.titleView = self.searchBar

        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 116
        
        self.search("Thai")
        
        var backButton:UIButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        backButton.addTarget(self, action: "onFilterButton", forControlEvents: UIControlEvents.TouchUpInside)
        backButton.setTitle("Filter", forState: UIControlState.Normal)
        backButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        backButton.sizeToFit()
        var customBackButtonItem:UIBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem  = customBackButtonItem
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("businessCell") as BusinessCell
        var business = self.results[indexPath.row]
        cell.nameLabel.text = "\(indexPath.row + 1). \(business.businessName)"
        
        let reviewCount = business.reviewCount
        if (reviewCount == 1) {
            cell.reviewLabel.text = "\(reviewCount) review"
        } else {
            cell.reviewLabel.text = "\(reviewCount) reviews"
        }
        
        var myLocation: CLLocation = CLLocation(latitude: self.latitude, longitude: self.longitude)
        let distance = business.location.distanceFromLocation(myLocation)
        cell.distanceLabel.text = String(format: "%.1f mi", distance / 1609.344)
        cell.previewImage.setImageWithURL(business.imageUrl)
        cell.reviewImage.setImageWithURL(business.ratingImageURL)
        cell.categoryLabel.text = business.displayCategories
        cell.addressLabel.text = business.businessAddress
        
        return cell
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results.count
    }
    
    final func onFiltersDone(controller: FilterViewController) {
        println("applying filters")
        let paramsDict = controller.params as NSMutableDictionary
        let radius_filter = controller.params["radius_filter"]! as NSString
        if radius_filter == "" {
            paramsDict.removeObjectForKey("radius_filter")
        }
        println(paramsDict)
        self.searchWithParams(controller.params)
    }

    
    func onFilterButton() {
        performSegueWithIdentifier("filterSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "filterSegue" {
            var fvc = segue.destinationViewController as FilterViewController
            fvc.delegate = self
            fvc.params.setObject(self.searchBar.text, forKey: "term")
                println("yes its a fvcontroller")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func searchClicked(sender: UIButton) {
        self.search(self.searchBar.text)
    }
    
    func search(searchTerm: String){
        var mbh: MBProgressHUD = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        mbh.labelText = "Searching"
        
        var client: YelpClient!
        
        // You can register for Yelp API keys here: http://www.yelp.com/developers/manage_api_keys
        let yelpConsumerKey = "vxKwwcR_NMQ7WaEiQBK_CA"
        let yelpConsumerSecret = "33QCvh5bIF5jIHR5klQr7RtBDhQ"
        let yelpToken = "uRcRswHFYa1VkDrGV6LAW2F8clGh5JHV"
        let yelpTokenSecret = "mqtKIxMIR4iBtBPZCmCLEb-Dz3Y"
        
        client = YelpClient(consumerKey: yelpConsumerKey, consumerSecret: yelpConsumerSecret, accessToken: yelpToken, accessSecret: yelpTokenSecret)
        
        client.searchWithTerm(searchTerm, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            println(response)
            let results = (response["businesses"] as Array).map({
                (business: NSDictionary) -> Business in
                return Business(dict: business)
            })
            self.results = results
            self.tableView.reloadData()
            mbh.hide(true)
                        println(self.results)
            }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
        }
        
    }
    
    func searchWithParams(params:NSMutableDictionary){
        var mbh: MBProgressHUD = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        mbh.labelText = "Searching"
        
        var client: YelpClient!
        
        // You can register for Yelp API keys here: http://www.yelp.com/developers/manage_api_keys
        let yelpConsumerKey = "vxKwwcR_NMQ7WaEiQBK_CA"
        let yelpConsumerSecret = "33QCvh5bIF5jIHR5klQr7RtBDhQ"
        let yelpToken = "uRcRswHFYa1VkDrGV6LAW2F8clGh5JHV"
        let yelpTokenSecret = "mqtKIxMIR4iBtBPZCmCLEb-Dz3Y"
        
        client = YelpClient(consumerKey: yelpConsumerKey, consumerSecret: yelpConsumerSecret, accessToken: yelpToken, accessSecret: yelpTokenSecret)
        
        client.searchWithParameters(params, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            println(response)
            let results = (response["businesses"] as Array).map({
                (business: NSDictionary) -> Business in
                return Business(dict: business)
            })
            self.results = results
            self.tableView.reloadData()
            mbh.hide(true)
            println(self.results)
            }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
        }
        
    }
    
}

