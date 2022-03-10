//
//  ViewController.swift
//  Richtext
//
//  Created by Meghna on 08/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblLeftAlignment: UIButton!
    @IBOutlet weak var btnBoldItalic: UIButton!
    @IBOutlet weak var btnUnderLine: UIButton!
    @IBOutlet weak var btnItalic: UIButton!
    @IBOutlet weak var btnBold: UIButton!
    @IBOutlet weak var lblTextLabel: UILabel!
    
    @IBOutlet weak var btnRightAlignment: UIButton!
    @IBOutlet weak var btnCenterAlignment: UIButton!
    @IBOutlet weak var btnJustifieAlignment: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTextLabel.text = "Hello World"
        // Do any additional setup after loading the view.
    }
    @IBAction func btnBoldItalicClick(_ sender: UIButton) {
        
        lblTextLabel.font = lblTextLabel.font.boldItalic
    }
    
    
    @IBAction func btnBold(_ sender: UIButton) {
//        let text = "Hello World".withBoldText(text: "Hello World")
//        lblTextLabel.attributedText =  text
        
        lblTextLabel.font = lblTextLabel.font.bold


    }
    @IBAction func btnItalicClick(_ sender: UIButton) {
        lblTextLabel.font = lblTextLabel.font.italic


    }
    @IBAction func btnUnderLineclick(_ sender: UIButton) {
        lblTextLabel.underline()
    }
    @IBAction func btnLeftAlignmentClick(_ sender: UIButton) {
        lblTextLabel.textAlignment = .left
    }
    @IBAction func btnRightAlignmentClick(_ sender: UIButton) {
        lblTextLabel.textAlignment = .right
    }
    @IBAction func btnJustifiewAlignmentClick(_ sender: UIButton) {
        lblTextLabel.textAlignment = .justified
    }
    @IBAction func btnCenterAlignmentClick(_ sender: UIButton) {
        lblTextLabel.textAlignment = .center
    }
}

extension UILabel {
    func underline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}
extension UIFont {
    var bold: UIFont {
        return with(.traitBold)
    }

    var italic: UIFont {
        return with(.traitItalic)
    }

    var boldItalic: UIFont {
        return with([.traitBold, .traitItalic])
    }



    func with(_ traits: UIFontDescriptor.SymbolicTraits...) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits).union(self.fontDescriptor.symbolicTraits)) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }

    func without(_ traits: UIFontDescriptor.SymbolicTraits...) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(self.fontDescriptor.symbolicTraits.subtracting(UIFontDescriptor.SymbolicTraits(traits))) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }
}
