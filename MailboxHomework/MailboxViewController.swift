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
    
    @IBOutlet weak var feed: UIImageView!
    
    @IBOutlet weak var search: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //scrollView.contentSize = CGSize(width: 320, height: 1000)
        scrollView.contentSize = CGSize(width: 320, height: message.center.y + feed.center.y + 560)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPanMessage(sender: UIPanGestureRecognizer) {
        
        
        
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
