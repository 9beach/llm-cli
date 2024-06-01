# llm-cli

`llm-cli` is a command-line toolkit offering a suite of commands for seamless interaction with popular language model APIs.

`llm-cli` requires an API key from one of the following large language model providers: Google Gemini, DeepL, or Claude AI.

## Installation

First, install `jq`.

```sh
# For Ubuntu users
sudo apt-get install jq

# For macOS users using Homebrew
brew install jq
```

Then, paste the commands below in your favorite terminal.

```sh
sudo curl -L https://raw.githubusercontent.com/9beach/llm-cli/main/gemini-cli -o /usr/local/bin/gemini-cli
sudo curl -L https://raw.githubusercontent.com/9beach/llm-cli/main/claude-cli -o /usr/local/bin/claude-cli
sudo curl -L https://raw.githubusercontent.com/9beach/llm-cli/main/deepl-cli -o /usr/local/bin/deepl-cli
sudo curl -L https://raw.githubusercontent.com/9beach/llm-cli/main/lt-llm-cli -o /usr/local/bin/lt-llm-cli
sudo chmod a+rx /usr/local/bin/gemini-cli /usr/local/bin/claude-cli /usr/local/bin/deepl-cli /usr/local/bin/lt-llm-cli
```

## Usage

### `claude-cli`

```sh
export ANTHROPIC_API_KEY="your-api-key-here"
cat my-text | claude-cli "refine the sentence"
```

An example output:

```text
The relationship between screen usage and sleep quality is more complex than 
previously thought, according to recent findings from sleep experts.
```

In macOS, `pbpaste` outputs the content from the clipboard. For example:

```sh
pbpaste | claude-cli "What do you think?"
```

In Linux, `xclip -selection clipboard -o` outputs the content from the clipboard. For example:

```sh
xclip -selection clipboard -o | claude-cli "translate to korean"
```

The `claude-cli` automatically recognizes translation requests when the execution argument is two characters long. Therefore, if `ko` is given, it internally changes to `translate to ko without comment`. The same applies to `gemini-cli`.

```sh
cat my-text | claude-cli ko
```

### `gemini-cli`

```sh
export GEMINI_API_KEY="your-api-key-here"
cat my-text | gemini-cli "hi"
```

An example output:

```text
## भाग एक

## अध्याय I
## मोरेल्स का प्रारंभिक विवाहित जीवन

"बॉटम्स" "नरक पंक्ति" का उत्तराधिकारी बना। नरक पंक्ति झोपड़ियों का एक ऐसा समूह था जो ग्रीनहिल लेन पर नाले के किनारे पर स्थित था। वहाँ उन कोयला खनिकों रहते थे जो दो खेतों में स्थित छोटे कोयले के खदानों में काम करते थे।
```

You can try many things. For example:

```sh
cat my-text | gemini-cli "Is this correct?"
```

### `deepl-cli`

The `deepl-cli` only performs translation, unlike `gemini-cli` and `claude-cli`, and the parameter for specifying the language must be two letters.

```sh
export DEEPL_API_KEY="your-api-key-here"
cat my-text | deepl-cli KO
```

An example output:

```text
파트 1

제1장
모렐의 초기 결혼 생활

"더 바텀스"는 "헬 로우"로 이어졌습니다. 헬 로우는 그린힐 레인의 시냇가에 있는 초가집으로 불룩하게 튀어나온 오두막집들이 모여 있는 곳이었어요. 두 밭 떨어진 작은진 구덩이에서 일하는 콜리어들이 그곳에 살았습니다.
```

DeepL API supports many languages. Please visit the [supported languages](https://developers.deepl.com/docs/resources/supported-languages) page for more information.

### `lt-llm-cli`

For exceptionally lengthy texts, you can utilize `lt-llm-cli`, which efficiently processes the content by dividing it into smaller segments and submitting them multiple times.


```sh
cat very-long-text | lt-llm-cli deepl-cli KO > very-long-text.ko
```

To customize the number of lines per submission and the interval between each submission, you can set the environment variables `LT_LINES` and `LT_SLEEP_SEC`, respectively, allowing you to fine-tune the performance according to your specific requirements. By default, sentences that fail to translate will also be output. To prevent this, set `LT_FAILED_OUTPUT=no`.

In the example below, `lt-llm-cli` submits text in chunks of 200 lines per request. To view the default values for various parameters, please refer to the [lt-llm-cli source code](https://github.com/9beach/llm-cli/blob/main/lt-llm-cli#L12).

```sh
cat very-long-text | LT_LINES=200 lt-llm-cli deepl-cli KO > very-long-text.ko
```

```text
cat very-long-text | LT_LINES=2 LT_SLEEP_SEC=0 LT_FAILED_OUTPUT=no lt-llm-cli gemini-cli "Translate to Hungarian." > very-long-text.hu
```

```text
cat very-long-text | lt-llm-cli gemini-cli "Translate to Hindi." > very-long-text.hi
```

`lt-llm-cli` submits 100 lines at a time in the example below.

```text
cat very-long-text | LT_LINES=100 lt-llm-cli gemini-cli "Translate to Hindi." > very-long-text.hi
```
