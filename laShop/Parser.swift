import Foundation
import UIKit

class Parser: UITableViewCell {
    
    @IBOutlet weak var buttonReserver: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        buttonReserver.layer.cornerRadius = 5
        buttonReserver.layer.borderWidth = 1
        buttonReserver.layer.borderColor = UIColor.black.cgColor
    }
    
}

