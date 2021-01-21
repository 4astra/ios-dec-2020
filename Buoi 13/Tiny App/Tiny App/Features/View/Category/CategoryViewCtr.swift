//
//  CategoryViewCtr.swift
//  Tiny App
//
//  Created by Hockey on 1/16/21.
//

import UIKit
import Alamofire
import Kingfisher

class CategoryViewCtr: UIViewController {
    var datas = [StarShip]()
    @IBOutlet weak var ibCategoryColls: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "My Category"
//        title = "Categories"
        ibCategoryColls.dataSource = self
        ibCategoryColls.delegate = self
        
        
        let width: CGFloat =  UIScreen.main.bounds.width
        let flowLayout: UICollectionViewFlowLayout  = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: (width - 30.0) / 2.0, height: 240)
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        ibCategoryColls.collectionViewLayout = flowLayout
        
        AF.request("https://jsonblob.com/api/5ee10e1b-5711-11eb-9d21-f3eadbf4aac5").responseData {
            [weak self] (response) in
            switch response.result {
            case .success:
                if let data = response.value {
                    let decoder = JSONDecoder()
                    do {
                        let result = try? decoder.decode(StarShips.self, from: data)
                        self?.datas =  (result != nil) ? result!.all : []
                        self?.ibCategoryColls.reloadData()
                        
                    } catch {
                        print(error)
                    }
                }
            default:
                print("")
            }
        }
    }
    
    
}

extension CategoryViewCtr: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cateCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionCell", for: indexPath) as? CategoryCollectionCell else {
            return UICollectionViewCell()
        }
        cateCell.ibModel.text = datas[indexPath.row].model
        cateCell.ibTitle.text = datas[indexPath.row].name
        
        cateCell.ibImage.kf.setImage(with: URL(string: datas[indexPath.row].image))
        return cateCell
    }
    
}

extension CategoryViewCtr: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let homeStory = UIStoryboard.instanceWith(name: "Home")
        if #available(iOS 13.0, *) {
            if let surveyCtr = homeStory?.instantiateViewController(identifier: "SurveyResultViewCtr") as? SurveyResultViewCtr {
                self.navigationController?.pushViewController(surveyCtr, animated: true)
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

//extension CategoryViewCtr: UICollectionViewDelegateFlowLayout {
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 128, height: 185)
//    }
//}
