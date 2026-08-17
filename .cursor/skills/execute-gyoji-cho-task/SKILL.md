---
name: execute-gyoji-cho-task
description: Executes a GYOJI-CHO Task ID or OPS issue in Cursor using Task Brief, WIP, review, and approval boundaries. Use when starting, running, reviewing, or completing a Phase task or OPS-### issue.
---

# Execute a GYOJI-CHO task

## Before editing

1. Read `README.md`, `docs/project-operating-policy.md`, `docs/phase-0-2-execution-plan.md`, `docs/ai-agent-operating-model.md`, the assigned Task Brief, and related D-ID records.
2. Confirm the task is Ready: dependencies, required D-IDs, Task Brief, owner, reviewer, output path, and completion criteria.
3. If Ready is incomplete, stop after listing the missing items. Do not improvise a new D-ID.

## Execute

1. Work from one Task ID or `OPS-###` only.
2. Create or use `cursor/<task-id>-<short-slug>` for AI branches.
3. Put Phase artifacts under `docs/workstreams/<workstream>/` and operational records under `docs/operations/`.
4. Write documents in Japanese. Keep identifiers and product names canonical.
5. For independent Workstream execution, use the matching `.cursor/agents/` subagent. For Phase Gates or high-impact review, use `gate-reviewer` and do not let the author self-approve.

## Verify

1. Run `pwsh ./scripts/check-docs.ps1` for documentation or governance changes.
2. For code, run the build, tests, lint, and manual path checks in the Task Brief.
3. Inspect the diff for unrelated edits, secrets, placeholders, conflict markers, and stale references.

## Stop

Do not push, open a PR, publish, send messages, spend money, accept contracts, or change external services without explicit user approval. Escalate D-ID, budget, Gate exceptions, personal data, and scope expansion to the human owner.
