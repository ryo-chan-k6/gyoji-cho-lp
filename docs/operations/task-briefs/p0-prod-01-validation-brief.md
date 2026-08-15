# Task Brief: `P0-PROD-01 Product validation briefを作成する`

- 状態：Done
- 作成日：2026-08-16
- 更新日：2026-08-16
- Workstream：Product
- 担当Lead：Product Lead
- Specialist：なし
- Reviewer：Validation Lead

## 目的

`D-001`で確定したPrimary Userについて、利用場面、中心課題、Core / Extended Value、対象外、妊娠期から出生後への移行仮説を1ページで参照できるProduct validation briefへまとめる。

## 対象範囲

- 第一子の妊娠後期から満1歳の誕生日までのPrimary User
- 妊娠期、出生後0〜11か月、1歳の誕生日という期間区分
- 行事の情報収集・判断・準備を主に担う保護者の利用場面
- Core Value、Extended Value、最初に解く課題
- 妊娠期流入コホートと出生後流入コホートの違い
- 初期の対象外と、利用を制限しない対象の区別
- Product / Marketing / Data / Legal / Validationへ渡す前提

## 対象外

- MLPへ含める具体的な行事の決定（`D-002`、`D-003`）
- 予定日登録、生年月日更新等の機能採否（`D-004`）
- Analytics基盤、コホート属性、KPI閾値の決定（`D-007〜010`）
- 広告コピー、媒体、予算の決定
- 0〜5歳向けInstagram戦略の変更

## 入力・参照資料

- [`D-001`](../decisions/d-001-primary-user.md)
- [`business-roadmap.md`](../../business-roadmap.md)
- [`business-strategy.md`](../../business-strategy.md)
- [`phase-0-2-execution-plan.md`](../../phase-0-2-execution-plan.md)
- [`instagram-strategy.md`](../../instagram-strategy.md)
- 既存LPのターゲット・FAQ

## 依存関係・判断ID

- 依存タスク：なし
- 関連D-ID：`D-001`（Decided）
- 未確定でも草案可能な範囲：`D-002〜005`に依存する具体的行事・機能は「後続判断」と明記して確定しない

## 成果物

| 成果物 | 保存場所 | 期待する形式 |
|---|---|---|
| Product validation brief | `docs/workstreams/product/product-validation-brief.md` | Primary User、利用場面、課題、価値、対象外、コホート、後続要件を1ページ相当で整理したMarkdown |

## 完了条件

- [x] Primary Userが `D-001`と同じ意味・期間で記載されている
- [x] 対象、利用場面、課題、Core Value、Extended Value、対象外が1ページで参照できる
- [x] 妊娠期流入を主要Product KPIへ混在させず、出生後Retentionを比較する仮説が明記されている
- [x] 「第一子」が利用資格ではなく初期獲得・検証の優先条件であることが明記されている
- [x] Instagramの0〜5歳ターゲットとアプリPrimary Userが区別されている
- [x] 後続のProduct / Marketing / Data / Legal / Validationタスクへの入力が列挙されている
- [x] ReviewerがPassしている
- [x] Issue、依存関係、必要な正本文書を更新した

## 証拠・確認方法

- `D-001`との用語・期間・対象外の突合
- `business-roadmap.md`、`business-strategy.md`とのCore / Extended Valueの突合
- Validation Leadによる反証可能性とコホート混在リスクのレビュー
- `pwsh ./scripts/check-docs.ps1`

## 操作権限

- 許可された操作：Product validation briefの作成、関連文書の参照、Issueへの進捗記録
- 人間承認が必要な操作：Primary User、中心課題、対象期間、KPIでの扱いの変更
- 禁止する操作・データ：未決定の対象行事・機能・KPI閾値の確定、個人情報・正確な妊娠週数・予定日・生年月日の外部送信

## エスカレーション条件

- `D-001`と既存正本文書を同時に満たせない
- 妊娠期を対象に含めることで、予定日登録等を本タスク内で確定する必要が生じる
- 第一子と第二子以降、妊娠期と出生後を分けずに主要KPIを定義する必要が生じる
- MLP、予算、契約、公開、個人情報に変更が必要

## Reviewer記録

- 判定：Pass（軽微Rework後に再レビュー）
- 確認日：2026-08-16
- 確認内容：D-001整合、対象・価値・対象外、妊娠期／出生後コホート分離、第一子の非資格化、Instagram分離、5 Workstreamへの引継ぎ、未決定事項の留保を確認。初回レビューで不足していた `P0-MKT-05` への引継ぎを追加後、再レビューでPass。
- 残存リスク：妊娠期コホートの生存者バイアス、Phase 2観測期間内で1歳までを観測できないコホート、第一子属性の取得要否。`D-004`、`D-007〜010`と後続Validation設計で扱う。
