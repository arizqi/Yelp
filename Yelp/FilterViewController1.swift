////
////  FilterViewController.swift
////  Yelp
////
////  Created by Ashar Rizqi on 2/13/15.
////  Copyright (c) 2015 Timothy Lee. All rights reserved.
////
//
//import UIKit
//
//
//protocol FiltersViewDelegate1 : class {
//    func onFiltersDone(controller: FilterViewController)
//}
//
//class FilterViewController1: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    
////    weak var delegate:FilterViewControllerDelegate?
//    
//    weak var delegate:FiltersViewDelegate?
//    var filter:Filters?
//    
//    @IBOutlet weak var tableView: UITableView!
//    
//    override func viewDidLoad() {
//        self.tableView.rowHeight = UITableViewAutomaticDimension
//        self.filter = Filters()
//        super.viewDidLoad()
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//    }
//    
////    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
////        return self.filter?.filters.count
////    }
//    
//    
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let filt = filter?.filtersArray[section] as Dictionary
//        return 0
////            return filt["choices"].count
////            return 0
////        let filt = self.filter.filtersArray[section] as Dictionary
////        return filt[]
//    }
//    
//    
//    
//}
//
//
////    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
////        let cell = tableView.dequeueReusableCellWithIdentifier("FilterCell") as FilterCell
////        cell.delegate = self
////        if let value = filters[indexPath.row]
////        {
////            cell.filterSwitch.on = value
////        }
////        else
////        {
////            cell.filterSwitch.on = true        }
////
////        return cell
////    }
////
////    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return 40
////    }
////
////    func filterView(filterCell: FilterCell, didChangeSwitchValue value: Bool) {
////        println("hello")
////        let indexPath = self.tableView.indexPathForCell(filterCell)!
////        filters[indexPath.row] = value
////    }
//
//
//
//
//
//
////        var applyButton:UIButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
////        applyButton.addTarget(self, action: "onApplyButton", forControlEvents: UIControlEvents.TouchUpInside)
////        applyButton.setTitle("Apply", forState: UIControlState.Normal)
////        applyButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
////        applyButton.sizeToFit()
////        var customApplyItem:UIBarButtonItem = UIBarButtonItem(customView: applyButton)
////        self.navigationItem.rightBarButtonItem  = UIBarButtonItem(title: "Apply", style: UIBarButtonItemStyle.Plain, target: self, action: "onApplyButton")
//    
////    func onApplyButton(){
////        println("apply button pressed")
////        var x:Bool
////        x = true
////        self.delegate?.filterViewController(self, didChangeFilters:self.filters)
////        navigationController?.popViewControllerAnimated(true)
////
////    }
//
