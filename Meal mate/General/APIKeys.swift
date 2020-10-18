import Obfuscator
import Foundation

class APIKeys {
    let obfuscator = Obfuscator()

    func getSpoonfulAPIKey() -> String {
        return obfuscator.reveal(key: APIConstants.SPOONFUL_API_KEY)
    }
}

struct APIConstants {
    static let SPOONFUL_API_KEY: [UInt8] = [116, 17, 69, 113, 92, 13, 86, 82, 85, 66, 83, 47, 103, 119, 82, 93, 93, 85, 23, 114, 19, 73, 38, 81, 9, 86, 81, 82, 68, 80, 119, 54]
}
