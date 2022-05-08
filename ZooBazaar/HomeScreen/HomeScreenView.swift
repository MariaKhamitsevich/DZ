
import UIKit

class HomeScreenView: UIView {
    
    private lazy var wellcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to ZooBazaar!"
        label.textColor = ColorsManager.zbzbTextColor
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 1
        
        return label
    }()
    
    lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.imageView?.tintColor = ColorsManager.zbzbTextColor
        
        return button
    }()
    
    lazy var basketImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "basket"), highlightedImage: UIImage(named: "basket"))
        image.tintColor = ColorsManager.zbzbTextColor
        
        return image
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.backgroundColor = ColorsManager.zbzbBackgroundColor
        
        return table
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = ColorsManager.zbzbBackgroundColor
        
        addSubview(wellcomeLabel)
        addSubview(settingsButton)
        addSubview(basketImage)
        addSubview(tableView)
        
        setAllConstrains()
        [wellcomeLabel, settingsButton, basketImage, tableView].forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAllConstrains() {
        wellcomeLabelConstrains()
        settingsButtonConstraints()
        basketImageConstraints()
        tableViewConstrains()
    }
    
    private func wellcomeLabelConstrains() {
        let topConstraint = NSLayoutConstraint(
            item: wellcomeLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .topMargin,
            multiplier: 1,
            constant: 56)
        
        let leadingConstraint = NSLayoutConstraint(
            item: wellcomeLabel,
            attribute: .leading,
            relatedBy: .equal,
            toItem: self,
            attribute: .leadingMargin,
            multiplier: 1,
            constant: 24)
        
        let traillingConstraint = NSLayoutConstraint(
            item: wellcomeLabel,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: self,
            attribute: .trailingMargin,
            multiplier: 1,
            constant: -24)
        
        let heighConstraint = NSLayoutConstraint(
            item: wellcomeLabel,
            attribute: .height,
            relatedBy: .equal,
            toItem: wellcomeLabel,
            attribute: .height,
            multiplier: 1,
            constant: 24)
        
        [topConstraint,
         leadingConstraint,
         traillingConstraint,
         heighConstraint].forEach({ $0.isActive = true })
    }
    
    
    private func settingsButtonConstraints() {
        let topConstraint = NSLayoutConstraint(
            item: settingsButton,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .topMargin,
            multiplier: 1,
            constant: 16)
        
        let traillingConstraint = NSLayoutConstraint(
            item: settingsButton,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: self,
            attribute: .trailingMargin,
            multiplier: 1,
            constant: -16)
        
        let heighConstraint = NSLayoutConstraint(
            item: settingsButton,
            attribute: .height,
            relatedBy: .equal,
            toItem: settingsButton,
            attribute: .height,
            multiplier: 1,
            constant: 16)
        
        let widthConstraint = NSLayoutConstraint(
            item: settingsButton,
            attribute: .width,
            relatedBy: .equal,
            toItem: settingsButton,
            attribute: .width,
            multiplier: 1,
            constant: 16)
        
        [topConstraint,
         traillingConstraint,
         heighConstraint,
         widthConstraint].forEach({ $0.isActive = true })
    }
    
    private func basketImageConstraints() {
        let topConstraint = NSLayoutConstraint(
            item: basketImage,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .topMargin,
            multiplier: 1,
            constant: 16)
        
        let traillingConstraint = NSLayoutConstraint(
            item: basketImage,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: settingsButton,
            attribute: .trailingMargin,
            multiplier: 1,
            constant: -24)
        
        let heighConstraint = NSLayoutConstraint(
            item: basketImage,
            attribute: .height,
            relatedBy: .equal,
            toItem: .none,
            attribute: .height,
            multiplier: 1,
            constant: 16)
        
        let widthConstraint = NSLayoutConstraint(
            item: basketImage,
            attribute: .width,
            relatedBy: .equal,
            toItem: .none,
            attribute: .width,
            multiplier: 1,
            constant: 16)
        
        [topConstraint,
         traillingConstraint,
         heighConstraint,
         widthConstraint].forEach({ $0.isActive = true })
    }
    
    private func tableViewConstrains() {
        let topConstraint = NSLayoutConstraint(
            item: tableView,
            attribute: .top,
            relatedBy: .equal,
            toItem: wellcomeLabel,
            attribute: .bottomMargin,
            multiplier: 1,
            constant: 24)
        
        let bottomConstraint = NSLayoutConstraint(
            item: tableView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: self,
            attribute: .bottomMargin,
            multiplier: 1,
            constant: -8)
        
        let leadingConstraint = NSLayoutConstraint(
            item: tableView,
            attribute: .leading,
            relatedBy: .equal,
            toItem: self,
            attribute: .leadingMargin,
            multiplier: 1,
            constant: 8)
        
        let traillingConstraint = NSLayoutConstraint(
            item: tableView,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: self,
            attribute: .trailingMargin,
            multiplier: 1,
            constant: -8)
        
        
        [topConstraint,
         bottomConstraint,
         leadingConstraint,
         traillingConstraint].forEach({ $0.isActive = true })
    }
}
