@preconcurrency import Keychain

struct Credentials {
    private static let apiKeyStore = ValueKeychainStore(accountName: "OpenAI Api Key", accessGroup: "H6G74E7G22.dev.jano.swiftai")
    private static let organizationIdStore = ValueKeychainStore(accountName: "OpenAI Organization ID", accessGroup: "H6G74E7G22.dev.jano.swiftai")
    
    let apiKey: String
    let organizationId: String
    
    var isEmpty: Bool {
        apiKey.isEmpty || organizationId.isEmpty
    }
    
    private init(apiKey: String, organizationId: String) {
        self.apiKey = apiKey
        self.organizationId = organizationId
    }
    
    static func set(apiKey: String, organizationId: String) throws {
        try apiKeyStore.set(apiKey)
        try organizationIdStore.set(organizationId)
    }
    
    static func get() throws -> Credentials? {
        if let apiKey = try apiKeyStore.get(), let organizationId = try organizationIdStore.get() {
            return Credentials(apiKey: apiKey, organizationId: organizationId)
        }
        return nil
    }
}
