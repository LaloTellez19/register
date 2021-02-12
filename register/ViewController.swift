//
//  ViewController.swift
//  register
//
//  Created by Miguel Eduardo  Valdez Tellez  on 08/02/21.
//

import UIKit
import register_Framework

class ViewController: UIViewController {

    //MARK: - IBAction
    @IBAction func nextButton(_ sender: Any) {
        register_FrameworkWireFrame.presentregister_FrameworkModule(fromView: self)
        
    }
    
    //MARK: - life clyce
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

