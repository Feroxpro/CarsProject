//
//  RestManager.swift
//  introViewCode
//
//  Created by Felipe Domingos on 16/11/22.
//

import Foundation

import Foundation
import Alamofire

struct MyResponse {
    let statusCode: Int
    
    init(statusCode: Int) {
        self.statusCode = statusCode
    }
}

class RestManager  {
    
    var viewModel: CarsViewModel?
    
    func webServiceLogin(user: String, password: String, completion: @escaping (MyResponse) -> ()) {
        let parameters:[String:String] = ["username": user , "password": password]
        let header: HTTPHeaders = ["Content-Type" : "application/json" ]
        let baseUrl = "https://carros-springboot.herokuapp.com/api/v2/login"
        AF.request(baseUrl,
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: header).response { response in
                    DispatchQueue.main.async {
                        do {
                            let result = try JSONDecoder().decode(Login.self, from: response.data ?? Data())
                            UserDefaults.standard.set(result.token, forKey: "someObject")
                            if let statusCode = response.response?.statusCode {
                                completion(MyResponse(statusCode:  statusCode))
                            } else {
                                completion(MyResponse(statusCode: 0))
                            }
                            
                        } catch let err {
                            print("Error:", err, "Status Code: ", response.response?.statusCode ?? 0)
                            completion(MyResponse(statusCode: 0))
                        }
                    }
                   }
    }
    
    func webServiceList(token: String, completion: @escaping (CarsModel) -> ()) {
        let header: HTTPHeaders = ["Authorization" : "Bearer \(UserDefaults.standard.string(forKey: "someObject") ?? "")"]
        let baseUrl = "https://carros-springboot.herokuapp.com/api/v2/carros"
        AF.request(baseUrl, method: .get, headers: header).responseData { response in
            do {
                if let data = response.data {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    guard let dataObject = try? decoder.decode(CarsModel.self, from: data) else { return }
                    completion(dataObject)
                }
            } catch let err{
                print("Error:", err, "Status Code: ", response.response?.statusCode ?? 0)
            }
        }
    }
}
