//
//  FilterCell.swift
//  Yelp
//
//  Created by Ashar Rizqi on 2/15/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

protocol FilterCellDelegate : class {
    func filterView(filterCell: FilterCell, didChangeSwitchValue value : Bool)
}

class FilterCell: UITableViewCell {
    weak var delegate: FilterCellDelegate?
    @IBOutlet weak var filterLabel: UILabel!
    @IBOutlet weak var filterSwitch: UISwitch!
    

    @IBAction func switchChanged(sender: AnyObject) {
        println("changed")
        delegate?.filterView(self, didChangeSwitchValue: filterSwitch.on)
    }
}
