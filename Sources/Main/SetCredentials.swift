@preconcurrency import ArgumentParser
import Foundation

/// Set Credentials.
struct SetCredentials: AsyncParsableCommand {
    static let configuration = CommandConfiguration(abstract:
        """
        Stores OpenAI credentials in the keychain.
        Try this: swiftai set-credentials --api-key "cafebabe" --organization-id "deadbeef"
        """
    )

    @Option(help: "OpenAI API Key.")
    var apiKey: String

    @Option(help: "Organization ID")
    var organizationId: String

    func validate() throws {
        guard !apiKey.isEmpty else {
            throw ValidationError("'<apiKey>' is required.")
        }
        guard !organizationId.isEmpty else {
            throw ValidationError("'<organizationId>' is required.")
        }
    }

    mutating func run() async throws {
        try Credentials.set(apiKey: apiKey, organizationId: organizationId)
        
        guard let credentials = try Credentials.get() else {
            throw InternalError(message: "Couldn’t read credentials from the keychain.")
        }
        guard credentials.apiKey == apiKey else {
            throw InternalError(message: "Attempted to store API key \(apiKey) but the keychain contains \(credentials.apiKey).")
        }
        guard credentials.organizationId == organizationId else {
            throw InternalError(message: "Attempted to store Organization ID \(organizationId) but the keychain contains \(credentials.organizationId).")
        }
    }
}
