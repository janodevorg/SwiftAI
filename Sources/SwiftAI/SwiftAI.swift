import ArgumentParser
import OpenAIClient

@main
struct SwiftAI: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "OpenAI client.",
        subcommands: [
            Completion.self,
            SetCredentials.self,
            StreamCompletion.self
        ]
    )

    mutating func run() async throws {
        guard #available(macOS 12.0, *) else {
          print("'swift-ai' isn't supported on this platform.")
          return
        }
        
        guard let credentials = try Credentials.get(), !credentials.isEmpty else {
            throw MissingCredentials()
        }

        print("Try --help")
    }
}
