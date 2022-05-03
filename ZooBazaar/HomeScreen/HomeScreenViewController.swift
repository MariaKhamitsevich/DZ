
import UIKit

protocol SetBackgroundColor: AnyObject {
    func setBackgroundColor(red: Float, green: Float, blue: Float, alpha: Double)
}

class HomeScreenViewController: UIViewController, SetBackgroundColor {
    
    var redShadeOfBackground: Float = 255
    var greenShadeOfBackground: Float = 190
    var blueShadeOfBackGround: Float = 189
    
    
    override func loadView() {
        view = HomeScreenView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = view as? HomeScreenView {
           view.settingsButton.addTarget(self, action: #selector(runToSettings), for: .touchUpInside)
            view.pushingDelegate = self
        }
        
    }
    
    
    @objc func runToSettings(_ sender: UIButton) {
        
        let controller = SettingsViewController()
        controller.backgroundDelegate = self
        controller.view.backgroundColor = view.backgroundColor
        controller.redValue = redShadeOfBackground
        controller.greenValue = greenShadeOfBackground
        controller.blueValue = blueShadeOfBackGround
      present(controller, animated: true)
    }

    
    func setBackgroundColor(red: Float, green: Float, blue: Float, alpha: Double) {
        let backgroundColor = UIColor(red: CGFloat(red / 255), green: CGFloat(green / 255), blue: CGFloat(blue / 255), alpha: alpha)
        view.backgroundColor = backgroundColor
        
        self.redShadeOfBackground = red
        self.greenShadeOfBackground = green
        self.blueShadeOfBackGround = blue
}
}

extension HomeScreenViewController: PushToTable {
    func pushToTable(controller: UITableViewController) {
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
