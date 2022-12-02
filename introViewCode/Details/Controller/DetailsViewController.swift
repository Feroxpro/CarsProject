//
//  DetailsViewController.swift
//  introViewCode
//
//  Created by Felipe Domingos on 25/11/22.
//

import UIKit
import AVFoundation
import AVKit

class DetailsViewController: UIViewController {
    
    var player: AVPlayer?
    
    typealias CustomView = DetailsCarView
    var detailsCarView = CustomView()

    
    override func loadView() {
        self.view = self.detailsCarView

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        detailsCarView.playVideo()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.title = detailsCarView.titleName
//        self.navigationController?.navigationBar.barTintColor = UIColor(red: 79.0/255.0, green: 176.0/255.0, blue: 91.0/255.0, alpha: 1.0)
    }
}

