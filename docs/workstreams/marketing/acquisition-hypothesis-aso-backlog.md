# Acquisition Hypothesis / ASO Backlog

- Task ID：`P0-MKT-05`
- 版：v1.0（Product Lead Review済み）
- 更新日：2026年8月16日
- 対象：Phase 2 Product Validationの獲得準備
- 入力：[`Product Validation Brief`](../product/product-validation-brief.md)、[`Audience / Occasion Matrix`](audience-occasion-matrix.md)、[`Brand / Positioning Guardrail`](brand-positioning-guardrail.md)

## 目的と制約

Phase 2でPrimary UserをiOS MLPの実利用まで獲得するため、広告→App Store→Installの仮説と準備項目を先に洗い出す。獲得結果はChannel ValidationとしてProduct Valueと分けて評価する。

- 本書は媒体、予算、配信セグメント、App Store Product Page比較を決定しない。これらは`D-014`で決める
- Phase 0.5の勝ち訴求をPhase 2へ無条件に流用せず、実際のMLP機能・画面・品質へ合わせて作り直す
- Instagramは独立メディアであり、Phase 2獲得チャネルへ含めない。接続には別途Human判断が必要
- App Storeの現行仕様・審査・素材要件は制作時に再確認し、P1 Legal / `D-011/012`へ接続する
- Organic / Paid、妊娠期 / 出生後、広告 / Store / Install後を混在集計しない

## Phase 2獲得仮説

| ID | 流入文脈・対象 | 入口の問題／価値仮説 | 広告・発見面で伝えること | App Storeで証明すること | Install後の期待一致 | Channel支持の手掛かり | 反証・不明条件 |
|---|---|---|---|---|---|---|---|
| `AQ-01` 妊娠期の見通し | 妊娠後期。出生後の行事を先回りしたい | 出産後すぐの行事と準備の見通しが得られるなら、専用アプリを試す | 出産後の行事を今から見通せること。育児全般アプリではないこと | 対象期間、実際に提供する見通し体験、Local-first等の前提 | 妊娠期から出生後へ価値が続く。入力・更新方法は`D-004`採用内容と一致 | 広告到達→Store到達→Installが事前基準を満たし、妊娠期コホートを識別できる | Storeで急減、期待違い、比較母数不足。出生後Retentionは本仮説の支持に使わない |
| `AQ-02` 出生後の目前行事 | 出生後0〜11か月。直近行事の時期・やり方を調べている | 検索の代わりに家庭ごとの次の行事をまとめて確認できるなら、専用アプリを試す | 次の赤ちゃん行事、一般的目安、調べ直し削減 | 日付一覧だけでなく、意味・判断・準備まで提供する実画面 | Onboarding→行事生成→最初の詳細へ、広告で約束した価値が続く | 同じ文脈で広告・Store・Installの各段階が事前基準を満たす | 検索記事だけを期待、Storeで単なるカレンダーと認識、Install後に入口価値へ到達しない。後者はProduct側で別判定 |
| `AQ-03` 準備の緊急度 | 近い行事に実施意向があり、決めること・準備が残る | 準備の順番と次に決めることが分かるなら、行事管理アプリを試す | 日付だけでなく準備まで支援すること | MLPで実提供する準備情報と導線。予約・購買・提携を提供中と見せない | 行事をどう扱うかの判断→準備情報へ到達できる | 行事までの期間を比較可能にした層でStore到達・Installが観測される | 実施意向・緊急度を識別できない、予約代行等の誤認が多い、母数不足なら不明 |
| `AQ-04` 日本文化体験 | 妊娠後期〜出生後11か月。季節文化を家族で無理なく体験したい | 大きな行事の間にも負担の少ない文化体験が見つかるなら試す | 日本の行事を赤ちゃんとの毎日に取り入れる価値 | 家族固有行事がCore、季節文化がExtendedであること。`D-003/004`採用範囲のみ表示 | 季節文化の発見がCore体験を邪魔せず、実際の採用機能と一致 | 対象時期で広告・Storeの理解が一貫し、Installまで到達する | 雑学・教育アプリだけを期待、義務感を生む、Core Value層を獲得できない場合はChannel仮説として弱い |
| `AQ-05` Organic検索 | App Store等で課題・カテゴリ・行事関連語から自発的に探す層 | ユーザー語とStore metadata・画面が一致すれば、広告外から対象層へ到達できる | Organicのため広告なし。検索語候補は未検証仮説として扱う | アプリ名・副題・説明・画像が検索意図と実体験に一致 | Organic cohortとしてInstall後のProduct観測へ接続 | Paidと分離して検索表示→Product Page→Installが観測可能 | 流入元・検索語が取得不能、件数不足、ブランド名流入との分離不能なら不明 |

`AQ-01〜05`の採用、優先順位、統合、除外は`D-014`とProduct-validation charterで決める。本書にあること自体は、配信または比較の承認を意味しない。

## ファネルとボトルネックの分離

| 区間 | 主な問い | 最低限必要な識別 | 低い場合に最初に疑うこと | Product判定との境界 |
|---|---|---|---|---|
| 配信／発見→広告反応 | 入口の問題・価値が対象へ伝わるか | 訴求、クリエイティブ、媒体候補、対象候補、版 | 表現品質、配信条件、媒体適合、対象差 | 低反応だけでProduct不成立としない |
| 広告反応→App Store到達 | クリック後に正しいStoreへ遷移したか | campaign / creative / landing対応、失敗・欠測 | リンク、計測、遷移速度、不一致 | 到達不良をProduct指標へ混ぜない |
| App Store到達→Install | Store上で期待・信頼・提供価値が伝わるか | Store page版、流入元、地域・期間、Install | metadata、スクリーンショット、レビュー状況、端末要件、期待不一致 | Install CVRはChannel指標。Activationの代替にしない |
| Install→初回起動 | 技術的・心理的に開始できるか | app版、Store版、install cohort、初回起動 | 互換性、容量、クラッシュ、計測欠損、同意離脱 | 初回起動以降をProductファネルへ引き渡す |
| 初回起動→Activation / Value | 約束した体験へ到達し価値行動があるか | Productイベント、月齢コホート、観測機会 | Onboarding、MLP体験、対象・行事適合 | Product Validationで判定し、広告指標で補完しない |

分母、at-risk開始、観測窓、除外、不明条件、目標値は`D-009`、`P0-DATA-01/05`、`P0-VAL-03`で固定する。

## ASO / App Store準備バックログ

| ID | 区分 | 準備項目 | 成果物・確認点 | 主依存 | 後続Task | 完了の目安 |
|---|---|---|---|---|---|---|
| `ASO-01` | Positioning | Storeで使うPrimary User、問題、約束、非対象 | Positioning / message brief v2。Missionではなく実MLP価値に一致 | Phase 0.5学び、P0-MKT-03、MLP Scope | `P1-MKT-01` | 広告、Store、初回体験の約束が1文で対応する |
| `ASO-02` | Metadata | 名称、副題、説明、キーワード候補、カテゴリ候補 | 候補台帳。検索語は調査前に事実化せず、文字数・仕様は制作時点で再確認 | `ASO-01`、D-011 | `P1-MKT-02` | 各候補に対象意図、優先価値、誤認リスク、採否根拠がある |
| `ASO-03` | Visual | アイコン、スクリーンショット、必要に応じたプレビュー候補 | 画面ごとの主張、実画面、caption、順序、端末別出力一覧 | P1-PROD-02、`ASO-01` | `P1-MKT-02` | 未提供機能がなく、最初の画面群で対象・価値・信頼が伝わる |
| `ASO-04` | Proof | 一般的目安、家庭差、Local-first、Validation Release説明 | 信頼要素・注意書きmap | P1-LEGAL-02、P1-PROD-01 | `P1-MKT-02/04` | 訴求と制約が同時に理解でき、過度な正確性・効果を約束しない |
| `ASO-05` | Page設計 | Default pageと比較候補の広告→Store対応 | Message-to-page map。Product Page比較の採否は`D-014`へ留保 | `D-014`、`ASO-01〜03` | `P1-MKT-02/03` | 採用された訴求ごとに入口とStoreの約束が対応する |
| `ASO-06` | Keyword research | ユーザー語、行事語、課題語、カテゴリ語、競合・代替語の調査計画 | 候補、情報源、関連性、検索意図、難易度等の比較表。利用可能データに応じる | P0-MKT-01、`ASO-02` | `P1-MKT-02` | ブランド語と非ブランド語、妊娠期と出生後の意図を混在させない |
| `ASO-07` | Measurement | 広告版・Store版・App版・期間を対応させる識別設計 | Version / campaign mapping、取得可否、欠測・重複・Organic分類ルール | D-007、P0-DATA-05 | `P1-DATA-01/05` | 広告、Store、Install、初回起動の版対応を再現できる |
| `ASO-08` | Compliance | metadata、画像、Privacy、対象年齢、権利、問い合わせ等の確認 | App Store compliance / claims checklist | D-011/012、P1-LEGAL-01/02 | `P1-LEGAL-03/04` | 公開時点のApple要件とアプリ実態に一致し、権利・表示ブロッカーが0件 |
| `ASO-09` | QA | Store表示、リンク、端末・地域、計測、公開版の確認 | Preflight checklist / evidence | `ASO-02〜08`、P1-PROD-06 | `P1-GATE-01` | 広告から価値行動までの導線と版対応を実端末で確認できる |
| `ASO-10` | Operation | Phase 2中の変更・停止・ロールバック | Change log、許可変更、緊急停止、結果影響の記録方法 | D-014、P0-VAL-03 | `P2-MKT-01/02` | 事前ルール外変更がなく、例外時に評価影響を残せる |

## 必要素材・ページ・計測の最小在庫

### 素材

- 採用訴求ごとの比較可能な広告creative set
- 実画面を使ったスクリーンショット一式とcaption map
- App icon、サポート・問い合わせ案内、必要なブランド素材
- Validation Releaseの範囲、Local-first、一般的目安・家庭差を説明する短文
- 制作元、権利、版、更新日、Claims review状態を持つasset register

### ページ

- 実MLPに一致するDefault App Store page
- `D-014`で採用された場合のみ、訴求別の比較ページまたは同等の比較構造
- Privacy、サポート、問い合わせ、削除・停止説明の公開ページ
- 広告→Store対応表と、公開版／審査版／計測版のversion record

### 計測

- 表示・反応・Store到達・Install・初回起動・Activationの分母鎖
- Paid / Organic、妊娠期 / 出生後、訴求、creative、Store版、App版の識別可否
- App Store側と広告側の集計期間・タイムゾーン・帰属差
- 同意拒否、欠測、重複、自己アクセス、ボット、版混在の扱い
- Product / Channel別の支持・不支持・不明を同じ平均値へ統合しないreporting spec

## D-014へ渡すHuman判断項目

本Taskでは案を決めず、次をDecision Packの入力として渡す。

- Phase 2で採用する広告チャネルと、Organicを含む獲得構成
- 総予算、日次上限、期間、停止条件、追加投資条件
- 妊娠期／出生後、行事緊急度等の配信・分析セグメント
- `AQ-01〜05`の採用・優先順位・統合・除外
- Default pageのみか、訴求別App Store Product Page等を比較するか
- 採用する比較単位、必要観測数、不明条件

## 後続タスクへの入力

- `P0-DATA-05`：ChannelとProductを分けたファネル・版識別・欠測ルール
- `P0-VAL-03`：`AQ-01〜05`の採否、反証、不明、観測条件
- `P1-MKT-01〜03`：実MLPに合わせたPositioning、Store page、広告creative
- `P1-DATA-01/05`：広告・Store・Appの取得方法とversion baseline
- `P1-LEGAL-03/04`：制作時点のApp Store要件、Claims、Privacy、権利確認
- `P2-MKT-01〜03`：設定、変更統制、広告／Store／Installボトルネック分析
