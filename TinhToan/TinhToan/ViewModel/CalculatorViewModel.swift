//
//  CalculatorViewModel.swift
//  TinhToan
//
//  Created by Hockey on 12/16/20.
//

import Foundation

protocol CalculatorProtocol {
    
    var updateView:(() -> ())? { get }
    
    func inputDigit(digit: String)
    
    func doCalculator()
    
    func clearAll()
}


class CalculatorViewModel: CalculatorProtocol {
    
    var calculator: Calculator!
    
    var updateView: (() -> ())?
    
    func inputDigit(digit: String) {
        if calculator.waitingForCalculator {
            calculator.result = digit
            calculator.next = Int(calculator.result)
            calculator.waitingForCalculator = false
            
        } else {
            calculator.result = calculator.result == "0" ? digit : (calculator.result + digit)
            calculator.previous = Int(calculator.result)
            
        }
        updateView?()
    }
    
    func doCalculator() {
        let inputValue = Int(calculator.result)
        
        if calculator.previous == nil {
            calculator.previous = inputValue
        }
        else {
            guard let opt = calculator.prevOperator else {
                return
            }
            switch opt {
            case "+":
                calculator.next = calculator.next ?? 0
                if let a = calculator.previous, let b = calculator.next {
                    let r = addOperate(preVal:a, nxtVal: b)
                   
                    calculator.result = "\(r)"
                    calculator.previous = r
                    calculator.next = nil
                }

                
                break
            case "*":
                calculator.next = calculator.next ?? 1
                
                if let a = calculator.previous, let b = calculator.next {
                    
                    let r = multiplyOperate(preVal:a, nxtVal: b)
                    
                    calculator.result = "\(r)"
                    calculator.previous = r
                    calculator.next = nil
                    
                }
                break
            case "=":
                print("")
                break
            default:
                calculator.next = calculator.next ?? 0
                
                if let a = calculator.previous, let b = calculator.next {
                    let r = subOperate(preVal:a, nxtVal: b)
                    
                    calculator.result = "\(r)"
                    calculator.previous = r
                    calculator.next = nil
                }
            }
            
        }
        
        calculator.waitingForCalculator = true
        updateView?()
    
    }
    
    func clearAll() {
        calculator = nil
        calculator = Calculator()
        updateView?()
    }
    
    init() {
        self.calculator = Calculator()
    }
    
}

extension CalculatorViewModel {
    func addOperate(preVal: Int, nxtVal: Int) -> Int {
        return preVal + nxtVal
    }
    func subOperate(preVal: Int, nxtVal: Int) -> Int {
        return preVal - nxtVal
    }
    func multiplyOperate(preVal: Int, nxtVal: Int) -> Int {
        return preVal * nxtVal
    }
    func divideOperate(preVal: Int, nxtVal: Int) -> Int {
        return preVal / nxtVal
    }
}
