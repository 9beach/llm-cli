# llm-cli

A command-line toolkit with several commands for interacting with popular language model APIs.

To use the `llm-cli` toolkit, you need at least one API key from Google Gemini, DeepL, or Claude AI.

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
export ANTHROPIC_API_KEY="Your-API-Key"
cat my-text | claude-cli "Translate to Hungarian without comments."
```

An example output:

```text
ELSŐ RÉSZ

I. FEJEZET
A MOREL HÁZASPÁR KORAI HÁZASÉLETE

A "Bottoms" követte a "Hell Row"-t. A Hell Row szalmatetős, kidomborodó viskók tömbjéből állt, amelyek a Greenhill Lane patak partján sorakoztak. Itt éltek a bányászok, akik a két mezővel arrébb lévő kis gin-gödrökben dolgoztak.
```

### `gemini-cli`

```sh
export GEMINI_API_KEY="Your-API-Key"
cat my-text | gemini-cli "Translate to Hindi."
```

An example output:

```text
## भाग एक

## अध्याय I
## मोरेल्स का प्रारंभिक विवाहित जीवन

"बॉटम्स" "नरक पंक्ति" का उत्तराधिकारी बना। नरक पंक्ति झोपड़ियों का एक ऐसा समूह था जो ग्रीनहिल लेन पर नाले के किनारे पर स्थित था। वहाँ उन कोयला खनिकों रहते थे जो दो खेतों में स्थित छोटे कोयले के खदानों में काम करते थे।
```

### `deepl-cli`

```sh
export DEEPL_API_KEY="Your-API-Key"
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

For very long texts, you can use `lt-llm-cli`. It submits long texts multiple times by splitting them into smaller parts. You can override the sleep time and the number of lines per submission with the environment variables `LT_LINES` and `LT_SLEEP_SEC`.

```sh
cat very-long-text | lt-llm-cli deepl-cli KO > very-long-text.ko
```

`lt-llm-cli` submits 200 lines at a time in the code below. To check the default values, please refer to `/usr/local/bin/lt-llm-cli`.

```sh
cat very-long-text | LT_LINES=200 lt-llm-cli deepl-cli KO > very-long-text.ko
```

```text
cat very-long-text | lt-llm-cli claude-cli "Translate to Hungarian." > very-long-text.hu
```

```text
cat very-long-text | lt-llm-cli gemini-cli "Translate to Hindi." > very-long-text.hi
```

`lt-llm-cli` submits 100 lines at a time in the code below.

```text
cat very-long-text | LT_LINES=100 lt-llm-cli gemini-cli "Translate to Hindi." > very-long-text.hi
```
