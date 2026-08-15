# Task Brief: `P0-MKT-01 最優先ユーザーの状況・検索・代替手段を整理する`

- 状態：Done
- 作成日：2026-08-16
- 更新日：2026-08-16
- Workstream：Marketing
- 担当Lead：Marketing Lead
- Specialist：なし
- Reviewer：Product Lead

## 目的

Primary Userを妊娠後期から満1歳までの利用場面に分け、直近の行事機会、困りごと、現在の解決方法、検索語仮説、反応し得る価値を整理し、後続の訴求・獲得仮説へ共通入力を提供する。

## 対象範囲

- 妊娠後期、出生直後、出生後1〜3か月、4〜6か月、7〜11か月、1歳の誕生日付近の状況
- 行事の存在認知、時期確認、意味理解、家族判断、準備、振り返りの場面
- 検索、育児アプリ、SNS、家族・知人、自治体・寺社・店舗等の代替手段
- 実際に検索し得る言葉・質問の仮説
- Core / Extended Valueのどこに反応し得るか
- 妊娠期流入と出生後流入で異なる獲得・利用文脈

## 対象外

- MLP対象行事・季節文化の採否（`D-002`、`D-003`）
- 広告コピーの確定（`P0-MKT-02`）
- 媒体、予算、配信条件の決定（`D-010`、`D-014`）
- 検索ボリューム、競合利用率等の未調査数値を事実として記載すること
- Instagramの確定戦略変更

## 入力・参照資料

- [`D-001`](../decisions/d-001-primary-user.md)
- [`Product validation brief`](../../workstreams/product/product-validation-brief.md)
- [`Assumption / evidence register`](../../workstreams/validation/assumption-evidence-register.md)
- [`business-strategy.md`](../../business-strategy.md)
- [`instagram-strategy.md`](../../instagram-strategy.md)
- 既存LP、LINE運用案

## 依存関係・判断ID

- 依存タスク：`P0-PROD-01`（Done）
- 関連D-ID：`D-001`（Decided）
- 未確定でも草案可能な範囲：対象行事を「候補・利用場面の例」として扱い、MLP採用とは記載しない

## 成果物

| 成果物 | 保存場所 | 期待する形式 |
|---|---|---|
| Audience / occasion matrix | `docs/workstreams/marketing/audience-occasion-matrix.md` | 時期、直近機会、Job / 困りごと、代替手段、検索語仮説、反応価値、リスク、後続検証を一覧化したMarkdown |

## 完了条件

- [x] D-001の全対象期間が利用場面として扱われている
- [x] 対象ごとに直近行事機会、困りごと、現在の解決方法、検索語仮説、反応し得る価値がある
- [x] 妊娠期流入と出生後流入の文脈差が明記されている
- [x] 検索語・代替行動を未検証仮説として記載している
- [x] Core Value、Extended Value、Instagramの役割を混同していない
- [x] D-002 / D-003未決定の対象行事を採用済みにしていない
- [x] 後続の`P0-MKT-02/03/05`への入力が追跡できる
- [x] ReviewerがPassしている
- [x] Issue / Projectを更新した

## 証拠・確認方法

- D-001、Product validation briefとの対象期間・価値の突合
- Assumption / evidence registerとの課題・チャネル仮説の突合
- Product Leadによる利用場面・提供価値・未決定スコープの独立レビュー
- `pwsh ./scripts/check-docs.ps1`

## 操作権限

- 許可された操作：既存文書からの仮説整理、成果物作成、Issue進捗記録
- 人間承認が必要な操作：対象ユーザー・価値・対象行事・媒体・予算の変更または確定
- 禁止する操作・データ：未調査の市場数値・検索量の断定、個人情報の利用、広告配信、外部公開

## エスカレーション条件

- D-001の対象期間を変更しなければ利用場面を整理できない
- 特定行事のMLP採否がないと完了条件を満たせない
- Instagram戦略またはPhase 0.5の役割変更が必要
- 外部調査・有料ツール・広告配信が不可欠になる

## Reviewer記録

- 判定：Pass
- 確認日：2026-08-16
- 確認内容：Product LeadがD-001全期間、利用場面、Job、代替手段、検索語仮説、反応価値、妊娠／出生後差、前提と仮説の区別、Core / Extended / Instagram分離、行事採否の留保、`P0-MKT-02/03/05`への引継ぎを確認。
- 残存リスク：検索語・代替行動・反応価値は未検証。妊娠後期の週数境界は未決定。`D-002/003`確定後の候補例再確認と、満1歳以降を初期KPIへ混在させない運用が必要。
