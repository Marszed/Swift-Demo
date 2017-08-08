//
//  ViewController.swift
//  Marszed
//
//  Created by Marszed on 2017/8/3.
//  Copyright © 2017年 Marszed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelResult: UILabel!
    
    var firstOperand: Double = 0.0; // 第一操作数
    var secondOperand: Double = 0.0; // 第二操作数
    var decimalPointFlag: Bool = false; // 标记是否输入了小数点
    var isSecond: Bool = false; // 是否输入第二操作数
    var operatorFlag: String = "" // 操作符
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 加载视图后再做任何额外设置，通常是从笔尖。
        // self.view.backgroundColor = UIColor.yellow;
        // let label = UILabel(frame: CGRect(x: 10, y: 170, width: 300, height: 50));
        // label.text = "Marszed"
        // label.textColor = UIColor.blue;
        // self.view.addSubview(label);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        // 处理任何可以重新创建的资源
    }

    // 数字键 outLet Action
    @IBAction func buttonTap(_ sender: UIButton) {
        // labelResult 默认是0，如果开始输入数字，则先清除0
        if (labelResult.text == "0" || (isSecond && secondOperand == 0.0)){
            labelResult.text = "";
        }
        
        // 将用户输入的数添加到labelResult
        labelResult.text = labelResult.text! + sender.titleLabel!.text!;
        
        if isSecond{
            secondOperand = NSString(string:labelResult.text!).doubleValue;
        } else {
            firstOperand = NSString(string:labelResult.text!).doubleValue;
        }
    
        print(firstOperand);
    }
    
    // 小数点 outLet Action
    @IBAction func decimalPointTag() {
        // 如果没有输入小数点则执行下面操作
        if !decimalPointFlag{
            secondOperand = NSString(string:labelResult.text!).doubleValue;
        } else {
            firstOperand = NSString(string:labelResult.text!).doubleValue;
        }
        decimalPointFlag = !decimalPointFlag;
    }
    
    // 运算符
    @IBAction func operatorTag(_ sender: UIButton) {
        if firstOperand != 0 {
            isSecond = true;
            decimalPointFlag = false;
            
            switch sender.titleLabel!.text! {
            case "+":
                operatorFlag = "+";
            case "-":
                operatorFlag = "-";
            case "×":
                operatorFlag = "*";
            case "÷":
                operatorFlag = "/";
            default:
                operatorFlag = "";
            }
        }
    }
    
    // 计算
    @IBAction func resultTap() {
        // 确保第二操作数有值
        if isSecond {
            // 除数不能为0
            if operatorFlag == "/" && secondOperand == 0 {
                print("Error: 除数不能为0");
                return;
            }
            
            var result: Double = 0.0;
            switch operatorFlag {
            case "+":
                result = firstOperand + secondOperand;
            case "-":
                result = firstOperand - secondOperand;
            case "*":
                result = firstOperand * secondOperand;
            case "/":
                result = firstOperand / secondOperand;
            default:
                result = 0.0;
            }
            
            labelResult.text = result.description;
            print(" 第一操作数: \(firstOperand)");
            print(" 操作符: \(operatorFlag)");
            print(" 第二操作数: \(secondOperand)");
            print(" 结果: \(result)");
        }
    }
    
    // 归0，清空
    @IBAction func clear() {
        labelResult.text = "0";
        firstOperand = 0.0;
        secondOperand = 0.0;
        decimalPointFlag = false;
        isSecond = false;
        operatorFlag = "";
    }
}

