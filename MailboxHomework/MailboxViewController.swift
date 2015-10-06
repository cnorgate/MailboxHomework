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
    var feedOriginalCenter: CGPoint!
    
    @IBOutlet weak var search: UIImageView!
    
    @IBOutlet weak var laterIcon: UIImageView!
    var laterOriginalCenter: CGPoint!
    
    @IBOutlet weak var listIcon: UIImageView!
    
    
    @IBOutlet weak var laterIconWrapper: UIView!
    var laterWrapperOriginalCenter: CGPoint!
    
    @IBOutlet weak var archiveIcon: UIImageView!
    var archiveOriginalCenter: CGPoint!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var backgroundView: UIImageView!
    
    @IBOutlet weak var reschedule: UIImageView!
    
    @IBOutlet weak var listScreen: UIImageView!
    
    
    
    
    
    
    
    
    
    
    
    
    
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
        
        // Set points and velocity
        var point = sender.locationInView(view)
        var velocity = sender.velocityInView(view)
        var translation = sender.translationInView(view)
        
        
        
        
        // Pan begin
        if sender.state == UIGestureRecognizerState.Began {
            print("Gesture began at: \(point)")
            
            //Store original point of message
            messageOriginalCenter = message.center
            laterOriginalCenter = laterIcon.center
            laterWrapperOriginalCenter = laterIconWrapper.center
            archiveOriginalCenter = archiveIcon.center
            feedOriginalCenter = feed.center
        
            
            
            
        // Pan Change
        } else if sender.state == UIGestureRecognizerState.Changed {
            //Edit the trays location
            message.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
            
            // Change icons and background color
            if translation.x < -260{
                //laterIcon.center = CGPoint(x: laterOriginalCenter.x + translation.x + 60, y: laterOriginalCenter.y)
                laterIconWrapper.center = CGPoint(x: laterWrapperOriginalCenter.x + translation.x + 60, y: laterWrapperOriginalCenter.y)
                backgroundView.backgroundColor = UIColor.brownColor()
                laterIcon.alpha = 0
                listIcon.alpha = 1
                //(red: , green: 255, blue: 102, alpha: 1.0)
            } else if translation.x < -60{
                //laterIcon.center = CGPoint(x: laterOriginalCenter.x + translation.x + 60, y: laterOriginalCenter.y)
                laterIconWrapper.center = CGPoint(x: laterWrapperOriginalCenter.x + translation.x + 60, y: laterWrapperOriginalCenter.y)
                backgroundView.backgroundColor = UIColor.orangeColor()
                laterIcon.alpha = 1
                listIcon.alpha = 0
                //(red: , green: 255, blue: 102, alpha: 1.0)
            } else if translation.x < -30 {
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: [], animations: { () -> Void in
                    self.laterIcon.alpha = 1
                    }, completion: { (completed) -> Void in
                        //nothing
                })
                backgroundView.backgroundColor = UIColor.grayColor()
            } else {
                laterIconWrapper.center = CGPoint(x: laterWrapperOriginalCenter.x, y: laterWrapperOriginalCenter.y)
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: [], animations: { () -> Void in
                    self.laterIcon.alpha = 0.5
                    }, completion: { (completed) -> Void in
                        //nothing
                })

                //backgroundView.backgroundColor = UIColor.grayColor()
            }
            print("Gesture changed at: \(point) \(translation)")
            
            
         
            
        // Pan ended
        } else if sender.state == UIGestureRecognizerState.Ended {
            
            // Snap the message back to its original position
            if translation.x < -260 {
                archiveIcon.alpha = 0
                
                UIView.animateWithDuration(0.5, delay: 0, options: [], animations: { () -> Void in
                    // Move message back to original place
                    self.message.center = CGPoint(x: self.messageOriginalCenter.x - 320 , y: self.messageOriginalCenter.y)
                    
                    // Move the icons back to original positions
                    self.laterIconWrapper.center = CGPoint(x: self.laterWrapperOriginalCenter.x - 320, y: self.laterWrapperOriginalCenter.y)
                    
                    self.listScreen.alpha = 1
                    
                    print("Gesture ended at: \(point)")
                    }, completion: { (completed) -> Void in
                        //nothing
                })
            } else if translation.x < -60 {
                archiveIcon.alpha = 0
                
                UIView.animateWithDuration(0.5, delay: 0, options: [], animations: { () -> Void in
                    // Move message back to original place
                    self.message.center = CGPoint(x: self.messageOriginalCenter.x - 320 , y: self.messageOriginalCenter.y)
                    
                    // Move the icons back to original positions
                    self.laterIconWrapper.center = CGPoint(x: self.laterWrapperOriginalCenter.x - 320, y: self.laterWrapperOriginalCenter.y)
                    
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
                    self.laterIconWrapper.center = CGPoint(x: self.laterWrapperOriginalCenter.x, y: self.laterWrapperOriginalCenter.y)
                    
                    print("Gesture ended at: \(point)")
                    }, completion: { (completed) -> Void in
                        //nothing
                })
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    // Tap out of the reschedule
    @IBAction func onTapReschedule(sender: UITapGestureRecognizer) {
        print("tapped")
        
        // turn alpha back to zero slowly
        UIView.animateWithDuration(0.5, delay: 0, options: [], animations: { () -> Void in
            self.reschedule.alpha = 0
            }, completion: { (completed) -> Void in
                //nothing
        })
        
        

        // Move up and down the feed slowly
        UIView.animateWithDuration(1, delay: 0, options: [UIViewAnimationOptions.Autoreverse], animations: { () -> Void in
            self.feed.center = CGPoint(x: self.feedOriginalCenter.x, y: self.feedOriginalCenter.y - 86)
            }) { (completed) -> Void in
                self.feed.center = CGPoint(x: self.feedOriginalCenter.x, y: self.feedOriginalCenter.y)
        }
        
        
        
        // Replace the various assets to their original state
        UIView.animateWithDuration(0, delay: 1, options: [], animations: { () -> Void in
            // Move message back to original place
            self.message.center = CGPoint(x: self.messageOriginalCenter.x, y: self.messageOriginalCenter.y)
            
            // Move the icons back to original positions
            self.laterIconWrapper.center = CGPoint(x: self.laterWrapperOriginalCenter.x, y: self.laterWrapperOriginalCenter.y)
            }, completion: { (completed) -> Void in
                //nothing
        })
        

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
