import Foundation

struct InternalError: Error, CustomStringConvertible {
    private let message: String
    init(message: String) {
        self.message = message
    }
    var description: String {
        message
    }
}
