//
//  HomeViewModel.swift
//  introViewCode
//
//  Created by Felipe Domingos on 26/11/22.
//

import Foundation

class HomeViewModel {
    
    var homeViewController: HomeViewController
    init(homeViewController: HomeViewController) {
        self.homeViewController = homeViewController
    }
    
    public func goToDetailsController(data: CarModel) {
    let detailsViewController = DetailsViewController()
        detailsViewController.detailsCarView.addDataDetails(data: data)
        self.homeViewController.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
