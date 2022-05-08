
import UIKit
struct HomeScreenCellElements {
    let name: String
    let image: UIImage!
    let controller: UITableViewController
}

class HomeScreenTableViewCell: UITableViewCell {
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorsManager.zbzbTextColor
        label.font = UIFont.italicSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var productImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        
        return image
    }()
    var controller: UITableViewController?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(productImage)
        contentView.backgroundColor = ColorsManager.zbzbBackgroundColor
        setAllConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateValues(element: HomeScreenCellElements) {
        nameLabel.text = element.name
        productImage.image = element.image
    }
    
    private func setAllConstraints() {
       labelConswtraints()
        productImageConstraints()
    }
    
    private func labelConswtraints() {
        let xConstraint = NSLayoutConstraint(
            item: nameLabel,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .centerYWithinMargins,
            multiplier: 1,
            constant: .zero)
        
        let leadingConstraint = NSLayoutConstraint(
            item: nameLabel,
            attribute: .leading,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .leadingMargin,
            multiplier: 1,
            constant: 4)
        
        let traillingConstraint = NSLayoutConstraint(
            item: nameLabel,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: productImage,
            attribute: .leading,
            multiplier: 1,
            constant: -4)
        
        [xConstraint,
         traillingConstraint,
         leadingConstraint].forEach({ $0.isActive = true })
    }
    
    private func productImageConstraints() {
        let topConstraint = NSLayoutConstraint(
            item: productImage,
            attribute: .top,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .topMargin,
            multiplier: 1,
            constant: 4)
        
        let traillingConstraint = NSLayoutConstraint(
            item: productImage,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .trailingMargin,
            multiplier: 1,
            constant: -4)
        
        let bottomConstraint = NSLayoutConstraint(
            item: productImage,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .bottom,
            multiplier: 1,
            constant: -4)
        
        let heighConstraint = NSLayoutConstraint(
            item: productImage,
            attribute: .height,
            relatedBy: .equal,
            toItem: .none,
            attribute: .height,
            multiplier: 1,
            constant: 200)
        
        let widthConstraint = NSLayoutConstraint(
            item: productImage,
            attribute: .width,
            relatedBy: .equal,
            toItem: .none,
            attribute: .width,
            multiplier: 1,
            constant: 200)
        
        [topConstraint,
         bottomConstraint,
         traillingConstraint,
         heighConstraint,
         widthConstraint].forEach({ $0.isActive = true })
    }
}
