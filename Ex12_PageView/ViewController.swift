//
//  ViewController.swift
//  Ex12_PageView
//
//  Created by 송윤근 on 2022/01/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pageController: UIPageControl!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate.mainVC = self
        
        
        
    }


}

