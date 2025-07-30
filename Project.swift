import ProjectDescription

let project = Project(
    name: "SwiftAI",
    packages: [
        .package(url: "git@github.com:SimplyDanny/SwiftLintPlugins.git", from: "0.59.1"),
        .package(url: "git@github.com:apple/swift-docc-plugin.git", from: "1.4.3"),
        .package(url: "git@github.com:apple/swift-argument-parser.git", from: "1.2.2"),
        .package(url: "git@github.com:janodevorg/OpenAIClient.git", from: "2.0.0"),
        .package(url: "git@github.com:janodevorg/Keychain.git", from: "1.0.0")
    ],
    settings: .settings(base: [
        "SWIFT_VERSION": "6.0",
        "IPHONEOS_DEPLOYMENT_TARGET": "18.0",
        "MACOSX_DEPLOYMENT_TARGET": "15.0",
        "ENABLE_MODULE_VERIFIER": "YES"
    ]),
    targets: [
        .target(
            name: "SwiftAI",
            destinations: [.mac],
            product: .commandLineTool,
            bundleId: "dev.jano.swiftai",
            sources: ["Sources/Main/**"],
            scripts: [
                swiftlintScript()
            ],
            dependencies: [
                .package(product: "ArgumentParser", type: .runtime),
                .package(product: "Keychain", type: .runtime),
                .package(product: "OpenAIClient", type: .runtime)
            ]
        )
    ],
    schemes: [
       Scheme.scheme(
           name: "SwiftAI",
           shared: true,
           buildAction: BuildAction.buildAction(
               targets: [TargetReference.target("SwiftAI")]
           )
       )
    ]
)

func swiftlintScript() -> ProjectDescription.TargetScript {
    let script = """
    #!/bin/sh

    # Check swiftlint
    command -v /opt/homebrew/bin/swiftlint >/dev/null 2>&1 || { echo >&2 "swiftlint not found at /opt/homebrew/bin/swiftlint. Aborting."; exit 1; }

    # Create a temp file
    temp_file=$(mktemp)

    # Gather all modified and staged files within the Sources directory
    git ls-files -m Sources | grep ".swift$" > "${temp_file}"
    git diff --name-only --cached Sources | grep ".swift$" >> "${temp_file}"

    # Make list of unique and sorted files
    counter=0
    for f in $(sort "${temp_file}" | uniq)
    do
        eval "export SCRIPT_INPUT_FILE_$counter=$f"
        counter=$(expr $counter + 1)
    done

    # Lint
    if [ $counter -gt 0 ]; then
        export SCRIPT_INPUT_FILE_COUNT=${counter}
        /opt/homebrew/bin/swiftlint autocorrect --use-script-input-files
    fi
    """
    return .post(script: script, name: "Swiftlint", basedOnDependencyAnalysis: false, runForInstallBuildsOnly: false, shellPath: "/bin/zsh")
}