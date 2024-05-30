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

sudo chmod a+rx /usr/local/bin/gemini-cli /usr/local/bin/claude-cli /usr/local/bin/lt-llm-cli
```

## Usage

### `claude-cli`

```sh
$ export ANTHROPIC_API_KEY="Your-API-Key"
$ cat my-text | claude-cli "Translate to Hungarian."
ELSŐ RÉSZ

I. FEJEZET
A MOREL CSALÁD KORAI HÁZASÉLETE

A "Bottoms" követte a "Hell Row"-t. A Hell Row egy zsúptetős, kidomborodó házikókból álló tömb volt, amely a patak partján állt a Greenhill Lane-en. Itt éltek a szénbányászok, akik a két mezőnyire lévő kis gin-aknákban dolgoztak. A patak az égerfa alatt futott, alig szennyezve ezektől a kis bányáktól, amelyeknek a szénét szamarak vonták a felszínre, fáradtan körbe-körbe járva egy gin körül. Az egész vidéken mindenütt ugyanilyen aknák voltak, amelyek közül néhányat még II. Károly idejében is műveltek. A szénbányászok és a szamarak hangyaként turkáltak a földbe, furcsa halmokat és kis fekete foltokat hagyva a kukoricaföldek és rétek között. Ezeknek a szénbányászoknak a kunyhói, tömbökben és párokban itt-ott, együtt a harisnyakötők szórványos farmjaival és otthonaival, amelyek a plébánián kóboroltak, alkották Bestwood faluját.
```

### `gemini-cli`

```sh
$ export GEMINI_API_KEY=="Your-API-Key"
$ cat my-text | gemini-cli "Translate to Hindi."
## भाग एक

## अध्याय 1
## मोरल्स का प्रारंभिक वैवाहिक जीवन

"बॉटम्स" "हॅल रो" की जगह ले लिया। हॅल रो हरित पहाड़ी लेन पर, नाले के किनारे स्थित, झोंपड़ी-जैसे, उभरे हुए घरों काएक ब्लॉक था। वहां वे कोयला खनिक रहते थे जो दो खेतों दूर छोटे जिन-पिट में काम करते थे। नाला एल्डर के पेड़ों के नीचे सेबहता था, जो इन छोटी खानों से मुश्किल से ही दूषित था, जिनका कोयला गधे द्वारा सतह पर लाया जाता था, जो एक जिन के चारोंओर एक सर्कल में थकावट से चलते थे। और इसी तरह के गड्ढे पूरे ग्रामीण इलाके में थे, जिनमें से कुछ चार्ल्स द्वितीय के समय से काम कर रहे थे, कुछ कोयला खनिक और गधे चींटियों की तरह पृथ्वी में खुदाई करते थे, मक्का के खेतों और घास केमैदानों में अजीबोगरीब टीले और छोटे काले स्थान बनाते थे। और इन कोयला खनिकों के कॉटेज, ब्लॉक और जोड़े में यहां-वहां, स्टॉकिंगर के अनोखे खेतों और घरों के साथ, पल्ली के ऊपर फैले हुए, बेस्टवुड गांव का निर्माण करते थे।
```

### `deepl-cli`

```sh
$ export DEEPL_API_KEY="Your-API-Key"
$ cat my-text | ./deepl-cli KO
파트 1

제1장
모렐의 초기 결혼 생활

"더 바텀스"는 "헬 로우"로 이어졌습니다. 헬 로우는 그린힐 레인의 시냇가에 있는 초가집으로 불룩하게 튀어나온 오두막집들이 모여 있는 곳이었어요. 두 밭 떨어진 작은진 구덩이에서 일하는 콜리어들이 그곳에 살았습니다. 개울은 오리나무 아래를 흐르고 있었는데, 이 작은 광산에서 석탄을 캐는 당나귀가 진 주위를 빙빙 돌며 지친 걸음으로 지표면으로 끌어올렸습니다. 그리고 시골 곳곳에 똑같은 구덩이가 있었는데, 그중일부는 찰스 2세 시대에 작업했던 것으로, 몇 개의 콜리어와 당나귀가 개미처럼 땅속으로 파고들어 옥수수밭과 초원 사이에 기괴한 언덕과 작은 검은 곳을 만들었습니다.그리고 이 탄광 노동자들의 오두막은 여기저기서 블록과 쌍을 이루며 교구 너머에 있는 이상한 농장 및 축산업자들의 집과 함께 베스트우드 마을을 형성했습니다.
```

DeepL API supports many languages. Please visit the [supported languages](https://developers.deepl.com/docs/resources/supported-languages) page for more information.

### `lt-llm-cli`

For very long texts, you can use lt-llm-cli. It submits a long text multiple times by splitting it into smaller parts.

```sh
cat very-long-text | lt-llm-cli deepl-cli KO > very-long-text.ko
cat very-long-text | lt-llm-cli claude-cli "Translate to Hungarian."
cat very-long-text | lt-llm-cli claude-cli "Translate to Hungarian."
```
