//
//  DayTableViewCell.swift
//  climbTime
//
//  Created by Lasse Reedtz on 18/09/14.
//  Copyright (c) 2014 LasseInc. All rights reserved.
//

import UIKit
import QuartzCore

class DayTableViewCell: UITableViewCell {
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var Day: UILabel!
    
    var signedUp : Bool = false
    private var meSelf : UIImageView!
    private var numberOfImages : Int = 1
    
    private var images : [UIImageView] = []
    
    var dateID : String!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func offset () -> CGFloat {
        return CGFloat(self.numberOfImages * 50.0 - 15 * (self.numberOfImages - 1))
    }
    
    func addMyImage(image : UIImage) {
        var selfi = image
        
        var x = self.frame.size.width - 40.0 - self.offset()
        meSelf = UIImageView(image: selfi)
        meSelf.frame = CGRect(x: x, y: 75 / 2 - 25, width: 50.0, height: 50.0)
        meSelf.layer.cornerRadius = 25
        meSelf.layer.borderWidth = 1
        meSelf.layer.masksToBounds = true
        self.contentView.addSubview(meSelf);
        
        
    }
    
    func clear(){
        self.removeMyImage()
        self.signedUp = false
        self.numberOfImages = 0
        
        for image in self.images {
            image.removeFromSuperview()
        }
        
        self.images = []
    }
    
    private func removeMyImage() {
        meSelf?.removeFromSuperview()
    }
    
    func removeMe() {
        signedUp = false
        removeMyImage()
    }
    
    func signUp(image : UIImage) {
        signedUp = true
        addMyImage(image)
    }
    
    func setDate(theDate : NSDate) {
        var dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "EEE MMM d."
        var dayString = dateFormatter.stringFromDate(theDate).componentsSeparatedByString(" ")
        
        self.Day.text = dayString[0]
        self.Date.text = "\(dayString[1]) \(dayString[2])"
        self.dateID = "\(dayString[1]) \(dayString[2])"

    }
    
    func isSignedUp() -> Bool {
        return signedUp
    }
    
    func addImage (image : UIImage) {
        
        var uImage = UIImageView(image: image)
        var x = self.frame.size.width - 40.0 - self.offset()
        uImage.frame = CGRect(x: x, y: 75 / 2 - 25, width: 50.0, height: 50.0)
        uImage.layer.cornerRadius = 25
        uImage.layer.borderWidth = 1
        uImage.layer.masksToBounds = true
        self.contentView.addSubview(uImage);
        self.images.append(uImage)
        self.numberOfImages += 1
    }
    

}
