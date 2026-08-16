# Task Brief: `P0-PROD-03 MLPの必須体験を画面・状態遷移へ落とす`

- 状態：Done
- 作成日：2026-08-16
- 更新日：2026-08-16
- Workstream：Product
- 担当Lead：Product Lead
- Specialist：なし
- Reviewer：Validation Lead

## 目的

確定済みの対象ユーザー・行事範囲を、妊娠期／出生後の入口から、行事生成、次の行事、意味、準備候補、通知候補、季節文化まで切れない画面・状態遷移へ落とす。未決定機能は候補として可視化し、`D-004`と`D-005`のHuman判断に必要な比較単位を作る。

## 対象範囲

- 妊娠期と出生後の開始・移行Journey
- 初回入力、行事生成、ホーム、行事詳細、準備、季節文化、設定の画面候補
- 未入力、不正値、過去行事、延期、非実施、重複、通知拒否、削除等の状態・例外
- D-002の家族固有6テーマ・月齢1〜11とD-003の月1件・年間12件を扱う共通体験
- `D-004`の機能採否と`D-005`の付加機能採否へ渡す判断単位
- Data / Legal / Validation / Marketingへの後続引継ぎ

## 対象外

- Must / May / Won'tの確定（`P0-PROD-04`、`D-004`、`D-005`）
- 入力属性、通知、チェック、選択状態、CTA等の採用確定
- 日付計算、保存、Deep link、画面実装等の技術方式（`D-006`）
- Analyticsイベント名、属性、分母、閾値の確定（`D-007〜009`）
- 高忠実度UI、最終UX文言、コンテンツ本文
- カレンダー連携、簡易共有、体験記録等をMLPへ含める決定
- 購入、予約、決済、提携先検索・推薦

## 入力・参照資料

- [`Product validation brief`](../../workstreams/product/product-validation-brief.md)
- [`Event scope matrix`](../../workstreams/product/event-scope-matrix.md)
- [`D-001`](../decisions/d-001-primary-user.md)
- [`D-002`](../decisions/d-002-family-events.md)
- [`D-003`](../decisions/d-003-seasonal-culture.md)
- [`D-013`](../decisions/d-013-content-quality.md)
- [`business-strategy.md`](../../business-strategy.md)
- [`phase-0-2-execution-plan.md`](../../phase-0-2-execution-plan.md)

## 依存関係・判断ID

- 依存タスク：`P0-PROD-01`、`P0-PROD-02`（完了済み）
- 関連D-ID：`D-001〜003`、`D-013`（Decided）、`D-004〜009`、`D-017`（未決定・本Taskでは決めない）
- 未確定でも草案可能な範囲：採否前の機能は`[D-004候補]`／`[D-005候補]`と明記し、候補間の比較と必要な状態・例外だけを整理する

## 成果物

| 成果物 | 保存場所 | 期待する形式 |
|---|---|---|
| MLP experience map / wireflow | `docs/workstreams/product/mlp-experience-map.md` | 全体図、Journey、画面候補、状態・例外、D-004 / D-005判断単位、後続引継ぎを含むMarkdown |

## 完了条件

- [x] 登録候補→行事生成→次の行事→意味→準備候補→通知候補→季節文化が一つのWireflowで追える
- [x] 妊娠期と出生後を分け、出生後情報への移行候補を扱っている
- [x] エラー、未入力、過去行事、延期、重複、非実施、通知拒否、削除等の状態・回復候補がある
- [x] D-002 / D-003 / D-013の確定事項と矛盾しない
- [x] D-004 / D-005の判断単位と選択肢候補が比較可能である
- [x] D-006〜009、D-017の未決定事項を先取りしていない
- [x] 後続Workstream・Taskへの入力が追跡できる
- [x] ReviewerがPassしている
- [x] Issue、Project、引継ぎメモを更新した

## 証拠・確認方法

- D-001〜003、D-013との対象、件数、重複、品質Gateの突合
- Product validation briefとのPrimary User・Core / Extended Valueの突合
- Event scope matrixとの状態・例外・検証分母引継ぎの突合
- Validation Leadによる体験連続性、反証可能性、未観測・非実施、未決定機能の先取り有無の独立レビュー
- `pwsh ./scripts/check-docs.ps1`
- `git diff --check`

## 操作権限

- 許可された操作：画面・状態・Journey候補の整理、既決定事項の可視化、D-004 / D-005の比較材料作成、Issue / Project進捗記録
- 人間承認が必要な操作：D-004 / D-005の採否、対象・件数・Primary User・品質Gateの変更、Frozen Scope、予算、契約、公開、個人情報利用
- 禁止する操作・データ：未決定機能のMust化、生年月日等の外部送信、高リスク内容の採用、未承認コンテンツの公開転用

## エスカレーション条件

- D-002 / D-003の対象を減らさないと一続きの体験が成立しない
- 妊娠期体験を成立させるため予定日入力を比較なしでMustにする必要がある
- D-004 / D-005を先に決めないと状態・例外の候補を整理できない
- D-ID、Gate、Frozen Scope、予算、契約、公開、個人情報に変更が必要
- 完了条件を満たせず例外承認が必要

## Reviewer記録

- 判定：Pass（軽微Rework後に再レビュー）
- 確認日：2026-08-16
- 確認内容：Core / Extended Valueの連続性、妊娠期から出生後への移行、未入力・過去・延期・非実施・重複・通知拒否・削除等の状態と回復、D-004 / D-005判断材料、未決定事項の留保を確認。初回レビューで不足していた季節文化通知の復帰先、通知分母連鎖、家庭日程調整・過去行事の判断単位を追加後、再レビューでPass。
- 残存リスク：D-004 / D-005のHuman判断、D-006の技術方式、D-007〜009の計測・判定、D-017の準備意向CTAは未決定。これらは意図した後続判断であり、本Taskでは確定しない。
