//
//  ViewController.swift
//  manee
//
//  Created by Phudit Chuengjaroen on 6/3/15.
//  Copyright (c) 2015 Phudit Chuengjaroen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    let timeMoveDuration: NSTimeInterval = 2.25
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.frame.origin.y = -10
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orangeColor()]
        let imageName = "startimg.jpg"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 87, y: 234, width: 200, height: 200)
        mainView.addSubview(imageView)
        mainView.center = self.view.center
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(timeMoveDuration))
        dispatch_after(time, dispatch_get_main_queue()) {
            //call the method which have the steps after delay.
            self.moveNextScreen()
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //implement
    @IBAction func moveNextScreen(){
        let secondViewController:ViewThreeController = ViewThreeController(nibName: "ViewThreeController", bundle: nil)
        var modalStyle: UIModalTransitionStyle = UIModalTransitionStyle.CoverVertical
        secondViewController.modalTransitionStyle = modalStyle
        self.presentViewController(secondViewController, animated: true, completion: nil)

    }
}

