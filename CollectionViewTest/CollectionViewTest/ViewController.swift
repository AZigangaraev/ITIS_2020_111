
import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, DetailViewControllerDelegate {
    func addCellData(cell: CellData) {
        cellData.append(cell)
        collectionView.reloadData()
    }
    
    
    func reloadCellData(index: Int, cell: CellData) {
        cellData[index] = cell
        collectionView.reloadData()
    }
    
    @IBAction func addNewCell(_ sender: Any) {
        let controller = detailViewController()
        controller.cellData = CellData(title: "New cell \(cellData.count+1)", text: "", color: .red)
        controller.delegate = self
        controller.loadViewIfNeeded()
        controller.loadData()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private var cellData = [CellData]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        loadData()
    }
    
    private func loadData() {
        for i in 1..<6 {
            cellData.append(CellData(title: "№\(i)", text: "text:\(i)", color: .red))
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as? CustomCollectionViewCell else { fatalError("Could not deque cell") }
        
        item.contentView.layer.cornerRadius = 5
        item.title.font.withSize(22)
        item.title.textColor = .black
        item.text.textColor = .systemGray
        
        item.title.text = cellData[indexPath.row].title
        item.text.text = cellData[indexPath.row].text
        
        item.backgroundColor = cellData[indexPath.row].color
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2 - 16, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = detailViewController()
        controller.cellData = cellData[indexPath.row]
        controller.index = indexPath.row
        controller.delegate = self
        controller.loadViewIfNeeded()
        controller.loadData()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func detailViewController() -> DetailViewController {
        guard let storyboard = storyboard else { fatalError() }

        return storyboard.instantiateViewController(identifier: "DetailViewController")
    }
}

