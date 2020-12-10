//
//  CustomCellViewController.swift
//  test
//
//  Created by Evelina on 10.12.2020.
//

import UIKit


class CustomViewController: UIViewController {
    
    var colorBackground:UIColor?
    
    var titleForCell:String?{
        didSet{
            titleField?.text = titleForCell
        }
    }
    
    var text:String?{
        didSet{
            textField?.text = text
        }
    }
    
    @IBOutlet private var titleField:UITextField!
    @IBOutlet private var textField:UITextField!
    
    @IBAction func makeYellow(){
        colorBackground = UIColor.yellow
    }
    @IBAction func makeGreen(){
        colorBackground = UIColor.green
    }
    @IBAction func  makeBlue(){
        colorBackground = UIColor.blue
    }
    @IBAction func  save(){
        titleForCell = titleField.text
        text = textField.text
    }
    
    override func viewDidLoad() {
        titleField.text = titleForCell
        textField.text = text
    }
}
