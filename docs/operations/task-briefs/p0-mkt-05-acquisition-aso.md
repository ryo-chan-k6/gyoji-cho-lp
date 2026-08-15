# Task Brief: `P0-MKT-05 Phase 2の獲得仮説とApp Store準備項目を洗い出す`

- 状態：Done
- 作成日：2026-08-16
- 更新日：2026-08-16
- Workstream：Marketing
- 担当Lead：Marketing Lead
- Specialist：なし
- Reviewer：Product Lead

## 目的

Phase 2の広告→App Store→InstallをChannel Validationとして設計できるよう、対象文脈別の獲得仮説と、後続で必要な素材・ページ・ASO・計測・法務確認項目をバックログ化する。

## 対象範囲

- 妊娠期／出生後、行事緊急度、文化体験、Organicの獲得仮説
- 広告・App Store・Install・Productのボトルネック分離
- Metadata、visual、proof、page、keyword、measurement、compliance、QA、operationの準備項目
- D-014へ渡す判断事項
- Phase 1〜2のMarketing / Data / Legal / Validationへの引継ぎ

## 対象外

- 広告チャネル、予算、期間、配信対象、停止条件の決定（`D-014`）
- App Store Product Page比較の採否（`D-014`）
- KPI閾値、必要母数、観測窓の決定（`D-009`）
- Metadata、スクリーンショット、広告素材の制作
- Appleの現行要件・契約・配布方法の確定（`D-011/012`、P1 Legal）
- Instagramの獲得チャネル化

## 入力・参照資料

- [`Product Validation Brief`](../../workstreams/product/product-validation-brief.md)
- [`Audience / Occasion Matrix`](../../workstreams/marketing/audience-occasion-matrix.md)
- [`Message Hypothesis Matrix`](../../workstreams/marketing/message-hypothesis-matrix.md)
- [`Brand / Positioning Guardrail`](../../workstreams/marketing/brand-positioning-guardrail.md)
- [`Assumption / Evidence Register`](../../workstreams/validation/assumption-evidence-register.md)
- [`phase-0-2-execution-plan.md`](../../phase-0-2-execution-plan.md)

## 依存関係・判断ID

- 依存タスク：`P0-PROD-01`、`P0-MKT-01`（Done）。`P0-MKT-02/03`も入力として利用
- 関連D-ID：`D-001`（Decided）、`D-003/004/007/009/011/012/014`（未決定・本Taskでは決めない）
- 未確定でも草案可能な範囲：チャネル・予算・比較方法・Apple要件をTBDとし、仮説と準備在庫だけを定義する

## 成果物

| 成果物 | 保存場所 | 期待する形式 |
|---|---|---|
| Acquisition hypothesis / ASO backlog | `docs/workstreams/marketing/acquisition-hypothesis-aso-backlog.md` | 獲得仮説、ファネル境界、準備バックログ、必要素材・ページ・計測、D-014判断項目を一覧化したMarkdown |

## 完了条件

- [x] 広告→App Store→Installの仮説が対象文脈別にある
- [x] 妊娠期／出生後、行事緊急度、広告→Store期待一致を扱う
- [x] 広告・Store・Install・Productのボトルネックを分離できる
- [x] 後で必要な素材・ページ・ASO・計測・法務確認項目が一覧化されている
- [x] D-014の媒体、予算、セグメント、Product Page比較を先取りしていない
- [x] Instagramを獲得チャネルとして扱っていない
- [x] 後続TaskとD-IDへの入力が追跡できる
- [x] ReviewerがPassしている
- [x] Issue / Projectを更新した

## 証拠・確認方法

- Product Validation BriefとのPrimary User・Product / Channel分離の突合
- Audience / Occasion Matrixとの妊娠期／出生後・緊急度の突合
- Brand / Positioning Guardrailとの広告→Store→実体験の約束整合
- Assumption / Evidence Registerの`CH-01`と反証・不明条件の突合
- Product Leadによる期待一致、スコープ先取り、Product / Channel分離の独立レビュー
- `pwsh ./scripts/check-docs.ps1`

## 操作権限

- 許可された操作：既存前提からの獲得仮説・準備項目整理、Issue / Project進捗記録
- 人間承認が必要な操作：チャネル、予算、配信、比較、Apple契約、公開、Instagram接続の決定または実施
- 禁止する操作・データ：広告配信、未決定Product Pageの作成、Apple要件の未確認断定、個人情報利用

## エスカレーション条件

- D-014を決めないと仮説・準備在庫を記載できない
- Product ScopeやPrimary Userの変更が必要
- Phase 2獲得にInstagram接続が必要
- 外部公開、有料調査、広告配信、Apple契約操作が必要

## Reviewer記録

- 判定：Pass
- 確認日：2026-08-16
- 確認内容：Product LeadがD-001対象、妊娠期／出生後／行事緊急度、広告→Store→Install期待一致、Product / Channel境界、AQ仮説の反証・不明条件、ASO-01〜10の網羅性、D-ID・Apple要件の留保、Instagram独立性、Phase 1〜2引継ぎを確認。Task Briefへ不足していた`D-001/003/004`の追跡を追加後、再レビューでPass。
- 残存リスク：チャネル、予算、セグメント、比較ページ、必要母数、Apple公開要件は未決定。`D-014`等の決定・制作時点確認なしに配信・公開しない。
