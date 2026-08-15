# Task Brief: `P0-MKT-02 3系統以上の訴求仮説を作る`

- 状態：Done
- 作成日：2026-08-16
- 更新日：2026-08-16
- Workstream：Marketing
- 担当Lead：Marketing Lead
- Specialist：なし
- Reviewer：Product Lead

## 目的

Primary Userの利用場面を基に、Phase 0.5で比較可能な訴求仮説を3系統以上作り、広告フック、LPでの受け、期待するProduct体験、反証・保留条件を一続きで定義する。

## 対象範囲

- 赤ちゃん行事の見通し、調べ直し負担、準備・家族判断、日本文化体験の訴求仮説
- 妊娠期流入と出生後流入の文脈分離
- 広告→LP→将来Product体験の期待一致
- 支持の手掛かり、反証・不明条件、誤認リスク
- 後続の実験設計、Claims review、制作への引継ぎ

## 対象外

- 正式な広告コピー、デザイン、LP改修
- 媒体、予算、配信対象、母数、期間、停止条件の決定（`D-010`）
- Phase 0.5の反応によるProduct需要、Retention、収益性の判定
- MLP対象行事・季節文化の採否（`D-002/003`）
- 未承認の予約・購買・提携機能の提供表現

## 入力・参照資料

- [`Audience / Occasion Matrix`](../../workstreams/marketing/audience-occasion-matrix.md)
- [`Product Validation Brief`](../../workstreams/product/product-validation-brief.md)
- [`Assumption / Evidence Register`](../../workstreams/validation/assumption-evidence-register.md)
- [`D-001`](../decisions/d-001-primary-user.md)
- [`business-strategy.md`](../../business-strategy.md)

## 依存関係・判断ID

- 依存タスク：`P0-MKT-01`（Done）
- 関連D-ID：`D-001`（Decided）、`D-002〜004/010`（未決定・本Taskでは決めない）
- 未確定でも草案可能な範囲：行事・媒体・予算を候補またはTBDとして扱い、訴求の論理と反証可能性のみを定義する

## 成果物

| 成果物 | 保存場所 | 期待する形式 |
|---|---|---|
| Message hypothesis matrix | `docs/workstreams/marketing/message-hypothesis-matrix.md` | 3系統以上の訴求について対象、問題、価値、広告フック仮説、LPの受け、Product期待、反証条件、誤認リスクを一覧化したMarkdown |

## 完了条件

- [x] 3系統以上の訴求仮説がある
- [x] 赤ちゃん行事、調べる負担、日本文化体験を含む
- [x] 各仮説に広告フック、LPでの受け、期待Product体験、支持・反証・保留条件がある
- [x] 妊娠期流入と出生後流入を混在させない
- [x] 広告反応をProduct需要の証拠として扱わない
- [x] 未決定の行事、媒体、予算、機能、提携を先取りしない
- [x] 後続のMarketing / Validation / Legal / Productタスクへの入力が追跡できる
- [x] ReviewerがPassしている
- [x] Issue / Projectを更新した

## 証拠・確認方法

- Audience / Occasion Matrixとの対象・問題・代替手段の突合
- Product Validation BriefとのCore / Extended Valueの突合
- Assumption / Evidence RegisterとのChannel / Product証拠分離の突合
- Product Leadによる価値整合、期待一致、スコープ先取りの独立レビュー
- `pwsh ./scripts/check-docs.ps1`

## 操作権限

- 許可された操作：既存前提からの訴求仮説作成、Issue / Project進捗記録
- 人間承認が必要な操作：Mission、対象ユーザー、行事・機能採否、媒体、予算、配信条件、外部公開の確定または変更
- 禁止する操作・データ：未調査結果の断定、広告配信、個人情報利用、未契約提携の表示

## エスカレーション条件

- D-001、Mission、Core / Extended Valueの変更が必要
- 特定行事、媒体、予算、配信条件を決めないと仮説を記述できない
- 未提供機能または提携を提供中と表現しなければ完了できない
- 広告反応をProduct需要判定に使う必要が生じる

## Reviewer記録

- 判定：Pass
- 確認日：2026-08-16
- 確認内容：Product Leadが4訴求、D-001 / Core / Extended Value整合、妊娠期／出生後分離、広告→LP→Product期待の連続性、Product需要との証拠分離、反証・不明条件、未決定事項の留保、後続引継ぎを確認。初回レビューでD-004未決定の入力・更新・選択機能を先取りし得る表現を指摘し、条件化・中立化後の再レビューでPass。
- 残存リスク：実配信条件、必要母数、不明判定は`D-010`、`P0-MKT-04`、`P0-VAL-02`で未確定。Phase 0.5の反応をProduct需要へ転用しない運用が必要。
