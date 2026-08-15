# Task Brief: `P0-VAL-01 事業仮説を反証可能な形で優先順位付けする`

- 状態：Done
- 作成日：2026-08-16
- 更新日：2026-08-16
- Workstream：Validation
- 担当Lead：Validation Lead
- Specialist：なし
- Reviewer：Data Lead

## 目的

GYOJI-CHOのPhase 0〜2で重要な仮説を、結果によって支持・棄却・不明を区別できる形へ分解し、影響度と不確実性に基づく検証優先順位、必要証拠、後続タスクを一元管理する。

## 対象範囲

- Primary Userの課題存在と発生時期
- Core ValueとExtended Value
- 先回り通知、準備支援、季節文化の価値
- 妊娠期流入から出生後利用への移行・Retention
- Product ValidationとChannel Validation
- 準備意向と将来の送客収益への接続
- 各仮説の反証条件、必要証拠、主な収集Phase、関連Task / D-ID

## 対象外

- KPI閾値、必要母数、観測期間の最終決定（`D-009`）
- 具体的な対象行事・季節文化の採否（`D-002`、`D-003`）
- MLP機能のMust / May / Won't決定（`D-004`、`D-005`）
- 広告媒体、予算、配信条件の決定（`D-010`、`D-014`）
- 実験の実施、データ収集、Go / Pivot / Stop判断

## 入力・参照資料

- [`D-001`](../decisions/d-001-primary-user.md)
- [`Product validation brief`](../../workstreams/product/product-validation-brief.md)
- [`business-roadmap.md`](../../business-roadmap.md)
- [`business-strategy.md`](../../business-strategy.md)
- [`phase-0-2-execution-plan.md`](../../phase-0-2-execution-plan.md)
- [`monetization-scenarios.md`](../../monetization-scenarios.md)

## 依存関係・判断ID

- 依存タスク：`P0-PROD-01`（Done）
- 関連D-ID：`D-001`（Decided）
- 未確定でも草案可能な範囲：数値基準を置かず、必要な証拠の種類と反証可能な観測を定義する

## 成果物

| 成果物 | 保存場所 | 期待する形式 |
|---|---|---|
| Assumption / evidence register | `docs/workstreams/validation/assumption-evidence-register.md` | 仮説ID、仮説、重要度、不確実性、反証、必要証拠、収集Phase、関連Task / D-ID、状態を持つMarkdown台帳 |

## 完了条件

- [x] 課題、MLP価値、文化体験、通知、準備、チャネル、収益意向の仮説が分離されている
- [x] 各仮説に重要度、不確実性、反証条件、必要証拠がある
- [x] 妊娠期流入から出生後利用への移行仮説と生存者バイアスが扱われている
- [x] Product ValidationとChannel Validationが混同されていない
- [x] 未決定のKPI閾値・機能・行事・予算を確定していない
- [x] 関連Task / D-IDと検証Phaseが追跡できる
- [x] ReviewerがPassしている
- [x] Issue / Projectを更新した

## 証拠・確認方法

- Product validation briefと戦略文書に存在する仮説の網羅確認
- 各行について、観測結果が反対でも判定できるかをValidation Leadが自己確認
- Data Leadによる分母・観測可能性・後付け解釈リスクの独立レビュー
- `pwsh ./scripts/check-docs.ps1`

## 操作権限

- 許可された操作：仮説台帳の作成、既存戦略・計画の整理、Issueへの進捗記録
- 人間承認が必要な操作：仮説を事業上の確定事実として扱う、KPI / Gate、対象、機能、予算、収益方針を変更する
- 禁止する操作・データ：結果を見た後の基準設定、実ユーザー個人情報の使用、未承認の外部調査・配信

## エスカレーション条件

- 仮説の記述に新しいD-IDまたは既存D-ID変更が必要
- 正本文書間でMission、対象、価値、検証方針が矛盾する
- 反証に必要なデータがLocal-first・禁止データ方針と両立しない
- 完了条件を満たすために数値閾値や予算の確定が必要

## Reviewer記録

- 判定：Pass（Rework後に再レビュー）
- 確認日：2026-08-16
- 確認内容：Data Leadが反証可能性、観測可能性、Product / Channel / Monetization分離、妊娠期分母鎖、右側打ち切り、通知選択、CTA意図、未決定事項の留保、Phase 2 / 2.5 Task追跡を確認。初回Reworkの10観点をv1.1で解消後、再レビューでPass。
- 残存リスク：`D-009`確定後の閾値・母数・統合／不明条件接続、`D-004`の機能採否による検証可否更新、比較設計なしでは通知・選択肢の因果効果を結論できない点、Phase 4 Task / D-IDが未定義である点。
