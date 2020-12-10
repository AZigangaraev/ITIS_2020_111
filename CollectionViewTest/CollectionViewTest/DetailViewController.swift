

import UIKit

protocol DetailViewControllerDelegate: AnyObject {
    func reloadCellData(index: Int, cell: CellData)
    func addCellData(cell: CellData)
}

class DetailViewController: UIViewController {
    
    var cellData: CellData?
    var index: Int?
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    weak var delegate: DetailViewControllerDelegate?
    
    @IBOutlet weak var redBtn: UIButton!
    @IBOutlet weak var blueBtn: UIButton!
    @IBOutlet weak var yellowBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTap))
        
    }
    
    func loadData() {
        guard let data = cellData else {
            return
        }
        mainLabel.text = data.title
        textField.text = data.text
    }
    
    @IBAction func redButtonAction(_ sender: Any) {
        setTextForButton()
        redBtn.setTitle("Selected Color: red", for: .normal)
        cellData?.color = .red
        if let index = index {
            delegate?.reloadCellData(index: index, cell: cellData!)
        }
    }
    @IBAction func blueButtonAction(_ sender: Any) {
        setTextForButton()
        blueBtn.setTitle("Selected Color: blue", for: .normal)
        cellData?.color = .blue
        if let index = index {
            delegate?.reloadCellData(index: index, cell: cellData!)
        }
    }
    @IBAction func yellowButtonAction(_ sender: Any) {
        setTextForButton()
        yellowBtn.setTitle("Selected Color: yellow", for: .normal)
        cellData?.color = .yellow
        if let index = index {
            delegate?.reloadCellData(index: index, cell: cellData!)
        }
        
    }
    
    private func setTextForButton() {
        redBtn.setTitle("Color: red", for: .normal)
        blueBtn.setTitle("Color: blue", for: .normal)
        yellowBtn.setTitle("Color: yellow", for: .normal)
        
    }
    
    @objc private func saveTap(_ sender: Any) {
        if let index = index {
            cellData?.text = textField.text ?? "No text"
            delegate?.reloadCellData(index: index, cell: cellData!)
            navigationController?.popViewController(animated: true)
        }else {
            cellData?.text = textField.text ?? "No text"
            delegate?.addCellData(cell: cellData!)
            navigationController?.popViewController(animated: true)
        }
    }
    
}
