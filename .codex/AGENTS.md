# Working Agreements

## 1. Code Style & Quality

- PHP: PHPCS with my custom coding standards (`phpcs.xml`), PHPStan level ≥ 6.
- JS: ESLint (airbnb/base), Prettier.
- Commits: Conventional Commits.
- Branches: main (stable), develop, feature branches → PRs.
- CI Required Checks: lint, static analysis, unit/integration tests, e2e (smoke), composer validate. No merge to main without green.

## 2. Security Model

- Nonces on all state‑changing forms/requests; verify before mutate.
- Always sanitize input and escape output.

## 3. Build & Tooling

Composer dev deps:

- dealerdirect/phpcodesniffer-composer-installer
- squizlabs/php_codesniffer
- phpstan/phpstan
- phpunit/phpunit
