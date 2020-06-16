import UIKit

class ValidateIPAddress {
    lazy var ip4: String = {
        let s = "([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])"
        return "^(" + s + "\\.){3}" + s + "$"
    }()

    lazy var ip6: String = {
        let s = "([0-9a-fA-F]{1,4})"
        return "^(" + s + "\\:){7}" + s + "$"
    }()

    private func check(_ str: String, _ pattern: String) -> Bool {
        let range = NSRange(location: 0, length: str.count)
        let regex = try! NSRegularExpression(pattern: pattern,
                                             options: NSRegularExpression.Options.caseInsensitive)
        let match = regex.matches(in: str,
                                  options: NSRegularExpression.MatchingOptions.anchored,
                                  range: range)

        if let v = match.first?.range {
            return range == v
        }
        return false
    }

    func validIPAddress(_ IP: String) -> String {
        if check(IP, ip4) {
            return "IPv4"
        } else if check(IP, ip6) {
            return "IPv6"
        } else {
            return "Neither"
        }
    }
}

var s = ValidateIPAddress()
print(s.validIPAddress("172.16.254.1"))
print(s.validIPAddress("2001:0db8:85a3:0:0:8A2E:0370:7334"))
print(s.validIPAddress("256.256.256.256"))
