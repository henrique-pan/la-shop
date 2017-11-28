//=======================================
import UIKit
//=======================================
class SectionController: UIViewController {
    //---------------------------//--------------------------- MARK: -------> IBOutlets
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordButton: UIButton!
    @IBOutlet weak var sectionButton: UIButton!
    @IBOutlet weak var adminButton: UIButton!
    //---------------------------//--------------------------- MARK: -------> Properties
    let animObj = Animate()
    let userDefObj = UserDefaultsManager()
    //---------------------------//--------------------------- MARK: -------> viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        manageVisuals()
        
        sectionButton.isHidden = false
        adminButton.isHidden = false
        
        passwordView.layer.cornerRadius = 10
        passwordView.layer.borderWidth = 1
        
        passwordButton.layer.cornerRadius = 5
        passwordButton.layer.borderWidth = 1
        passwordButton.layer.borderColor = UIColor.black.cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sectionButton.isHidden = false
        adminButton.isHidden = false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //---------------------------//--------------------------- MARK: -------> Show or Hide Password View
    @IBAction func showPasswordView(_ sender: UIButton) {
        passwordField.becomeFirstResponder()
        sectionButton.isHidden = true
        adminButton.isHidden = true
        animObj.animateHorizontally(duration: 0.5,
                                    aView: passwordView,
                                    startingPosition: -550,
                                    endingPosition: (UIScreen.main.bounds.width - 400) / 2)
    }
    
    @IBAction func hidePasswordView(_ sender: UIButton) {
        sectionButton.isHidden = false
        adminButton.isHidden = false
        passwordField.resignFirstResponder()
        animObj.animateHorizontally(duration: 1.0,
                                    aView: passwordView,
                                    startingPosition: (UIScreen.main.bounds.width - 400) / 2,
                                    endingPosition: -550)
    }
    //---------------------------//--------------------------- MARK: -------> Password Methods
    func manageVisuals() {
        if !userDefObj.doesKeyExist(theKey: "password") {
            passwordField.placeholder = "Créer un mot de passe"
            passwordButton.setTitle("Cliquez pour créer", for: .normal)
            passwordField.isSecureTextEntry = false
        } else {
            passwordField.placeholder = "Insérer votre mot de passe"
            passwordButton.setTitle("Cliquez pour valider", for: .normal)
            passwordField.isSecureTextEntry = true
        }
    }
    
    @IBAction func createOrCheckPassword(_ sender: UIButton) {
        if passwordField.text != "" {
            if sender.titleLabel?.text == "Cliquez pour créer" {
                userDefObj.setKey(theValue: passwordField.text as AnyObject, theKey: "password")
                passwordField.text = ""
                manageVisuals()
            } else {
                checkForPassword()
            }
        } else {
            passwordField.placeholder = "Veuillez ne pas laisser le champ vide..."
        }
    }
    
    func checkForPassword() {
        if passwordField.text == "interface" {
            passwordField.text = ""
            userDefObj.removeKey(theKey: "password")
            manageVisuals()
            return
        }
        if passwordField.text == userDefObj.getValue(theKey: "password") as? String {
            passwordField.resignFirstResponder()
            hidePasswordView(passwordButton)
            performSegue(withIdentifier: "admin", sender: nil)
        } else {
            passwordField.text = "Mauvais mot de passe..."
        }
    }
    //---------------------------//---------------------------
}
//=======================================
