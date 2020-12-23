//
//  HomeViewModel.swift
//  Tiny App
//
//  Created by Hockey on 12/23/20.
//

import Foundation
import Alamofire

class HomeViewModel {
    var filmsArr: [Film] = []
    var reUpdateUI: (() -> ())?
    
    func fetchAll() {
        AF.request("http://192.168.28.82:8080/api/v1/films").responseDecodable(of: Films.self) {
            response in
//            print("My Response \(response.value)")
            if let result = response.value {
                self.filmsArr = result.all
                self.reUpdateUI?()
            }
        }
    }
}
