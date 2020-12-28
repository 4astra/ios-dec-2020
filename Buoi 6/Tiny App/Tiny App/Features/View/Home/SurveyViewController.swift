//
//  SurveyViewController.swift
//  Tiny App
//
//  Created by Hockey on 12/28/20.
//

import UIKit

class SurveyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var ibSurveyTable: UITableView!
    var survey = [SingleOption]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ibSurveyTable.register(UINib(nibName: "SingleOptionCell", bundle: nil), forCellReuseIdentifier: "SingleOptionCell")
        
        for i in 0..<100 {
            let item = SingleOption()
            item.title = "Question \(i)"
            survey.append(item)
        }
        
//        let button = UIButton(type: UIButton.ButtonType.custom)
//        button.setTitle("Hello", for: UIControl.State.normal)
//        button.addTarget(self, action: #selector(goNextScreen), for: UIControl.Event.touchUpInside)
//
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Hello",
            style: .plain,
            target: self,
            action: #selector(goNextScreen)
        )
        
        // Do any additional setup after loading the view.
    }
    
    @objc func goNextScreen() {

        var selecteds = [SingleOption]()
        for i in 0..<survey.count {
            if survey[i].isSelected {
                selecteds.append(survey[i])
            }
        }
        let homeStory = UIStoryboard(name: "Home", bundle: nil)
        guard let surveyAnswerCtr = homeStory.instantiateViewController(identifier: "SurveyResultViewCtr") as? SurveyResultViewCtr else {
            return
        }
        surveyAnswerCtr.answer = selecteds
        navigationController?.pushViewController(surveyAnswerCtr, animated: true)
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return survey.count
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for i in 0..<survey.count {
            if indexPath.row == i {
                survey[indexPath.row].isSelected = !survey[indexPath.row].isSelected
            }
        }
        
        ibSurveyTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SingleOptionCell", for: indexPath) as? SingleOptionCell else {
            return UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "")
        }
        cell.ibTitle.text = survey[indexPath.row].title
        cell.ibSelectBtn.isSelected = survey[indexPath.row].isSelected

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }

}
