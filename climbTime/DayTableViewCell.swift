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
    private var signedUp : Bool = false
    private var meSelf : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func addImage() {
        var selfi = UIImage(named: "thumb.jpeg")
        meSelf = UIImageView(image: selfi)
        meSelf.frame = CGRect(x: self.frame.size.width - 70, y: 75 / 2 - 25, width: 50.0, height: 50.0)
        meSelf.layer.cornerRadius = 25
        meSelf.layer.borderWidth = 1
        meSelf.layer.masksToBounds = true
        self.contentView.addSubview(meSelf);
        
        
    }
    
    private func removeImage() {
        meSelf.removeFromSuperview()
    }
    
    func removeMe() {
        signedUp = false
        
        removeImage()
        }
    
    func signUp() {
        signedUp = true
        
        addImage()
    }
    
    func isSignedUp() -> Bool {
        return signedUp
    }
    

}
