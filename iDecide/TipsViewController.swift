//
//  TipsViewController.swift
//  iDecide
//
//  Created by Nicole on 8/3/16.
//  Copyright © 2016 Nicole Nigro. All rights reserved.
//

import UIKit

class TipsViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "black wood")!)
        tipLabel.text = " 1. Try to decide ahead of time \n 2. Narrow out irrational choices \n 3. Make a pros and cons list \n 4. Think about future implications \n 5. Ask others for advice "
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
