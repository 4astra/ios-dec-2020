//
//  ViewController.swift
//  Xin Chao
//
//  Created by Hockey on 12/14/20.
//

import UIKit

class Person {
    let name: String
   
    init(name: String) {
        self.name = name
    }
    var appartment: Apartment?
    
    deinit {
        print("\(name) da duoc huy")
    }
}

class Apartment {
    let unit: String
    unowned var person: Person?
    
    init(unit: String) {
        self.unit = unit
    }
    
    deinit {
        print("\(unit) da duoc huy")
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var lbNext: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var btnClick: UIButton!
    var john: Person?
    var unit4A: Apartment?
    
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    override func viewDidAppear(_ animated: Bool) {
        lblMessage.text = "Hello"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblMessage.text = "Chuong trinh iOS Tiep theo"
        john = Person(name: "John")
//        john?.name = "Abc"
        unit4A = Apartment(unit: "4A")
        
        john!.appartment = unit4A
        unit4A!.person = john
        
        john = nil
    }

    @IBAction func doClick(_ sender: UIButton) {
        lbNext.text = "Swift"
    }
    @IBAction func eventClick(_ sender: Any) {
        lblMessage.text = "Button C"
    }
    
}

