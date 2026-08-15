# 引継ぎメモ：GYOJI-CHO（まいにち行事カレンダー 〜日本の行事帖〜）

作成日：2026年8月10日  
名称更新：2026年8月11日
事業戦略初版：2026年8月14日
ロードマップ全面更新：2026年8月15日
プロジェクト運用基盤追加：2026年8月15日
Phase 0時間・稼働・費用上限確定：2026年8月16日
GitHub Project・Ruleset有効化：2026年8月16日

---

## 1. 最重要事項

### 現在地

現在は **Phase 0：事業仮説固定**。iOSアプリの実装は未着手。

既存のLPとLINE事前登録導線は存在するが、現在の方針では、**LINE Waitlistの登録率をプロダクト需要の主要な判定材料にしない**。LPはPhase 0.5の少額広告メッセージ検証や、開発状況の案内に再利用できる。

### 最新方針

- Web簡易MVPは実施しない
- Phase 1でiOS Validation Releaseを作る
- Validation ReleaseはMVPではなく、**MLP（Minimum Lovable Product）**として設計する
- Phase 2で広告 → App Store → 実利用を計測し、プロダクト需要を本格判定する
- Product ValidationとChannel Validationを分けて評価する
- Phase 2の後に定性検証を行い、定量＋定性でGo / Pivot / Stopを判断する
- 子どもの情報はLocal-firstを基本とし、初期はアカウント・独自サーバーを持たない

事業全体の最新方針は [`business-roadmap.md`](business-roadmap.md) を正本とする。Phase 0〜2のプロダクト検証詳細は [`business-strategy.md`](business-strategy.md)、実行タスクは [`phase-0-2-execution-plan.md`](phase-0-2-execution-plan.md)、AIエージェント運営は [`ai-agent-operating-model.md`](ai-agent-operating-model.md)、リポジトリ・タスク・品質・権限の運用は [`project-operating-policy.md`](project-operating-policy.md) を正本とする。

---

## 2. プロジェクト概要

### 名称

- **正式名称**：まいにち行事カレンダー 〜日本の行事帖〜
- **プロジェクト名**：GYOJI-CHO

### Mission

> **日本の文化を知って、体験し、心を豊かにする。**

### 最終形

- **日本の子育て行事OS**
- **家族行事の意思決定と準備のプラットフォーム**

### Core Value

> **子どもの情報から、必要な行事を先回りして知らせ、準備まで支援する。**

### Extended Value

> **日本文化を知り、家族で体験する機会を提供する。**

### 事業モデル

主収益は、写真、衣装、会食、贈答、行事用品、場所・体験等の**準備・予約・購買に関する他社送客／提携収益**。

初期は成果報酬やASP／アフィリエイトを使い、送客実績を得た後に固定掲載料＋成果報酬等の直接提携へ進む。実際の送客はPhase 4を基本とするが、準備カテゴリ別の関心はValidation Releaseから計測する。

---

## 3. 対象ドメイン

| レイヤー | 内容 | 例 | 役割 |
|---|---|---|---|
| A. 家族固有の行事 | 家族情報で時期が変わる行事 | お宮参り、お食い初め、初節句、1歳祝い、七五三 | コア価値、獲得、将来収益 |
| B. 季節の文化体験 | 毎年訪れる行事・風習 | 正月、七草、節分、ひな祭り、端午、七夕、お盆、十五夜、冬至、大晦日 | 継続利用、ブランド、利用の谷を埋める |
| C. 暦・文化背景 | 行事理解の補助情報 | 二十四節気、七十二候、旧暦、六曜 | コンテンツ補助 |

初期はAを中心とし、Bを少数含める。Cは主役にしない。

---

## 4. 最新ロードマップ

| Phase | 名称 | 主な内容 | 完了時の意味 |
|---|---|---|---|
| 0 | 事業仮説固定 | Core / Extended Value、対象、MLP機能、KPI、Analytics、Go / Pivot / Stop条件を固定 | 開発判断に必要な前提が揃う |
| 0.5 | 広告メッセージ検証 | 少額広告と既存LPで訴求を比較 | 刺さる問題設定が分かる。需要判定はしない |
| 1 | iOS Validation Release | 価値を感じられる最小iOS MLPを設計・開発・公開 | コア体験を実ユーザーへ提供できる |
| 2 | Product Validation | 広告 → App Store → MLP実利用を定量計測 | プロダクト需要と獲得チャネルを分けて判定できる |
| 2.5 | 定性検証 | 利用者・離脱者インタビュー | 数値の理由が分かる |
| 3 | 正式v1 | 検証を通過した機能を強化・拡張 | 継続提供する正式プロダクトになる |
| 4 | Monetization Validation | ASP、アフィリエイト、事業者送客、提携 | CACとLTV、送客事業の成立を検証できる |

### Phase 0.5の位置づけ

広告で比較する候補は次の3系統。

- 赤ちゃんの行事課題
- 調べる負担の解消
- 家族で日本文化を体験する価値

ここで見るのは広告コピーとしての反応。LP→LINE登録率は補助指標であり、需要あり／なしの判定には使用しない。

---

## 5. iOS Validation Release：MLP

### MLPの定義

> **機能数は少なくする。体験は途中で切らない。**

必須体験は次のとおり。

```text
子どもの情報を登録
        ↓
自分専用の行事が生成される
        ↓
次の行事が分かる
        ↓
意味・やり方が分かる
        ↓
準備することが分かる
        ↓
通知してもらえる
        ↓
季節の文化体験にも出会える
```

### 必須機能候補

- 子どもの生年月日等、必要最小限の属性入力
- 家族固有行事の自動生成
- ホーム「次に来る行事」
- 行事詳細、意味、一般的な目安
- 準備チェックリスト
- ローカル通知
- 少数の季節文化行事
- 準備カテゴリ別の関心計測
- 「やってみる／今回はやらない」はPhase 0で採否決定

### 原則として含めないもの

- 独自ログイン・アカウント
- 独自バックエンド
- 家族情報のサーバー保存
- 独自家族アカウント共有
- 購入、予約、決済
- 提携店舗検索、レコメンド
- 地域差の完全網羅
- 大量の文化コンテンツ
- 高度な体験記録、SNS、コミュニティ

Appleカレンダー連携、簡易共有、体験記録は自動的に含めず、検証KPIに不可欠かをPhase 0で判断する。

---

## 6. データ・プライバシー原則

Validation ReleaseではLocal-firstを基本とする。

- 生年月日、性別、行事情報は原則端末内に保存・処理
- 初期はアカウント登録なし
- 独自サーバーは原則なし
- Analyticsには個人を直接特定しない行動イベントだけを送る
- 生年月日等をAnalyticsへ送信しない
- 将来の共有・バックアップはApple／iCloud等のユーザー管理領域を優先検討

既存LINEフローでは出産予定日等を取得する設計がある。実運用する場合は、最新方針との必要性比較、利用目的、保持、削除を再確認すること。

---

## 7. Product Validationで測るもの

| レイヤー | 指標候補 |
|---|---|
| Acquisition | 広告CTR、App Store到達率、Install CVR |
| Activation | 初回起動、生年月日入力完了、行事生成、最初の詳細閲覧 |
| Value | 通知許可、準備チェックリスト利用、季節行事閲覧 |
| Retention | D7 / D30、通知後再訪、行事詳細再閲覧 |
| Preparation Intent | 準備項目閲覧、カテゴリ別CTA、チェック完了 |

### Event-triggered Retention

毎日起動するサービスではないため、D7 / D30だけで評価しない。

```text
行事・季節文化の通知
        ↓
アプリ再訪
        ↓
行事詳細閲覧
        ↓
準備チェックリスト／「やってみる」
```

この連鎖を主要KPI候補にする。

### ProductとChannelの分離

- Product Validation：実利用者が価値を感じるか
- Channel Validation：広告等で合理的に獲得できるか

CPAが高いだけでプロダクトをKillせず、CTRが高いだけでGoにしない。

---

## 8. 既存成果物と扱い

| ファイル | 現在の役割 | 注意事項 |
|---|---|---|
| `public/index.html` | 既存LP、Phase 0.5のメッセージ検証候補 | 現在はLINE事前登録CTA。MLP公開後はApp Store導線へ更新予定 |
| `public/privacy.html` | 事前登録段階の簡易プライバシーポリシー | MLP用のLocal-first方針・Analytics・App Store要件へ別途更新が必要 |
| `public/about.html` | 運営者情報 | 所在地等にプレースホルダーあり |
| `public/contact.html` | 問い合わせ画面 | 送信機能未実装 |
| `docs/line-ops-setup.md` | LINE運用案 | 主要需要Gateではない。実装前に必要性とデータ取得を再判断 |
| `docs/line-cta-setup.md` | LP→LINEの経路別CTA設定 | Phase 0.5でLINEを使う場合のみ有効 |
| `docs/cloudflare-pages-setup.md` | LP公開手順 | 継続利用可 |
| `docs/business-roadmap.md` | 事業全体の最新ロードマップ | 戦略・フェーズ判断の正本 |
| `docs/business-strategy.md` | Phase 0〜2のプロダクト検証戦略 | MLP・検証・Phase Gateの詳細 |
| `docs/phase-0-2-execution-plan.md` | Phase 0〜2.5の実行計画 | タスク管理の正本 |
| `docs/ai-agent-operating-model.md` | AIエージェント運営体制・実行プロセス | 役割、WIP、レビュー、承認境界の正本 |
| `docs/project-operating-policy.md` | プロジェクト運用 | リポジトリ、ブランチ、Issue、PR、正本、品質、外部承認の正本 |
| `docs/operations/` | 実行記録とテンプレート | Task Brief、D-ID、Gate、リスク、移行済みタスクボード |
| `AGENTS.md` / `.codex/agents/` | AI実行設定 | 共通ガードレールとAI PM・Lead・Gate Reviewerの定義 |
| `.github/` | GitHub運用設定 | Issue / PRテンプレート、CODEOWNERS、文書品質チェック |
| `docs/monetization-scenarios.md` | 収益化シナリオ | Unit Economics・投資Gate |
| `docs/instagram-strategy.md` | Instagram運用方針 | SNS領域の正本 |
| `docs/content-production-guidelines.md` | 共通コンテンツ制作ルール | Fact Check・出典・著作権・素材管理 |
| `docs/meta-instagram-ads-setup.md` | Meta / Instagram広告設定 | 広告実施時の作業手順 |

### 公開URL

- LP：`https://gyoji-cho.pages.dev/`
- Meta / Instagram用：`https://gyoji-cho.pages.dev/?ch=meta`
- Google用：`https://gyoji-cho.pages.dev/?ch=google`

---

## 9. 次にやること

### 運用開始前

確定済みの運用枠：

- Phase 0：2026年8月17日〜9月6日。主要成果物は8月30日目標、前倒し完了可
- 責任者稼働：週28時間。通常判断SLAは1営業日
- Phase 0追加支出：0円。外注なし、既存AIサービス内で実行
- Phase 0.5広告費：現時点で約5,000円を想定。正式確定は `D-010` で行う

次に行うこと：

GitHub上の運用基盤は有効化済み。

- 実行状態：[GitHub Project #6](https://github.com/users/ryo-chan-k6/projects/6)
- `main` 保護：[main protection Ruleset](https://github.com/ryo-chan-k6/gyoji-cho-lp/rules/20890713)
- 初期Issue：[D-001（Issue #3）](https://github.com/ryo-chan-k6/gyoji-cho-lp/issues/3)、[P0-PROD-01（Issue #4）](https://github.com/ryo-chan-k6/gyoji-cho-lp/issues/4)

次に行うこと：`D-001`を本Chatで確定し、Decision Recordと `P0-PROD-01` のTask Briefを作成する。

### 最優先：Phase 0

1. 対象ユーザーと最初に解く課題を固定
2. Validation Release対象の家族固有行事・季節文化を選定
3. MLP必須機能と非対象を確定
4. Product / Channel ValidationのKPIを定義
5. Go / Pivot / Stop条件と開発上限を確定
6. Analyticsイベントと禁止データを確定
7. Local-firstアーキテクチャとApp Store要件を整理

### 次点：Phase 0.5

1. 3訴求の広告クリエイティブを用意
2. 既存LPの受け口を訴求別に整合
3. 少額・短期・変更ルール固定で配信
4. どの表現が刺さるかだけを判定

### Phase 1着手条件

- MLP対象行事・機能・非対象が固定済み
- Analyticsイベントとプライバシー要件が固定済み
- Go / Pivot / Stop条件が結果を見る前に固定済み
- 開発工数・費用上限が固定済み
- 必要なApple Developer／App Store準備が整理済み

---

## 10. 既存のブランド・LP決定事項

### ターゲット

- 第一子の親を主対象とする
- 入口は当面「赤ちゃんの行事」に集中する
- 妊娠中〜出産までの総合育児情報サービスにはしない

### キャッチコピー

> **調べなくていい。赤ちゃんの行事、全部自動登録。**

Phase 0.5で他の訴求と比較するため、恒久的な勝ちコピーとはまだ確定しない。

### ビジュアルトーン

- かわいい・親しみ系
- ピーチクリーム、コーラルピンク、ミント、イエロー
- Zen Maru Gothic
- 行事を成長の道のりとして見せるリボン状タイムライン

### 名称の経緯

「すくすくノート」「まいにち行事ノート」「おいわいごよみ」「家族ごよみ」等を検討し、最終的に正式名称「まいにち行事カレンダー 〜日本の行事帖〜」、プロジェクト名「GYOJI-CHO」に決定した。

Validation Release段階でブランドを完成させすぎず、Missionは維持しながらProduct Positioningは検証結果に応じて変更可能とする。

---

## 11. 技術メモ

- 現在のLPは素のHTML/CSS、フレームワークなし
- フォントはZen Maru Gothic
- レスポンシブ対応済み
- 画像は使わず、絵文字とCSS装飾が中心
- お問い合わせフォームの送信処理は未実装
- iOS Validation Releaseの技術スタックは未決定
- MLPはLocal-first、アカウントなし、独自サーバー原則なしを初期候補とする

---

## 12. やり直し防止メモ

- **Web簡易MVPをロードマップへ戻さない**
- LP／LINEの反応だけでプロダクト需要を判定しない
- Phase 0.5の広告を需要検証と呼ばない。広告メッセージ検証と呼ぶ
- MLPを「行事一覧が出るだけ」の薄いMVPにしない
- 家族共有、記録、カレンダー連携等を検証目的なしにMLPへ追加しない
- 子どもの生年月日をAnalyticsへ送らない
- 日次Retentionだけで判断せず、イベント起点Retentionを見る
- 準備意向はMLPから測るが、未承認の提携・送客は実装しない
