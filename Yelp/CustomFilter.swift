//
//  CustomFilter.swift
//  Yelp
//
//  Created by Ashar Rizqi on 2/16/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import Foundation

class CustomFilter {
    var filters:Array<Dictionary<String, AnyObject>>!
    
    init(){
        filters = [
            [
                "label": "Sort By",
                "name": "sort",
                "options": [
                    [
                        "label": "Best Match",
                        "value": "0",
                        "selected": true
                    ],
                    [
                        "label": "Distance",
                        "value": "1",
                        "selected": false
                    ],
                    [
                        "label": "Highest Rated",
                        "value": "2",
                        "selected": false
                    ],
                ]
            ],
            
            [
                "label": "Popular",
                "type": "Default",
                "options": [
                    [
                        "label": "Offering a Deal",
                        "value": "1",
                        "selected": false
                    ],
                ],
            ],
            
            [
                "label": "Distance",
                "name": "radius_filter",
                "options": [
                    [
                        "label": "Auto",
                        "value": "",
                        "selected": true
                    ],
                    [
                        "label": "Walking (1 mile)",
                        "value": "1609",
                        "selected": false
                    ],
                ]
            ],
            [
                "label": "Category",
                "name": "category",
                "options": [
                    [
                        "label": "Seafood",
                        "value": "0",
                        "selected": false
                    ],
                    [
                        "label": "Buffet",
                        "value": "1",
                        "selected": false
                    ],
                ]
            ]
        ]
        
    }
    
}
