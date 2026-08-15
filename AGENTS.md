# GYOJI-CHO Repository Instructions

## Start here

Before changing the repository, read:

1. `README.md`
2. `docs/project-operating-policy.md`
3. `docs/phase-0-2-execution-plan.md`
4. `docs/ai-agent-operating-model.md`
5. The assigned Task Brief and applicable D-ID records

Use the closest applicable `AGENTS.md` if a subdirectory adds one later.

## Product guardrails

- The current phase is Phase 0 unless the canonical documents say otherwise.
- Do not introduce a Web MVP. Product Validation uses an iOS MLP released through the App Store.
- Treat `docs/business-roadmap.md` as the overall strategy source of truth.
- Treat `docs/business-strategy.md` as the Phase 0–2 validation strategy source of truth.
- Treat `docs/phase-0-2-execution-plan.md` as the task catalog, not the live status board.
- Do not change Mission, target user, Frozen Scope, KPI/Gate thresholds, data policy, budget, or Go/Pivot/Stop decisions without a decided D-ID.

## Execution workflow

- Work from one Task ID or one `OPS-###` issue at a time.
- A task is Ready only when dependencies, required D-IDs, Task Brief, owner, reviewer, output path, and completion criteria are present.
- Branches created by Codex use `codex/<task-id>-<short-slug>`.
- Do not push, create a PR, publish, send messages, spend money, accept contracts, or change external services without explicit user approval.
- Do not push directly to `main`. Use a PR and squash merge; the human owner performs the final merge.
- Keep project-wide In Progress at 3 or fewer and each Workstream at 1 unless the operating policy is changed.
- Do not let two agents edit the same file or mutable dataset concurrently.
- A creator must not provide the final independent review of a high-impact artifact or Phase Gate.

## Files and documentation

- Preserve `public/` as the Cloudflare Pages publish root unless a decided change explicitly moves it.
- Put new Phase artifacts under `docs/workstreams/<workstream>/` and operational records under `docs/operations/`.
- Write project documents in Japanese. Keep code identifiers and external product names in their canonical form.
- Use `YYYY-MM-DD` for machine-oriented dates and `YYYY年M月D日` for reader-facing document metadata.
- Record sources, retrieval dates, assumptions, uncertainty, and regional variation when factual claims affect content or decisions.
- Update all affected canonical documents in the same PR when a decision changes shared terminology, phases, scope, metrics, or data handling.
- Do not treat Chat history, an Issue body, or an unapproved draft as a canonical decision.

## Safety and data

- Never commit secrets, credentials, certificates, provisioning profiles, recovery codes, or real user personal data.
- Do not send exact child birth dates, names, contact details, or other identifying attributes to analytics.
- Use synthetic data for tests and examples.
- Do not add external SDKs, tracking properties, or data retention without the applicable Data/Legal review and D-ID.
- Follow `docs/operations/access-and-data-policy.md`.

## Verification

- Run `pwsh ./scripts/check-docs.ps1` for documentation and repository-governance changes.
- For code changes, run the build, tests, lint, and relevant manual path checks defined in the Task Brief.
- Inspect the final diff for unrelated edits, secrets, unresolved placeholders, conflict markers, and stale cross-document references.
- If a required check cannot run, state why and provide the exact manual evidence used instead.

## Stop and escalate

Stop and ask the human owner when work requires a new or changed D-ID, budget, contract, publication, external write, personal-data handling, destructive operation, exception to a Gate, or expansion beyond the Task Brief.
