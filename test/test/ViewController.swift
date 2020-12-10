//
//  ViewController.swift
//  test
//
//  Created by Evelina on 10.12.2020.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegate {
    
    
    private var numerOfCell:Int = 5
    private var titles:[String] = ["hello","to do list","password","alarm","to buy"]
    private var textes:[String] = ["привет","1.homework","123","on 8am","1.bread"]
    private var colors:[UIColor] = [UIColor.green, UIColor.blue,UIColor.yellow,UIColor.green,UIColor.yellow]
    
    enum CellIndentifier : String {
        case customCell = "CustomCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numerOfCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CustomCell else{
            fatalError("Something wrong")
        }
        cell.backgroundColor = cell.setColor()
        cell.set(titleName: titles[indexPath.item], text: textes[indexPath.item])
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 5
        
        return cell
    
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        selectCell(at: indexPath)
    }
    private func selectCell(at indexPath:IndexPath){
        guard let customCellViewController:CustomViewController = storyboard?.instantiateViewController(identifier: "CustomViewController") else {
            return
        }
        customCellViewController.titleForCell = titles[indexPath.item]
        customCellViewController.text = textes[indexPath.item]
        customCellViewController.colorBackground = colors[indexPath.item]
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
             return CGSize(width: view.frame.width / 2, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
             5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
             5
    }
    
    @IBAction private func addCell(){
        titles.append("")
        textes.append("")
        numerOfCell += 1
        collectionView.reloadData()
    }
}

