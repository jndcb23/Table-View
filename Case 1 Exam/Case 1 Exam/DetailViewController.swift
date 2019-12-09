//
//  DetailViewController.swift
//  Case 1 Exam
//
//  Created by John Nikko Borja on 05/11/2019.
//  Copyright © 2019 John Nikko Borja. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //from previous controller
    var dataModel:Model!
    
    //IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageNameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var byLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageNameLabel.text = dataModel.imageLbl
        yearLabel.text = dataModel.imageYear
        byLabel.text = dataModel.imageBy
        
        imageView.image = UIImage(named: dataModel.imageName)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

