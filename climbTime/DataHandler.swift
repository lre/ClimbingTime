//
//  DataHandler.swift
//  climbTime
//
//  Created by Lasse Reedtz on 27/09/14.
//  Copyright (c) 2014 LasseInc. All rights reserved.
//

import Foundation

protocol DatahandlerDelegate {
    var selfie : String {get set}
    func dataAvalible(atendMap : [String : Array<String>], mydata : NSMutableSet)
    func loginRequired()
}

class Datahandler: NSObject{
    
    var delegate : DatahandlerDelegate!
    
    func getdata() {
        
        var mysert = NSMutableSet()
        mysert.addObject("Sep 28." )
        self.delegate?.selfie = "thumb.jpeg"
        self.delegate?.dataAvalible( ["Sep 28." : [ "d.png", "r.jpg"], "Sep 29." : [ "d.png", "r.jpg"]], mydata: mysert)
    }
    
    
}



