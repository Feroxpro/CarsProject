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
    
    var detailsVC = DetailsViewController()
    
    public func goToDetailsController() {
    let detailsViewController = DetailsViewController()
        self.homeViewController.present(detailsViewController, animated: true)
    }
}
