# リスク台帳

最終更新：2026年8月15日

| ID | リスク | 早期兆候 | 予防・対応 | Owner | 状態 |
|---|---|---|---|---|---|
| `R-001` | 正本文書間の方針ドリフト | 同じ概念のPhase・名称・Gateが文書ごとに異なる | D-IDと正本優先順位を使い、横断変更は同一PRで更新 | AI PM | Open |
| `R-002` | AIが判断・公開権限を越える | D-ID未決でDone、明示承認なしの外部変更 | Task Briefの承認境界、PR、責任者マージを必須化 | AI PM | Open |
| `R-003` | 秘密情報・個人情報の混入 | `.env`、証明書、実ユーザーデータが差分に出る | ignore、合成データ、PR確認、露出時の失効 | Data / Legal | Open |
| `R-004` | MLPがWeb簡易MVPまたは機能過多へ戻る | Web版の開発タスク、Frozen Scope外の追加 | 実行計画とAGENTS.mdで禁止し、変更はD-ID化 | Product / Validation | Open |
| `R-005` | 広告反応をProduct需要と誤認する | CTRやLINE CVRのみでGo判定 | Product / Channel Validationを分離しGateを事前固定 | Validation / Data | Open |
| `R-006` | 責任者判断待ちで停滞する | Decision Neededが3件を超える、1営業日を超えて滞留 | D-019に基づき新規着手を抑制し判断処理を優先 | 責任者 / AI PM | Mitigated |
| `R-007` | 時間・費用が上限なく増える | WIP増加、Phase 0の9月6日超過、Phase 1の10週／280時間超過見込み、新規有料利用の提案 | D-018〜021、WIP上限、Phase 0・1の追加支出0円、Phase 1の週次EACを適用 | 責任者 / AI PM | Mitigated |
| `R-008` | 公開LPと将来構想の表示が不整合 | 未提供機能を現提供のように表示 | Marketing / Legal Gateと公開前確認 | Marketing / Legal | Open |

新規リスクは、発生確率だけでなく、兆候・Owner・対応・見直し日を持たせる。Phase GateではOpenの高影響リスクを必ず提示する。
