[![Swift](https://github.com/janodevorg/SwiftAI/actions/workflows/release.yml/badge.svg)](https://github.com/janodevorg/SwiftAI/actions/workflows/swift.yml) [![MIT license](http://img.shields.io/badge/license-MIT-lightgrey.svg)](http://opensource.org/licenses/MIT)

# SwiftAI

Example of CLI tool using the [OpenAIClient](https://github.com/janodevorg/OpenAIClient) library.

## Install with brew
```bash
# install with brew
% brew tap janodevorg/tap
% brew install swiftai
```

## Usage
```bash
# add credentials to the keychain
% swiftai set-credentials --api-key "cafebabe" --organization-id "deadbeef"

# request a completion
% swiftai stream-completion "write a 5 line poem about spring" --model "text-davinci-002" 

I can't wait for the warmer weather
And the days that are longer and brighter
I'm so sick of being cooped up inside
I just want to go outside and have some fun
Spring is finally here, and I couldn't be happier
```

## Help
```bash
% swiftai --help
OVERVIEW: OpenAI client.

USAGE: swiftai <subcommand>

OPTIONS:
  -h, --help              Show help information.

SUBCOMMANDS:
  completion              Requests a completion.
                          Try this: swiftai completion "will humans self destruct?" --model "text-davinci-002"
  set-credentials         Stores OpenAI credentials in the keychain.
                          Try this: swiftai set-credentials --api-key "cafebabe" --organization-id "deadbeef"
  stream-completion       Requests a completion with streaming.
                          Try this: swiftai stream-completion "write a poem about spring" --model "text-davinci-002"

  See 'swiftai help <subcommand>' for detailed help.
```

## Building manually

```
swift run
alias srtt='./.build/arm64-apple-macosx/debug/srtt'
```
