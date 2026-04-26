# Mindburn Labs Homebrew Tap

Formulae for Mindburn Labs command-line tools.

## Install HELM OSS

```sh
brew install mindburnlabs/tap/helm
```

The full direct form also works:

```sh
brew install mindburnlabs/homebrew-tap/helm
```

Then run:

```sh
helm serve --policy ./release.high_risk.v3.toml
```

This installs the HELM OSS boundary CLI from release binaries published at:

https://github.com/Mindburn-Labs/helm-oss/releases

## Kubernetes Helm Conflict

Homebrew core also ships a formula named `helm` for Kubernetes Helm. Homebrew
does not allow two installed formulae with the same name from different taps.

If Kubernetes Helm is already installed, replace it with HELM OSS:

```sh
brew uninstall helm
brew install mindburnlabs/tap/helm
```

To switch back later:

```sh
brew uninstall mindburnlabs/tap/helm
brew install helm
```

## Intended Public Namespace

The quickstart target remains:

```sh
brew install mindburn/tap/helm
```

That requires the GitHub repository `mindburn/homebrew-tap`. Homebrew maps
repositories named `homebrew-*` to short tap names, so `mindburn/homebrew-tap`
becomes `mindburn/tap`.

## Other Formulae

Use:

```sh
brew install mindburnlabs/tap/<formula>
```

Or:

```sh
brew tap mindburnlabs/tap
brew install <formula>
```

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "mindburnlabs/tap"
brew "<formula>"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
