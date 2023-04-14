# SwiftAI

Example of CLI tool using the OpenAIClient library. I only implemented commands for completion and stream-completion.

## How to run

TLDR
```
swift run
alias ai='./.build/arm64-apple-macosx/debug/swiftai'
ai completion "write a 5 line poem about spring" --model "text-davinci-002"
ai stream-completion "write a 5 line poem about spring" --model "text-davinci-002"
```

First time you’ll get this instruction to fill-in your credentials. You can do so with:
```
swiftai set-credentials --api-key "cafebabe" --organization-id "deadbeef"
```

A longer terminal session:
```
% swift run
Fetching git@github.com:janodevorg/OpenAIAPI.git
...
[168/168] Linking swiftai
Build complete! (9.76s)

% find . -name swiftai 
./.build/arm64-apple-macosx/debug/swiftai

% alias ai='./.build/arm64-apple-macosx/debug/swiftai'
% ai
% ai --help
Compiling plugin GenerateManual...
Building for debugging...
Build complete! (0.12s)
OVERVIEW: OpenAI client.

USAGE: swift-ai <subcommand>

OPTIONS:
  -h, --help              Show help information.

SUBCOMMANDS:
  completion              Requests a completion.
                          Try this: swiftai completion "will humans self destruct?" --model "text-davinci-002"
  stream-completion       Requests a completion with streaming.
                          Try this: swiftai stream-completion "write a poem about spring" --model "text-davinci-002"

  See 'swiftai help <subcommand>' for detailed help.

% ai completion "write a 5 line poem about spring" --model "text-davinci-002" 
Compiling plugin GenerateManual...
Building for debugging...
[5/5] Linking swiftai
Build complete! (0.82s)


I can't wait for the warmer weather
And the days that are longer and brighter
I'm so sick of being cooped up inside
I just want to go outside and have some fun
Spring is finally here, and I couldn't be happier

```
