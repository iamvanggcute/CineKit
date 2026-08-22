import Foundation
enum APIConfig {
    static var readAccessToken: String {
        Bundle.main.object(
            forInfoDictionaryKey: "API_READ_ACCESS_TOKEN"
        ) as? String ?? ""
    }
}
