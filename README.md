Rust MUSL Builder Action
========================

![GitHub](https://img.shields.io/github/license/sevco/rust-musl-action)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/sevco/rust-musl-action)
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/sevco/rust-musl-action/CI)

GitHub action for building statically linked rust binaries (x86_64-unknown-linux-musl) Based on [emk/rust-musl-builder](https://github.com/emk/rust-musl-builder).

```yaml
- uses: sevco/rust-musl-action@v1.0.1
  with:
    args: build --release --all-features
    git_credentials: ${{ secrets.GIT_CREDENTIALS }}
```
### Inputs
| Variable | Description | Required | Default |
|----------|-------------|----------|---------|
| args     | Arguments passed to cargo | true | `build --release` | 
| git_credentials | If provided git will be configured to use these credentials and https | false | |
| directory | Relative path under $GITHUB_WORKSPACE where Cargo project is located | false | |
