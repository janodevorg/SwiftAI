import OpenAIClient

private struct MissingCredentials: Error, CustomStringConvertible {
    var description: String {
        """
        👉 This tool needs your OpenAI credentials.
        
        1. Get your API key from https://platform.openai.com/account/api-keys
        2. Get your organization Id from https://platform.openai.com/account/org-settings
        3. Then add the credentials to the keychain with:
             SwiftAI set-credentials --api-key "cafebabe" --organization-id "deadbeef"
        
        Your credentials will be stored in the default keychain as follows:
          Name: 'OpenAI Api Key'          Kind: 'application password'
          Name: 'OpenAI Organization ID'  Kind: 'application password'

        """
    }
}

func makeClient() throws -> OpenAIClient {
    guard let credentials = try Credentials.get(), !credentials.isEmpty else {
        throw MissingCredentials()
    }
    let client = OpenAIClient(log: .error).configure(apiKey: credentials.apiKey, organizationId: credentials.organizationId)
    return client
}
