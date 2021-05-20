Rust MUSL Builder Action
========================

![GitHub](https://img.shields.io/github/license/sevco/rust-musl-action)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/sevco/rust-musl-action)
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/sevco/rust-musl-action/CI)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/sevcosec/rust-musl-action)
![Docker Image Version (latest semver)](https://img.shields.io/docker/v/sevcosec/rust-musl-action)

GitHub action for building statically linked rust binaries (x86_64-unknown-linux-musl) Based on [emk/rust-musl-builder](https://github.com/emk/rust-musl-builder).

```yaml
- uses: sevco/rust-musl-action@v1.0.0
  with:
    args: build --release --all-features
    credentials: ${{ secrets.GIT_CREDENTIALS }}
```
### Inputs
| Variable | Description | Required | Default |
|----------|-------------|----------|---------|
| args     | Arguments passed to cargo | true | `build --release` | 
| credentials | If provided git will be configured to use these credentials and https | false | |
| directory | Relative path under $GITHUB_WORKSPACE where Cargo project is located | false | |
