
import UIKit


class PlayerCollectionCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!

    var text:String? {
        didSet {
            titleLabel.text = text
        }
    }
}
