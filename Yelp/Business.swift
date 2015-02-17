//
//  File.swift
//  Yelp
//
//  Created by Ashar Rizqi on 2/11/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import Foundation
import CoreLocation

class Business {
    var dict:NSDictionary!
    
    init(dict: NSDictionary) {
        self.dict = dict
    }
    
    var businessName:NSString {
        get {
            return self.dict["name"] as String
        }
    }
    
    var imageUrl:NSURL! {
        get {
            var image = self.dict["image_url"] as NSString
            return NSURL(string: image)
        }
    }
    
    var ratingImageURL: NSURL {
        get {
            return NSURL(string: self.dict["rating_img_url_large"] as String)!
        }
    }
    
    var reviewCount: Int {
        get {
            return self.dict["review_count"] as Int
        }
    }
    
    var displayCategories: String {
        get {
            if let categories = self.dict["categories"] as? Array<Array<String>> {
                return ", ".join(categories.map({ $0[0] }))
            }
            return ""
        }
    }
    
    var latitude: Double? {
        get {
            if let location = self.dict["location"] as? NSDictionary {
                if let coordinate = location["coordinate"] as? NSDictionary {
                    return (coordinate["latitude"] as Double)
                }
            }
            return nil
        }
    }
    
    var longitude: Double? {
        get {
            if let location = self.dict["location"] as? NSDictionary {
                if let coordinate = location["coordinate"] as? NSDictionary {
                    return (coordinate["longitude"] as Double)
                }
            }
            return nil
        }
    }
    
    var location: CLLocation {
        get {
            return CLLocation(latitude: self.latitude!, longitude: self.longitude!)
        }
    }
    
    var businessAddress: String {
        get {
            if let location = self.dict["location"] as? NSDictionary {
                if let address = location["address"] as? Array<String> {
                    if let neighborhoods = location["neighborhoods"] as? Array<String> {
                        return ", ".join(address + [neighborhoods[0]])
                    }
                    return ", ".join(address)
                }
            }
            return ""
        }
    }
}
