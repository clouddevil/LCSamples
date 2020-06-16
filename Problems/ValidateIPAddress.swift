// 468. Validate IP Address

import Foundation

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

class ValidateIPAddress0 {
    func validIPAddress(_ IP: String) -> String {
        if isIPv4(IP) {
            return "IPv4"
        } else if isIPv6(IP) {
            return "IPv6"
        } else {
            return "Neither"
        }
    }

    private func isIPv4(_ IP: String) -> Bool {
        let validRangeOfCharacters = "0123456789."
        let invertedCharacterSet = CharacterSet(charactersIn: validRangeOfCharacters).inverted
        guard IP.rangeOfCharacter(from: invertedCharacterSet) == nil else { return false }
        let groups = IP.split(separator: ".", maxSplits: 20, omittingEmptySubsequences: false).map({ String($0) })
        guard groups.count == 4,
            groups.filter({ $0.hasPrefix("0") && $0.count != 1 }).isEmpty,
            groups.filter({ Int($0) != nil && Int($0)! >= 0 && Int($0)! < 256 }).count == 4 else { return false }
        return true
    }

    private func isIPv6(_ IP: String) -> Bool {
        let validRangeOfCharacters = "0123456789:abcdefABCDEF"
        let invertedCharacterSet = CharacterSet(charactersIn: validRangeOfCharacters).inverted
        guard IP.rangeOfCharacter(from: invertedCharacterSet) == nil else { return false }
        let groups = IP.split(separator: ":", maxSplits: 20, omittingEmptySubsequences: false).map({ String($0) })
        guard groups.count == 8,
            groups.filter({ $0.count > 4 }).isEmpty,
            groups.filter({ $0.isEmpty }).isEmpty else { return false }
        return true
    }
}
