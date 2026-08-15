# GYOJI-CHO プロジェクト運用方針

最終更新：2026年8月15日
適用範囲：Phase 0〜2.5の計画、調査、制作、開発、検証

## 1. 目的

GYOJI-CHOを、責任者1名とAIエージェントを中心に、速さと証拠品質を両立して進めるための共通ルールを定める。事業上の判断は責任者が行い、AI PMと各Workstream Leadは、判断済みの範囲を再現可能な形で実行する。

この文書は次の運用の正本である。

- リポジトリ、ブランチ、PR、マージ
- タスク、Task Brief、判断ID、Phase Gate
- ディレクトリと成果物の保存先
- 正本文書と変更管理
- 品質Gate、セキュリティ、公開・外部操作の承認
- WIP、時間・費用、運営指標

AIの役割分担は [`ai-agent-operating-model.md`](ai-agent-operating-model.md)、Phase別タスクは [`phase-0-2-execution-plan.md`](phase-0-2-execution-plan.md) に従う。

## 2. 運用原則

1. **判断と実行を分ける。** D-ID、予算、契約、公開、個人情報、Go / Pivot / Stopは責任者が決める。
2. **1タスク・1責任者・1成果物責任を基本とする。** 同一ファイルを複数エージェントが同時編集しない。
3. **会話ではなくリポジトリに残す。** 判断、成果物、根拠、レビュー結果、現在地をファイルとIssueへ記録する。
4. **結果を見る前に基準を固定する。** KPI、停止条件、Gate、スコープ変更条件を事前に決める。
5. **外部状態は明示承認後に変更する。** push、PR作成、公開、広告、送信、購入、契約は責任者の承認を要する。
6. **Web簡易MVPへ戻さない。** Product ValidationはiOS MLPのValidation Releaseで行う。

## 3. リポジトリ戦略

### 3.1 Phase 2.5までは単一リポジトリ

LP、事業文書、運用設定、将来のiOS MLPを同じリポジトリで管理する。現時点では、別リポジトリによる権限分離や独立リリースの便益より、事業仮説・仕様・計測の整合性を優先する。

分割を再検討する条件は次のいずれかとする。

- iOSとWebのリリース権限を別チームへ分離する必要がある
- CIや履歴の規模が日常作業を明確に阻害する
- 外部委託先へ限定的なアクセスだけを渡す必要がある
- 法務・セキュリティ上、成果物を別管理する必要がある

### 3.2 ディレクトリ構成

```text
/
├─ AGENTS.md                     # リポジトリ内で働くAIへの共通指示
├─ README.md                     # プロジェクト入口
├─ public/                       # Cloudflare Pagesの公開ルート。移動しない
├─ apps/
│  └─ ios/                       # Phase 1で作るiOS MLP（作成時に追加）
├─ docs/
│  ├─ business-roadmap.md        # 事業全体の正本
│  ├─ business-strategy.md       # Phase 0〜2の検証戦略
│  ├─ phase-0-2-execution-plan.md# タスクカタログ
│  ├─ project-operating-policy.md# プロジェクト運用の正本
│  ├─ operations/                # Task Brief、判断、Gate、リスク、運用台帳
│  └─ workstreams/               # Phase成果物（必要になった時点で追加）
├─ .codex/agents/                # プロジェクト固有AIロール
├─ .github/                      # Issue、PR、CI、CODEOWNERS
└─ scripts/                      # ローカルとCIで共用する検証
```

既存の `public/` はCloudflare Pagesの公開ルートであり、LP再構築の判断なしに移動しない。新しいPhase成果物は、原則として `docs/workstreams/{product|marketing|data|legal|validation}/` に置く。横断運用記録は `docs/operations/` に置く。

## 4. ブランチ・PR・マージ戦略

### 4.1 基本方式

`main` を常にレビュー済みの状態に保つ、短命ブランチ中心のtrunk-based運用とする。

- AIエージェント：`codex/<task-id>-<short-slug>`
- 人間の機能追加：`feat/<task-id>-<short-slug>`
- 修正：`fix/<task-id>-<short-slug>`
- 文書：`docs/<task-id>-<short-slug>`
- 運用：`chore/<task-id>-<short-slug>`
- 緊急修正：`hotfix/<issue-id>-<short-slug>`

例：`codex/p0-prod-01-validation-brief`

1ブランチは1つのTask IDまたは1つの明確な運用Issueに対応させる。無関係な変更を混ぜない。開始前とPR直前に `main` との差分と競合を確認する。

### 4.2 PR

- 原則として `main` への直接pushを行わない
- PRタイトルは `[Task ID] 要約` とする
- Task Brief、関連D-ID、成果物、検証結果、リスク、外部承認の有無を記載する
- 作成者が自己確認し、重要成果物は別のReviewerが確認する
- 会話が未解決、チェックが失敗、D-IDが未決のまま完了扱い、秘密情報混入の疑いがある場合はマージしない

### 4.3 マージ

- 原則 `Squash and merge`
- 最終マージ操作は責任者が行う
- マージ後はIssueとタスク状態を更新し、不要ブランチを削除する
- AIレビューは品質判断の材料であり、責任者の事業判断・公開承認を代替しない

単独運営のため、GitHub上の必須承認者数は当初 `0` とし、PR作成と責任者による最終マージを必須にする。承認者数を `1` 以上にするのは、PR作成者とは別の継続的な人間Reviewerが参加してからとする。

### 4.4 `main` に推奨するGitHub Ruleset

- Pull Request経由を必須化
- `docs-quality` を必須Status Checkに設定
- Phase 1のiOS実装開始時にbuild / testのCIを追加し、必須Status Checkへ昇格
- 未解決Conversationがある場合のマージを禁止
- Force pushとbranch deletionを禁止
- 管理者の恒常的なbypassは使わず、緊急時だけ理由を記録

Rulesetの有効化はGitHub上の状態変更であるため、リポジトリ内の準備完了後に責任者の明示承認を得て実施する。

## 5. タスク・課題・判断の管理

### 5.1 正本の分担

| 対象 | 正本 | 役割 |
|---|---|---|
| Phase全体のタスク定義 | `phase-0-2-execution-plan.md` | Task ID、成果物、依存関係、完了条件 |
| 実行中の状態・担当 | GitHub Issue / Project | Backlog〜Done、担当、期限、ブロッカー |
| 個別実行指示 | `docs/operations/task-briefs/` | 範囲、入力、出力、承認境界、Reviewer |
| 事業・仕様判断 | `docs/operations/decisions/` | D-IDの決定記録 |
| Phase完了判定 | `docs/operations/gate-reviews/` | 証拠、反証、残存リスク、責任者判断 |
| 導入前の暫定状態 | `docs/operations/task-board.md` | GitHub Projectを有効化するまでの最小台帳 |

Issueは成果物本体の代わりにしない。実行計画は日々の状態管理に使わない。Chatの発言だけでD-IDを確定しない。

### 5.2 IDと命名

- Phaseタスク：実行計画の `P0-PROD-01` 等
- 判断：実行計画の `D-001` 等
- Phase Gate：`P0-GATE-01` 等
- 運用改善：`OPS-001` 等
- Task Brief：`<task-id>-<slug>.md`
- 判断記録：`<d-id>-<slug>.md`
- Gate記録：`<gate-id>-<yyyy-mm-dd>.md`

### 5.3 状態遷移

```text
Backlog → Ready → In Progress → Review → Done
                        ├─ Rework ───────┘
                        ├─ Decision Needed
                        └─ Blocked
```

`Ready` には、依存タスク完了、必要なD-ID確定、Task Brief作成、担当とReviewer決定が必要である。判断待ちでも草案は作れるが、依存するD-IDが確定するまで `Done` にしない。

### 5.4 Definition of Ready

- Task IDと目的が一意
- 対象範囲・対象外が明記されている
- 入力と依存関係が利用可能
- 必要なD-IDが確定済み
- 成果物の保存先と完了条件が明確
- 許可操作と人間承認が必要な操作が明確
- 担当と作成者以外のReviewerが決まっている

### 5.5 Definition of Done

- Task Briefで指定した成果物が正しい場所にある
- 成果物固有の品質Gateを通過している
- 根拠、前提、更新日、未確定事項が追跡できる
- セキュリティ・個人情報・表示上の確認が済んでいる
- ReviewerのPassまたは責任者の例外承認が記録されている
- Issue、依存タスク、必要な正本文書が更新されている
- PRの自動チェックが成功している

## 6. 正本文書と変更管理

### 6.1 優先順位

矛盾がある場合は、次の順で扱う。

1. 責任者が確定した最新のD-ID記録
2. 対象領域の正本文書
3. Phase実行計画
4. 承認済みTask Briefと成果物
5. Issue / PRの説明
6. Chat、個人メモ、未承認草案

上位資料と異なる内容を発見した場合、黙って片方だけ直さず、影響ファイルを列挙して同一PRで整合させる。Mission、対象ユーザー、MLP Frozen Scope、KPI、データ方針、Gate基準を変える場合は、先にD-IDを作成・確定する。

### 6.2 主な正本

| 領域 | 正本 |
|---|---|
| 事業全体・ロードマップ | `business-roadmap.md` |
| Phase 0〜2の検証戦略 | `business-strategy.md` |
| 実行タスク | `phase-0-2-execution-plan.md` |
| プロジェクト運用 | `project-operating-policy.md` |
| AI役割・権限・WIP | `ai-agent-operating-model.md` |
| Instagram | `instagram-strategy.md` |
| コンテンツ品質・出典 | `content-production-guidelines.md` |
| 収益シナリオ | `monetization-scenarios.md` |

## 7. 成果物別の品質Gate

| 成果物 | 必須確認 |
|---|---|
| 戦略・意思決定 | D-ID、選択肢、根拠、不確実性、見直し条件、影響タスク |
| Product仕様 | 対象／非対象、状態・例外、計測、通知、アクセシビリティ、Local-first、Legal観点 |
| Marketing | 実提供価値との一致、誤認防止、対象、比較条件、UTM、停止条件、公開承認 |
| Data | 指標定義、分母、期間、除外、発火条件、禁止データ、再現手順、欠測 |
| Legal / Privacy | 実際のデータフローとの一致、主体、目的、保持・削除、表示場所、専門家確認要否 |
| 行事コンテンツ | 出典、確認日、一般的目安と地域差、表現、権利、訂正方法 |
| コード | build / test / lint、主要導線の手動確認、秘密情報なし、データ送信確認、戻し方 |
| Phase Gate | 対象タスク、証拠、基準比較、反証、例外、残存リスク、責任者判断 |

判断を伴う重要成果物とPhase Gateは、作成者以外のReviewerを必須とする。Legal Leadの確認は法律専門家の助言を代替しない。

## 8. セキュリティ・個人情報・外部権限

詳細は [`operations/access-and-data-policy.md`](operations/access-and-data-policy.md) に従う。

- 秘密情報、APIキー、Apple証明書、広告アカウントの資格情報をリポジトリやTask Briefへ保存しない
- 実ユーザーの子どもの正確な生年月日、氏名、連絡先をテストデータに使わない
- 外部SDK、Analyticsイベント、保持期間はData / Legalの確認とD-IDなしに追加しない
- AIへ渡す情報はタスクに必要な最小限にする
- 公開、push、PR作成、広告配信、送信、購入、契約、App Store操作は責任者の明示承認後に行う

## 9. 時間・費用・WIP

初期WIPは全体3、各Workstream 1を上限とする。毎週、責任者とAI PMが次を確認する。

- 完了数、サイクルタイム、Review滞留、Rework回数
- Blocked / Decision Neededの日数
- 当週の追加費用と上限残。Phase 0は0円、広告費はPhase 0.5以降で別管理
- 責任者の確認待ち時間
- 次週のReady上限3件

Phase 0の期限・責任者稼働・費用上限は2026年8月16日に確定した。

外注は全Phaseを通じて行わない。変更が必要になった場合は、支出や契約の前に `D-020` を改定する。

| ID | 決定内容 | 運用条件 | 決定記録 |
|---|---|---|---|
| `D-018` | 2026年8月17日〜9月6日の3週間。主要成果物は8月30日目標 | 前倒し完了可。3週目は横断レビュー・Rework・Gateを中心に使う | [`d-018-phase-0-timebox.md`](operations/decisions/d-018-phase-0-timebox.md) |
| `D-019` | 責任者は週28時間、通常判断SLAは1営業日 | 最低4時間を判断・レビューへ確保。判断待ち3件超では新規着手を抑制 | [`d-019-owner-capacity.md`](operations/decisions/d-019-owner-capacity.md) |
| `D-020` | Phase 0の追加支出0円、外注なし | 既存AIサービス内で実行。新規有料利用はD-ID改定まで行わない | [`d-020-phase-0-cost-cap.md`](operations/decisions/d-020-phase-0-cost-cap.md) |

広告費は `D-010` で扱い、現時点の想定は約5,000円とする。Phase 2獲得費は `D-014`、投資上限と最終権限は `D-016`、Apple関連費用は `D-012` とPhase 1予算で扱う。

## 10. リリース・緊急対応

- LPまたはアプリ公開前に、変更内容、確認結果、既知の制約、ロールバック方法をPRへ記載する
- 公開操作は責任者の承認後に行う
- 事故時は新規公開・配信を止め、影響範囲、時刻、データ、暫定対応を記録する
- 個人情報・秘密情報の漏えい可能性がある場合は、通常タスクより優先して資格情報失効、公開停止、影響確認を行う
- 恒久対応は `fix/` または `hotfix/` のPRで行い、原因と再発防止をIssueへ残す

## 11. 導入手順

1. [x] 本方針、`AGENTS.md`、テンプレート、自動チェックをリポジトリへ反映する
2. [x] 責任者が `D-018〜020` を確定する
3. [ ] GitHub Issues / Projectを作り、`task-board.md` から状態管理を移す
4. [ ] 責任者の承認後、`main` Rulesetと必須Status Checkを有効化する
5. [ ] `D-001`を確定し、`P0-PROD-01`のTask Briefを作成してPhase 0実行を開始する
6. [ ] 最初の3〜5タスク後に、WIP、テンプレート、レビュー工数を振り返る

## 12. 公式参考資料

- [OpenAI Codex: AGENTS.md](https://developers.openai.com/codex/agent-configuration/agents-md)
- [OpenAI Codex: Subagents](https://developers.openai.com/codex/agent-configuration/subagents)
- [OpenAI Codex: Security](https://developers.openai.com/codex/agent-approvals-security)
- [GitHub Docs: Available rules for rulesets](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/available-rules-for-rulesets)
