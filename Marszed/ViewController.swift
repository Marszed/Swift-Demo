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
    
    
    // =======================视图控制器中与生存期相关的方法=======================
    // loadView 穿件或返回一个试图控制器的视图
    // viewDidLoad 视图载入完成时执行
    // viewWillAppear 视图将要呈现时执行
    // viewDidAppear 视图已经呈现时执行
    // viewWillDisappear 视图将要销毁时执行
    // viewDidDisappear 视图已经销毁时执行
    // viewWillLayoutSubviews 视图将要布局其子视图时执行
    // viewDisLayoutSUbviews 视图已经布局其子视图时执行
    // didReceiveMemoryWaring 视图检测到内存警告时执行
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 载入试图后执行
        // 加载视图后再做任何额外设置，通常是从笔尖。
        // 当应用程序运行到当前的属兔控制器后，控制器要将自己的视图对象显示在屏幕上，事件发生流程如下：
        // 1: 如果该试图控制器的视图属性还没有被放入内存中，控制器将调用loadView方法。
        // 2: 当载入视图完成，就会调用ViewDidLoad方法，在这个方法里面我们可以对需要显示的数据进行初始化
        // self.view.backgroundColor = UIColor.yellow;
        // let label = UILabel(frame: CGRect(x: 10, y: 170, width: 300, height: 50));
        // label.text = "Marszed"
        // label.textColor = UIColor.blue;
        // self.view.addSubview(label);
        print("viewDidLoad 被调用");
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        print("viewWillAppear 被调用");
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        print("viewDidAppear 被调用");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        // 处理任何可以重新创建的资源
        // 收到内存警告的情况下执行
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

