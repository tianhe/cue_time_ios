//
//  JHGoingTableViewCell.swift
//  CueTime
//
//  Created by Tian He on 9/30/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

import Foundation
import UIKit

class JHGoingTableViewCell: UITableViewCell {
    weak var button: UIButton!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    @objc func updateWithGame(game: JHGame, attendance: JHAttendance) {
        for subView in self.contentView.subviews {
            subView.removeFromSuperview()
        }
        
        var contentView = UIView(frame: CGRectMake(0, 5, 350, 90))
        
        var timeStrip = UIView(frame:CGRectMake(0, 0, 350, 40))
        timeStrip.backgroundColor = UIColor.primaryPink();
        
        var date = UILabel(frame:CGRectMake(150, 0, 200, 40))
        var startDateFormatter = NSDateFormatter()
        startDateFormatter.dateFormat = "MMM. d"
        date.text = startDateFormatter.stringFromDate(game.startTime)
        date.font = UIFont.systemFontOfSize(14);
        date.textColor = UIColor.primaryBlue();
        timeStrip.addSubview(date);
        
        contentView.addSubview(timeStrip)
        
        
        var size = UILabel(frame:CGRectMake(160, 0, 200, 20))
        size.text = game.size.stringValue
        size.font = UIFont.systemFontOfSize(14)
        contentView.addSubview(size)
        
        
        var title = UILabel(frame:CGRectMake(100, 0, 200, 20))
        title.text = game.title
        title.font = UIFont.systemFontOfSize(14)
        contentView.addSubview(title)

        
        var activity = UILabel(frame: CGRectMake(30, 0, 50, 20))
        activity.text = game.activityName
        activity.font = UIFont.systemFontOfSize(14)
        contentView.addSubview(activity)
        
        var neighborhood = UILabel(frame:CGRectMake(30, 40, 250, 20))
        neighborhood.text = game.neighborhood
        neighborhood.font = UIFont.systemFontOfSize(14)
        contentView.addSubview(neighborhood)
        
        var experienceLevel = UILabel(frame:CGRectMake(30, 60, 200, 20))
        experienceLevel.text = game.experienceLevel
        experienceLevel.font = UIFont.systemFontOfSize(14)
        contentView.addSubview(experienceLevel)
        
        var attendees = UILabel(frame:CGRectMake(130, 60, 200, 20))
        
        var attendanceIds = "";
        for attendance in game.attendances{
            attendanceIds += "\(attendance.userId) "
        }
        
        attendees.text = attendanceIds;
        attendees.font = UIFont.systemFontOfSize(14)
        contentView.addSubview(attendees)
        
        if(attendance.status != "canceled" && attendance.status != "completed") {
            self.button = UIButton(frame:CGRectMake(250, 40, 20, 20))
            self.button.setTitle("C", forState: UIControlState.Normal)
            self.button.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
            self.button.tag = Int(attendance.id)
            contentView.addSubview(self.button)
        }
        
        self.contentView.addSubview(contentView);
        
        
    }
}