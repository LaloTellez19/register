//
//  ActivitiesCardCollectionViewCell.swift
//  register_Framework
//
//  Created by Miguel Eduardo  Valdez Tellez  on 10/02/21.
//

import UIKit

class ActivitiesCardCollectionViewCell: UICollectionViewCell {

    weak var delegate: ActivitiesCardDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBOutlet weak var activitiesNameLabel: UILabel!
    @IBAction func closeButton(_ sender: Any) {
        if let indexPath = self.indexPath{
            delegate?.deleteActivity(index: indexPath)
        }
    }
    
    static var reuseIdentifier = "ActivitiesCardCollectionViewCell"
    static let nib = UINib(nibName: ActivitiesCardCollectionViewCell.reuseIdentifier, bundle: Bundle(for: ActivitiesCardCollectionViewCell.self))
}


protocol ActivitiesCardDelegate: class {
    func deleteActivity(index: IndexPath)
}

extension UITableViewCell {
    var tableView: UITableView? {
        return self.next as? UITableView
    }

    var indexPath: IndexPath? {
        return self.tableView?.indexPath(for: self)
    }
}
