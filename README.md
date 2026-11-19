# qs-ci-demo

Live demo of the free [Ship-Ready quick scan](https://github.com/getshipready/ship-ready-skills) running as a GitHub Action on pull requests. It runs locally on the CI runner, no code upload. The workflow pins the scanner to tag `v0.2.4`.

- [PR #1: Add notes table without RLS](https://github.com/getshipready/qs-ci-demo/pull/1): creates a table without enabling RLS. The check fails.
- [PR #2: Add projects table with RLS](https://github.com/getshipready/qs-ci-demo/pull/2): RLS plus owner policies. The check passes.

Get the scanner and the workflow: https://github.com/getshipready/ship-ready-skills (`examples/github-actions/ship-ready-quick-scan.yml`).

Static heuristics, not a penetration test.
