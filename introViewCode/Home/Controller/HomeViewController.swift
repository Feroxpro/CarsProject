//
//  HomeViewController.swift
//  introViewCode
//
//  Created by Felipe Domingos on 18/11/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var viewModel: HomeViewModel = {
        let vm = HomeViewModel(homeViewController: self)
        return vm
    }()
    
    var data:  [CarModel] = []
    
    lazy var homeScreen:HomeScreen = {
        let view = HomeScreen()
        return view
    }()
    
//    lazy var detailsCV:DetailsCarView = {
//        let view = DetailsCarView()
//        return view
//    }()
    
    override func loadView() {
        self.view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreen.configTableViewProtocols(delegate: self, dataSource: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setData(cars: CarsModel) {
        data = cars
        homeScreen.tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeTableViewCell? = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.indentifier, for: indexPath) as? HomeTableViewCell
        cell?.addData(data: self.data[indexPath.row])
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = DetailsCarView()
        self.viewModel.goToDetailsController()
    }
    
}

