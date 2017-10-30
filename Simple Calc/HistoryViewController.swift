//
//  HistoryViewController.swift
//  Simple Calc
//
//  Created by Naruth Kongurai on 10/29/17.
//  Copyright © 2017 Naruth Kongurai. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    //MARK: Properties
    public var equationHistory: [String] = []
    @IBOutlet weak var equationHistoryScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize a ContainerView
        var containerView = UIView()
        containerView.isUserInteractionEnabled = true
        
        // Make a padded space box
        var paddedSpace: CGFloat = 40
        
        // Creating and adding labels to the scrollview
        for equation in equationHistory.reversed() {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: paddedSpace))
            label.text = equation
            paddedSpace += 40
            
            containerView.addSubview(label)
        }
        equationHistoryScrollView.addSubview(containerView)
        equationHistoryScrollView.contentSize = CGSize(width: equationHistoryScrollView.contentSize.width, height: 2300)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "MainSegue") {
            let main = segue.destination as! ViewController
            main.equationHistory = self.equationHistory
        }
    }

}
