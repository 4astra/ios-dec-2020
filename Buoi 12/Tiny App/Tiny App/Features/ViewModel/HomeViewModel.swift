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
        
        //        let headers: HTTPHeaders = [
        //            "Accept": "application/json",
        //            "Authorization": "00D0l000000Duyk!ARMAQOTi4kR12nIeiAHrSBJ3BdPd2dniyFQTxKWYZpEAhCEC_1HObyG0BtdDJv7BAWpfxClax6C3YqgO3Bpgm3Jyd2LZ7DE0",
        //          ]
        //
        //        AF.request("http://192.168.28.82:8080/api/v1/films", headers: headers).responseDecodable(of: Films.self) {
        //            response in
        //            if let result = response.value {
        //                self.filmsArr = result.all
        //                self.reUpdateUI?()
        //            }
        //        }
        
        AF.download("https://jsonblob.com/api/3b28d014-5707-11eb-9d21-6fd62b3efcd1")
            .downloadProgress { progress in
                print("\n\n\nShow Progress: ", progress)
            }
            .responseData { response in
                switch response.result {
                case .success:
                    if let data = response.value {
                        
                        do {
                            let decoder = JSONDecoder()
                            let result = try decoder.decode(Films.self, from: data)
                            self.filmsArr = result.all
                            self.reUpdateUI?()
                            
                        } catch {
                            print(error)
                        }
                    }
                    break
                case .failure:
                    
                    break
                }
                
            }
    }
}
