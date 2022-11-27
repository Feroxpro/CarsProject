//
//  CarsViewModel.swift
//  introViewCode
//
//  Created by Felipe Domingos on 16/11/22.
//

import UIKit


class CarsViewModel {
    
    let rest = RestManager()
    var viewController: ViewController
    
    init(viewController: ViewController) {
        self.viewController = viewController
    }

    
    func validate(user: String, pass: String) {
        if user.isEmpty == true || user.isEmpty == true {
            self.viewController.alert?.showAlert(title: "Euserrro", message: "Insira um usuário e senha")
        } else {
            rest.webServiceLogin(user: user, password: pass) {[weak self] result in
                if let self = self {
                    print(result.statusCode)
                    switch result.statusCode {
                    case 400..<500:
                        if result.statusCode == 401 {
                            self.viewController.alert?.showAlert(title: "Erro", message: "Usuário ou senha inválidos")
                        }
                        break
                    default:
                        if result.statusCode == 200 {
                            self.getListCars(token: UserDefaults.standard.string(forKey: "someObject") ?? "")
                        }
                        break
                    }
                }
            }
        }
    }
    
    private func getListCars(token: String) {
        rest.webServiceList(token: token, completion: {[weak self] result in
            self?.goListCarsViewController(cars: result)
        })
    }
    
    private func  goListCarsViewController(cars: CarsModel) {
        let homeViewController = HomeViewController()
        homeViewController.setData(cars: cars)
        self.viewController.navigationController?.pushViewController(homeViewController, animated: true)
    }
}
