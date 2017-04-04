//
//  ViewController.swift
//  FaveButtonDemo
//
//  Created by Jansel Valentin on 6/12/16.
//  Copyright © 2016 Jansel Valentin. All rights reserved.
//

import UIKit
import SparkImageView

class ViewController: UIViewController {
    
    @IBAction func animate(_ sender: Any) {
        starView.animate(withDuration: 1, completion: nil)
    }
    
    @IBOutlet weak var starView: SparkImageView!
}
