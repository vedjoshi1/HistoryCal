//
//  UILabel.swift
//  Today2
//
//  Created by Ved Joshi on 12/21/20.
//

import Foundation
import UIKit
extension UILabel {
    
    
    
    func calculateMaxLines() -> Int {
          let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
          let charSize = font.lineHeight
          let text = (self.text ?? "") as NSString
          let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
          let linesRoundedUp = Int(ceil(textSize.height/charSize))
          return linesRoundedUp
      }
    
    
    /// Will auto resize the contained text to a font size which fits the frames bounds
    /// Uses the pre-set font to dynamicly determine the proper sizing
    
    func fitTextToBounds() {
        guard let text = text, let currentFont = font else { return }
        
        if let dynamicFontSize = UIFont.bestFitFontSize(for: text, in: bounds, fontName: currentFont.fontName) {
            font = UIFont(name: currentFont.fontName, size: dynamicFontSize)
        }
    }
  
}
