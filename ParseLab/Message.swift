//
//  Message.swift
//  ParseLab
//
//  Created by Phan, Ngan on 9/27/17.
//  Copyright © 2017 Phan, Ngan. All rights reserved.
//

import UIKit
import Parse

class Message: PFObject, PFSubclassing {
    // properties/fields must be declared here
    // @NSManaged to tell compiler these are dynamic properties
    // See https://stackoverflow.com/questions/31357564/what-does-nsmanaged-do
    @NSManaged var text: String?
    
    // returns the Parse name that should be used
    class func parseClassName() -> String {
        return "Message"
    }
}
