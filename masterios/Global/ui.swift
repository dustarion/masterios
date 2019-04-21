//
//  ui.swift
//  masterios
//
//  Created by Dalton Prescott Ng on 16/3/19.
//  Copyright © 2019 masterapp. All rights reserved.
//

import UIKit

//extension UIView {
//    func setGradient(_ index: Int = 0) {
//        guard let gradientLayer = self.layer as? CAGradientLayer else { return }
//        gradientLayer.colors = getGradientDarkText(index)
//    }
//}

// Colours
public let newSetCardBackgroundColour = UIColor(red:0.15, green:0.15, blue:0.15, alpha:1.0)
public let yellowTintColour = UIColor(red:0.97, green:0.91, blue:0.11, alpha:1.0)

public func showNewSetTabOptions(sender: UIViewController) {
    let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    alert.view.tintColor = yellowTintColour
    
    
    let subview = alert.view.subviews.first! as UIView
    let alertContentView = subview.subviews.first! as UIView
    alertContentView.backgroundColor = .black  //UIColor.blackColor()
    alert.view.layer.cornerRadius = 15
    
    //.black//newSetCardBackgroundColour
    //alert.preferredStyle = //UIActionSheetStyle.blackTranslucent
    
    alert.addAction(UIAlertAction(title: "New Study Set", style: .default , handler:{ (UIAlertAction) in
        // Transition New Set
        sender.performSegue(withIdentifier: "toNewSet", sender: sender)
    }))
    
    alert.addAction(UIAlertAction(title: "Create Folder", style: .default , handler:{ (UIAlertAction) in
        // Draft
        // Does nothing for now
    }))
    
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction) in
        // Cancel
    }))
    
    sender.present(alert, animated: true, completion: {
        // Done
    })
}

extension UIView {
    
    // Extensions
    func searchVisualEffectsSubview() -> UIVisualEffectView? {
        
        if let visualEffectView = self as? UIVisualEffectView {
            return visualEffectView
        }
            
        else {
            for subview in subviews {
                
                if let found = subview.searchVisualEffectsSubview() {
                    return found
                }
            }
        }
        
        return nil
    }
    
    // Shadow Extensions
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet:  CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // Fix In View (Nibs)
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
    
}

extension UITextField {
    func setBottomWhiteBorder() {
        self.layer.backgroundColor = UIColor.black.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        super.layoutSubviews()
    }
}

extension UITextView {
    func setBottomWhiteBorder() {
        self.layer.backgroundColor = UIColor.black.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
    func setBottomBorderColour(_ colour: UIColor) {
        self.layer.backgroundColor = UIColor.black.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = colour.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
    func resetBottomBorder() {
        if self.layer.shadowColor != UIColor.white.cgColor {
            self.layer.shadowColor = UIColor.white.cgColor
        }
    }
    
    func resetPlaceholder() {
        if self.textColor == .lightGray {
            self.text = nil
            self.textColor = .white
        }
    }
    
    var numberOfCurrentlyDisplayedLines: Int {
        let size = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        return Int(((size.height - layoutMargins.top - layoutMargins.bottom) / font!.lineHeight))
    }
    
    /// Removes last characters until the given max. number of lines is reached
    func removeTextUntilSatisfying(maxNumberOfLines: Int) {
        while numberOfCurrentlyDisplayedLines > (maxNumberOfLines) {
            text = String(text.dropLast())
            layoutIfNeeded()
        }
    }
    
}

extension UIImageView {
    
    func setRounded() {
        let radius = self.frame.width/2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}

extension String {
    subscript(value: NSRange) -> Substring {
        return self[value.lowerBound..<value.upperBound]
    }
}

extension String {
    subscript(value: CountableClosedRange<Int>) -> Substring {
        get {
            return self[index(at: value.lowerBound)...index(at: value.upperBound)]
        }
    }
    
    subscript(value: CountableRange<Int>) -> Substring {
        get {
            return self[index(at: value.lowerBound)..<index(at: value.upperBound)]
        }
    }
    
    subscript(value: PartialRangeUpTo<Int>) -> Substring {
        get {
            return self[..<index(at: value.upperBound)]
        }
    }
    
    subscript(value: PartialRangeThrough<Int>) -> Substring {
        get {
            return self[...index(at: value.upperBound)]
        }
    }
    
    subscript(value: PartialRangeFrom<Int>) -> Substring {
        get {
            return self[index(at: value.lowerBound)...]
        }
    }
    
    func index(at offset: Int) -> String.Index {
        return index(startIndex, offsetBy: offset)
    }
}
