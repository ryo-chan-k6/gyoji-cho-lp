# Task Brief: `P0-PROD-02 家族固有行事と季節文化の候補を評価し、MLP対象を選ぶ`

- 状態：Done
- 作成日：2026-08-16
- 更新日：2026-08-16
- Workstream：Product
- 担当Lead：Product Lead
- Specialist：Content Specialist
- Reviewer：Validation Lead、Legal Lead

## 目的

D-002・D-003・D-013に基づき、MLP対象の家族固有行事、月齢マイルストーン、月別季節文化を、価値、時期、準備、通知候補、地域差、安全、根拠要件、検証可能性から評価し、P0-PROD-03へ渡せる対象一覧を固定する。

## 対象範囲

- D-002の家族固有行事6テーマ
- 生後1〜11か月の軽量月齢マイルストーン
- D-003の月1件・年間12件の季節文化
- 時期・算出要件、意味・準備の範囲、通知候補
- 地域・宗派・家庭差、安全、高リスク除外
- D-013のSource Research・レビュー引継ぎ
- 同日・同テーマ重複とP0-PROD-03への状態引継ぎ

## 対象外

- 公開用の完成コンテンツ、実出典の全件収集（P1-PROD-03）
- 画面・状態遷移の確定（P0-PROD-03）
- 通知、準備チェック、「やってみる／今回はやらない」、月齢カードのMust判定（D-004）
- 日付算出ロジック、対象OS、実装技術の確定（D-006）
- KPI閾値、観測期間、必要母数の確定（D-009）
- 予約・購買・提携機能

## 入力・参照資料

- [`D-001`](../decisions/d-001-primary-user.md)
- [`D-002`](../decisions/d-002-family-events.md)
- [`D-003`](../decisions/d-003-seasonal-culture.md)
- [`D-013`](../decisions/d-013-content-quality.md)
- [`Product Validation Brief`](../../workstreams/product/product-validation-brief.md)
- [`Audience / Occasion Matrix`](../../workstreams/marketing/audience-occasion-matrix.md)
- [`Assumption / Evidence Register`](../../workstreams/validation/assumption-evidence-register.md)
- [`content-production-guidelines.md`](../../content-production-guidelines.md)

## 依存関係・判断ID

- 依存タスク：`P0-PROD-01`（Done）
- 関連D-ID：`D-001/002/003/013`（Decided）、`D-004/006/009`（未決定・本Taskでは決めない）
- 未確定でも作成可能な範囲：通知・UI・算出実装を要件候補として記載し、Mustや数値基準は後続へ留保する

## 成果物

| 成果物 | 保存場所 | 期待する形式 |
|---|---|---|
| Event scope matrix | `docs/workstreams/product/event-scope-matrix.md` | 家族固有行事、月齢、季節文化の価値・時期・準備・通知候補・差異・Source plan・採否を一覧化したMarkdown |

## 完了条件

- [x] D-002の6テーマと月齢1〜11がすべて評価されている
- [x] D-003の各月1件・年間12件がすべて評価されている
- [x] 各行事に価値、時期、準備、通知候補、地域・家庭差、安全、根拠要件、MLP採否がある
- [x] 初節句、月齢、季節文化の重複管理要件がある
- [x] D-013のSource planとP1-PROD-03への品質引継ぎがある
- [x] D-004/006/009の未決定事項を先取りしていない
- [x] P0-PROD-03へ状態・例外・重複の入力がある
- [x] Validation LeadがPassしている
- [x] Legal LeadがPassしている
- [x] Issue / Projectを更新した

## 証拠・確認方法

- D-001〜003、D-013との対象・件数・品質Gateの突合
- Product Validation BriefとのCore / Extended Value・対象外の突合
- Assumption / Evidence RegisterのP-03 / P-04 / V-02 / V-06との突合
- Validation Leadによる観測可能性・分母・未観測・スコープ先取りの独立レビュー
- Legal LeadによるD-013、地域差、安全、権利、公開転用防止の独立レビュー
- `pwsh ./scripts/check-docs.ps1`

## 操作権限

- 許可された操作：決定済み対象の評価、Source plan、後続要件の整理、Issue / Project進捗記録
- 人間承認が必要な操作：D-002/003/013の変更、イベント総数変更、公開、外部監修、予算、高リスク内容の採用
- 禁止する操作・データ：未レビュー内容の公開転用、医療・安全保証、未決定機能のMust化、個人情報利用

## エスカレーション条件

- 月1件・年間12件をD-013品質・工数内で成立させられない
- 家族固有行事6テーマまたは月齢マイルストーンを除外する必要がある
- 公的・当事者公式の根拠候補がなく、高リスク内容を含めないと価値を成立させられない
- D-004/006/009を決めないと対象評価自体を完了できない

## Reviewer記録

- Validation Lead判定：Pass
- Legal Lead判定：Pass
- 確認日：2026-08-16
- 確認内容：Validation LeadはP-03 / P-04 / V-02 / V-06の分母、観測機会、不明・除外、月齢の補助分類、探索セグメント、未観測月を確認。Legal LeadはD-013 Source plan、地域・宗派・家庭差、安全、高リスク除外、権利、公開転用防止、P0 / P1 Legal Gateへの引継ぎを確認。初回レビューの指摘を引継ぎ表へ反映後、双方の再レビューでPass。
- 残存リスク：D-004の表示・通知・操作採否、D-006の算出実装、D-009の数値基準・観測窓は未決定。年間12件の未観測月、重複統合、D-013 Human全件承認工数が残る。
