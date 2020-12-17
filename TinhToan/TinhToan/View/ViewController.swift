//
//  ViewController.swift
//  TinhToan
//
//  Created by Hockey on 12/16/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblDisplay: UILabel!
    var viewModal: CalculatorViewModel! {
        didSet {
            self.viewModal.updateView = { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.showUp()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModal = CalculatorViewModel()
    }
    
    func showUp() {
        lblDisplay.text = viewModal.calculator.result
    }

    @IBAction func actionInput(_ sender: UIButton) {
        if let digit = sender.titleLabel?.text {
            viewModal.inputDigit(digit: digit)
        }
    }
    
    @IBAction func doOperator(_ sender: UIButton) {
        if let symbol = sender.titleLabel?.text, symbol != "=" {
//            viewModal.inputDigit(digit: digit)
            viewModal.calculator.prevOperator = symbol
        }
        viewModal.doCalculator()
    }
    
    @IBAction func doClear(_ sender: Any) {
        viewModal.clearAll()
    }
}

