import Foundation
import UIKit

class Parser2: UITableViewCell {
    
    @IBOutlet weak var textView: UITextView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
        textView.layer.cornerRadius = 5
        textView.layer.borderWidth = 1
        textView.contentOffset = CGPoint.zero
    }
    
}


