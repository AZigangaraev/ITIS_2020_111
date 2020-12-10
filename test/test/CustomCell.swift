//
//  CustomCell.swift
//  test
//
//  Created by Evelina on 10.12.2020.
//

import UIKit

protocol CustomCellDelegate: AnyObject{
    func customCell()
}

class CustomCell: UICollectionViewCell {
    
    static let indentifier:String = "CustomCell"
    
    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var textLabel:UILabel!
    
    weak var delegate:CustomCellDelegate?
    
    private var colors:[UIColor] = [UIColor.green, UIColor.yellow, UIColor.blue]

    func setColor()->UIColor{
        return colors[Int.random(in: 0...2)]
    }
    
    func set(titleName:String,text:String ){
        titleLabel.text = titleName
        textLabel.text = text
    }
}
