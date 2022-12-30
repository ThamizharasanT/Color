
import Foundation
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    convenience init?(hexString: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        guard let int = Scanner(string: hexSanitized).scanInt32(representation: .hexadecimal) else { return nil }
        let a, r, g, b: Int32
        switch hexSanitized.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)  // RGB (12-bit)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)                    // RGB (24-bit)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)       // ARGB (32-bit)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(a) / 255.0)
    }
    
    convenience init?(hsb: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hsb.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        guard let int = Scanner(string: hexSanitized).scanInt32(representation: .hexadecimal) else { return nil }
        let a, r, g, b: Int32
        switch hexSanitized.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)  // RGB (12-bit)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)                    // RGB (24-bit)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)       // ARGB (32-bit)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r), green: CGFloat(g) , blue: CGFloat(b), alpha: CGFloat(a))
        
    }
}

extension Int{
    var rgbVal: UIColor{
        let iBlue = self & 0xFF
        let iGreen =  (self >> 8) & 0xFF
        let iRed =  (self >> 16) & 0xFF
        let iAlpha =  (self >> 24) & 0xFF
        return UIColor.init(red: CGFloat(iRed), green: CGFloat(iGreen),
                  blue: CGFloat(iBlue), alpha: CGFloat(iAlpha))
    }
}

extension UIColor{
    static let BGWhiteToBlack = UIColor(named: "BGWhiteToBlack")!
    static let BGBlackToWhite = UIColor(named: "BGBlackToWhite")!
    static let BGBorderGrey = UIColor(named: "BGBorderGrey")!
    static let BGWhite = UIColor.white
    static let BGGrey = UIColor(named: "BGGrey")!
    static let BGRed = UIColor(named: "BGRed")!
    
    
    static let FCWhiteToBlack = UIColor(named: "FCWhiteToBlack")!
    static let FCBlackToWhite = UIColor(named: "FCBlackToWhite")!
    static let FCPurple = UIColor(named: "FCPurple")!
    
    static let BottomSheetBGColor = UIColor(hexString: "#0F0F0F")?.withAlphaComponent(0.6)
}

extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}

