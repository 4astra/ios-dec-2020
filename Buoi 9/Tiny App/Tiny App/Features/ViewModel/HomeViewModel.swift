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
        
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Authorization": "00D0l000000Duyk!ARMAQOTi4kR12nIeiAHrSBJ3BdPd2dniyFQTxKWYZpEAhCEC_1HObyG0BtdDJv7BAWpfxClax6C3YqgO3Bpgm3Jyd2LZ7DE0",
          ]
        AF.request("http://192.168.28.82:8080/api/v1/films", headers: headers).responseDecodable(of: Films.self) {
            response in
//            print("My Response \(response.value)")
            if let result = response.value {
                self.filmsArr = result.all
                self.reUpdateUI?()
            }
        }
    }
}
