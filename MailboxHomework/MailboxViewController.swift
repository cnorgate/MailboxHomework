//
//  MailboxViewController.swift
//  MailboxHomework
//
//  Created by Cameron Norgate on 10/2/15.
//  Copyright © 2015 Cameron Norgate. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var helpLabel: UIImageView!
    
    @IBOutlet weak var nav: UIImageView!
    
    @IBOutlet weak var message: UIImageView!
    var messageOriginalCenter: CGPoint!
    
    
    @IBOutlet weak var feed: UIImageView!
    
    @IBOutlet weak var search: UIImageView!
    
    @IBOutlet weak var laterIcon: UIImageView!
    var laterOriginalCenter: CGPoint!
    
    @IBOutlet weak var archiveIcon: UIImageView!
    var archiveOriginalCenter: CGPoint!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var backgroundView: UIImageView!
    
    @IBOutlet weak var reschedule: UIImageView!
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //scrollView.contentSize = CGSize(width: 320, height: 1000)
        scrollView.contentSize = CGSize(width: 320, height: message.center.y + feed.center.y + 560)
        
        backgroundView.backgroundColor = UIColor.grayColor()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPanMessage(sender: UIPanGestureRecognizer) {
        
        var point = sender.locationInView(view)
        var velocity = sender.velocityInView(view)
        var translation = sender.translationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            print("Gesture began at: \(point)")
            //Store original point of message
            messageOriginalCenter = message.center
            laterOriginalCenter = laterIcon.center
            archiveOriginalCenter = archiveIcon.center
        } else if sender.state == UIGestureRecognizerState.Changed {
            //Edit the trays location
            message.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
            
            
            // Adjust the opacity of the icon as scrolling continues
            if translation.x < -30 {
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: [], animations: { () -> Void in
                    self.laterIcon.alpha = 1
                    }, completion: { (completed) -> Void in
                        //nothing
                })
            } else {
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: [], animations: { () -> Void in
                    self.laterIcon.alpha = 0.5
                    }, completion: { (completed) -> Void in
                        //nothing
                })
            }
            
            
            
            // Start moving the icon, and change the color background of the view
            if translation.x < -60{
                laterIcon.center = CGPoint(x: laterOriginalCenter.x + translation.x + 60, y: laterOriginalCenter.y)
                backgroundView.backgroundColor = UIColor.orangeColor()
                //(red: , green: 255, blue: 102, alpha: 1.0)
            } else {
                laterIcon.center = CGPoint(x: laterOriginalCenter.x, y: laterOriginalCenter.y)
                backgroundView.backgroundColor = UIColor.grayColor()
            }
            
            
            

            print("Gesture changed at: \(point) \(translation)")
        } else if sender.state == UIGestureRecognizerState.Ended {
            
            // Snap the message back to its original position
            if translation.x < -260 {
                

            } else if translation.x < -60 {
                archiveIcon.alpha = 0
                
                
                
                UIView.animateWithDuration(0.5, delay: 0, options: [], animations: { () -> Void in
                    // Move message back to original place
                    self.message.center = CGPoint(x: self.messageOriginalCenter.x - 320 , y: self.messageOriginalCenter.y)
                    
                    // Move the icons back to original positions
                    self.laterIcon.center = CGPoint(x: self.laterOriginalCenter.x - 320, y: self.laterOriginalCenter.y)
                    
                    self.reschedule.alpha = 1
                    
                    print("Gesture ended at: \(point)")
                    }, completion: { (completed) -> Void in
                        //nothing
                })
                
            } else {
                UIView.animateWithDuration(0.5, delay: 0, options: [], animations: { () -> Void in
                    // Move message back to original place
                    self.message.center = CGPoint(x: self.messageOriginalCenter.x, y: self.messageOriginalCenter.y)
                    
                    // Move the icons back to original positions
                    self.laterIcon.center = CGPoint(x: self.laterOriginalCenter.x, y: self.laterOriginalCenter.y)
                    
                    print("Gesture ended at: \(point)")
                    }, completion: { (completed) -> Void in
                        //nothing
                })
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
