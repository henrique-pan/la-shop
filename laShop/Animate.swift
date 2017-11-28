//--------------------------------------------------
//--------------------------------------------------
import UIKit
//--------------------------------------------------
//--------------------------------------------------123
class Animate {
    //--------------------------------------------------
    func animateBackAndForth(duration du: Double,
                             aView av: UIView,
                             startingPosition st: CGFloat,
                             endingPosition en: CGFloat,
                             delay de: Double) {
        UIView.animate(withDuration: du, animations: {
            av.frame.origin.x = en
        })
        {
            _ in
            UIView.animate(withDuration: du, delay: de, animations: {
                av.frame.origin.x = st
            })
        }
    }
    //--------------------------------------------------
    func animateHorizontally(duration du: Double,
                             aView av: UIView,
                             startingPosition st: CGFloat,
                             endingPosition en: CGFloat) {
        UIView.animate(withDuration: du, animations: {
            av.frame.origin.x = en
        })
    }
    //--------------------------------------------------
}
//--------------------------------------------------
//--------------------------------------------------
