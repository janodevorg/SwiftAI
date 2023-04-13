import OpenAIClient

func makeClient() throws -> OpenAIClient {
    guard let credentials = try Credentials.get(), !credentials.isEmpty else {
        throw MissingCredentials()
    }
    let client = OpenAIClient(log: .error).configure(apiKey: credentials.apiKey, organizationId: credentials.organizationId)
    return client
}
