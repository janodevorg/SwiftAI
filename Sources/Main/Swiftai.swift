@preconcurrency import ArgumentParser
import OpenAIClient

@main
struct Swiftai: AsyncParsableCommand {
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
          print("'swiftai' isn't supported on this platform.")
          return
        }
        
        guard let credentials = try Credentials.get(), !credentials.isEmpty else {
            throw MissingCredentials()
        }

        print("Try --help")
    }
}
