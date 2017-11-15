import Foundation
import UIKit

class Parser: UITableViewCell {
    
    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var buttonReserver: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        buttonReserver.layer.cornerRadius = 5
        buttonReserver.layer.borderWidth = 1
        buttonReserver.layer.borderColor = UIColor.black.cgColor
    
        textView.layer.cornerRadius = 5
        textView.layer.borderWidth = 1
        
        pictureView.layer.cornerRadius = 5
        pictureView.layer.borderWidth = 1
    }
    
}

