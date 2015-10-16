//
//  ViewController.swift
//  SlideshowCollectionView
//
//  Created by Tommy Chheng on 10/15/15.
//  Copyright © 2015 Tommy Chheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var index = 0
    var items = ["A", "B", "C"]
    
    @IBOutlet weak var playerView: PlayerCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        playerView.items = items
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func update() {
        playerView?.goToPage(index)
        index += 1
        
        if ( index > items.count ) {
            index = 0
        }
    }

}

