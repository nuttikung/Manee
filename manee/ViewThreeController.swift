//
//  ViewThree.swift
//  manee
//
//  Created by Phudit Chuengjaroen on 6/5/15.
//  Copyright (c) 2015 Phudit Chuengjaroen. All rights reserved.
//

import Foundation
import UIKit

class ViewThreeController: UIViewController {
    
    //Variable
    
    @IBOutlet weak var animationBtn: UIButton!
    @IBOutlet weak var seeResultBtn: UIButton!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var index = 0
    let animationDuration: NSTimeInterval = 0.25
    let switchingInterval: NSTimeInterval = 0.65
    
    //prepare image files fore animation
    let images = [
        UIImage(named: "ziamzee_01.jpg")!,
        UIImage(named: "ziamzee_02.jpg")!,
        UIImage(named: "ziamzee_03.jpg")!,
        UIImage(named: "ziamzee_04.jpg")]
    
    //function when do something on object
    @IBAction func animationBtnClicked(sender: AnyObject) {
        //myImageView.image = images[index++]
        animationBtn.hidden = true
        myImageView.image = images[index++]
        animateImageView()
        activityIndicator.startAnimating()
        let delay = 6 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()) {
            //call the method which have the steps after delay.
            self.stepsAfterDelay()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.hidden = false
        seeResultBtn.setTitle("See description", forState: .Normal)
        seeResultBtn.hidden = true
        animationBtn.setTitle("Ready", forState: .Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //implement
    func stepsAfterDelay(){
        activityIndicator.stopAnimating()
        seeResultBtn.hidden = false
    }
    
    func animateImageView() {
        CATransaction.begin()

        CATransaction.setAnimationDuration(animationDuration)
        CATransaction.setCompletionBlock {
            let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(self.switchingInterval * NSTimeInterval(NSEC_PER_SEC)))
            dispatch_after(delay, dispatch_get_main_queue()) {
                self.animateImageView()
            }
        }
        
        let transition = CATransition()
        transition.type = kCATransitionFade
        /*
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        */
        myImageView.layer.addAnimation(transition, forKey: kCATransition)
        myImageView.image = images[index]
        
        CATransaction.commit()
        
        index = index < images.count - 1 ? index + 1 : 0
    }
    
    
}

