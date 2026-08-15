# Task Brief: `P0-MKT-03 Mission、Product Positioning、広告コピーの役割を分ける`

- 状態：Done
- 作成日：2026-08-16
- 更新日：2026-08-16
- Workstream：Marketing
- 担当Lead：Marketing Lead
- Specialist：なし
- Reviewer：Product Lead

## 目的

Mission、最終形、検証前提、Product Positioning、訴求、実行コピーを別レイヤーに分け、短期の広告反応で上位戦略を変更しない変更管理ルールを作る。

## 対象範囲

- 表現レイヤーごとの役割、変更可能性、必要証拠、承認・記録
- 現時点のWorking Product Positioning
- Phase 0.5結果で変更できるもの／できないもの
- 観測から変更へ進む際の飛躍防止
- Instagram独立メディアとの境界
- 後続タスク・Gateへの引継ぎ

## 対象外

- Mission、正式名称、Primary User、Core / Extended Valueの変更
- Product Positioningの恒久変更決定
- 広告コピー、媒体、予算、配信条件の確定
- Instagram戦略の変更またはアプリ誘導の開始
- MLP対象行事・機能・KPIの決定

## 入力・参照資料

- [`business-strategy.md`](../../business-strategy.md)
- [`Product Validation Brief`](../../workstreams/product/product-validation-brief.md)
- [`Message Hypothesis Matrix`](../../workstreams/marketing/message-hypothesis-matrix.md)
- [`Audience / Occasion Matrix`](../../workstreams/marketing/audience-occasion-matrix.md)
- [`instagram-strategy.md`](../../instagram-strategy.md)
- [`project-operating-policy.md`](../../project-operating-policy.md)

## 依存関係・判断ID

- 依存タスク：`P0-PROD-01`、`P0-MKT-02`（Done）
- 関連D-ID：`D-001`（Decided）、`D-002〜005/009/010`（未決定・変更しない）
- 未確定でも草案可能な範囲：既存正本の内容を変更せず、変更境界とエスカレーション経路を定義する

## 成果物

| 成果物 | 保存場所 | 期待する形式 |
|---|---|---|
| Brand / positioning guardrail | `docs/workstreams/marketing/brand-positioning-guardrail.md` | 表現レイヤー、変更権限、必要証拠、広告結果の扱い、Instagram境界を整理したMarkdown |

## 完了条件

- [x] Mission、最終形、検証前提、Product Positioning、訴求、実行コピーが区別されている
- [x] 広告反応で変更可能な要素と維持するMissionが区別されている
- [x] Product Positioning変更に必要なProduct / Channel / 定性証拠と承認経路がある
- [x] Phase 0.5だけではProduct需要を判定しない
- [x] Instagramの独立メディア方針を維持している
- [x] 未決定D-IDや恒久的な表現変更を先取りしていない
- [x] 後続タスク・Gateへの入力が追跡できる
- [x] ReviewerがPassしている
- [x] Issue / Projectを更新した

## 証拠・確認方法

- business-strategy / Product Validation BriefとのMission・価値・対象の突合
- Message Hypothesis Matrixとの変更可能訴求・証拠制約の突合
- Instagram正本との対象・目的・導線分離の突合
- Product Leadによる価値階層・変更権限・スコープ先取りの独立レビュー
- `pwsh ./scripts/check-docs.ps1`

## 操作権限

- 許可された操作：既存決定からの変更境界整理、Issue / Project進捗記録
- 人間承認が必要な操作：Mission、名称、最終形、対象、価値、スコープ、Positioningの実質変更、外部公開
- 禁止する操作・データ：広告反応によるProduct需要断定、未決定機能・提携の提供表現、Instagramの無断転用

## エスカレーション条件

- 既存正本間でMission、価値、対象、Instagram方針に矛盾がある
- 変更境界を定義するために既存決定を変更する必要がある
- D-IDまたはGateを経ずに上位レイヤーを変更する必要がある
- 公開済み表現の即時変更、広告配信、予算利用が必要

## Reviewer記録

- 判定：Pass
- 確認日：2026-08-16
- 確認内容：Product Leadが表現6レイヤー、Phase 0.5証拠の限定、Working Positioningの既存戦略整合、Instagram独立性、未決定事項の留保、後続引継ぎを確認。初回レビューでProduct Positioning変更権限とFrozen Scopeの未確定状態を明確化し、再レビューでPass。
- 残存リスク：Working Positioningの恒久採用・変更は未決定。実質変更時は影響範囲を問わずHuman Owner承認と新規D-IDが必要。
