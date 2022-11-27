//
//  DetailsViewController.swift
//  introViewCode
//
//  Created by Felipe Domingos on 25/11/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    typealias CustomView = DetailsCarView
    var detailsCarView = CustomView()
    var homeVC: HomeViewController?
    
    var data:  [CarModel] = []
    
    override func loadView() {
        self.view = self.detailsCarView
        
    }
    
    func setData(cars: CarsModel) {
        data = cars
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }

    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

