# Operations

このディレクトリは、GYOJI-CHOの実行状態、判断、レビュー、リスクを追跡するための運用記録を置く。

| パス | 用途 | 正本の範囲 |
|---|---|---|
| `task-board.md` | GitHub Project移行時点のアーカイブ | 2026年8月16日時点の履歴だけ |
| `task-briefs/` | 個別タスクの実行指示 | 範囲、成果物、完了条件、権限 |
| `decisions/` | D-IDの確定記録 | 責任者が決めた事業・仕様判断 |
| `gate-reviews/` | Phase Gate記録 | 証拠、反証、責任者判断 |
| `risk-register.md` | 横断リスク | リスク、兆候、対応、Owner |
| `access-and-data-policy.md` | 秘密情報・データ・外部権限 | 安全な取り扱いと承認境界 |

日々の状態管理は [GitHub Project #6](https://github.com/users/ryo-chan-k6/projects/6) とGitHub Issuesを正本とする。`task-board.md` は移行済みアーカイブであり、二重更新は行わない。

全体ルールは [`../project-operating-policy.md`](../project-operating-policy.md) を参照する。AIの主実行環境はCursorで、共通指示は [`../../AGENTS.md`](../../AGENTS.md)、役割定義は `.cursor/agents/` を正本とする。
