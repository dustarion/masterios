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
