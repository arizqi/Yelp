//
//  FilterViewController.swift
//  Yelp
//
//  Created by Ashar Rizqi on 2/13/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit


protocol FilterViewDelegate : class {
    func onFiltersDone(controller: FilterViewController)
}

class FilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    weak var delegate:FilterViewDelegate?
    var csFilter = CustomFilter()

    var filterDict = [
        "Sort By": [
            "Best Match": 0,
            "Distance": 1,
            "Highest Rated":2,
            "key": "sort"
        ],
        "Popular": [
            "key": "deals_filter",
            "Offering a Deal": true,
        ],
        "Distance": [
            "key": "radius_filter",
            "Auto": "",
            "Walking (1 mile)": "1609"
        ],
        "Category": [
            "Seafood": "seafood",
            "Buffet": "buffets",
            "key": "category_filter"
        ]
    ]
    
    var params:NSMutableDictionary = [
        "sort": 0,
        "deals_filter": false,
        "radius_filter": "",
        "category_filter": "",
        "location": "San Francisco"
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.title = "Filters"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 196.0/255.0, green: 18.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
//        self.navigationItem.title = "Fislters"
//        self.navigationController?.bac?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Chalkduster", size: 20)!], forState: UIControlState.Normal)
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        
        let filter1 = self.csFilter.filters[indexPath.section] as Dictionary
        let option1 = filter1["options"]![indexPath.row]
        cell.textLabel?.text = option1["label"]! as String
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        let switchView = UISwitch(frame: CGRectZero)
        switchView.on = option1["selected"]! as Bool
        switchView.onTintColor = UIColor(red: 196.0/255.0, green: 18.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        switchView.addTarget(self, action: "handleSwitchValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
        cell.accessoryView = switchView
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.csFilter.filters.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let filter1 = self.csFilter.filters[section]
        let label = filter1["label"]! as String
        
        return label
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let filter = self.csFilter.filters![section]
        return filter["options"]!.count
    }
    

    
    func handleSwitchValueChanged(switchView: UISwitch) -> Void {
        let cell = switchView.superview as UITableViewCell
        if let indexPath = self.tableView.indexPathForCell(cell) {
            let filter:Dictionary = self.csFilter.filters[indexPath.section]
            let filterLabel = filter["label"] as NSString
            let option = filter["options"]![indexPath.row]
            println(option)
            
            let optionLabel = option["label"]! as NSString
            
            if switchView.on {
                let key = self.filterDict[filterLabel]!["key"]! as NSString
                let value = self.filterDict[filterLabel]![optionLabel]!
                self.params.setObject(value, forKey: key)
            }
            else{
                println("switchView is off")
            }
            println(params)
        }
    }
    
    @IBAction func onApplyButtonPressed(sender: AnyObject) {
        println("on aplly pressed")
        self.delegate?.onFiltersDone(self)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
