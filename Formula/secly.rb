class Secly < Formula
  desc "Standalone local UI for managing GitHub repository variables"
  homepage "https://github.com/chenghsj/secly"
  url "https://github.com/chenghsj/secly/releases/download/v0.1.6/secly-0.1.6-standalone.tar.gz"
  version "0.1.6"
  sha256 "8500a9afdd898eedd57bb51b88b9e5a257adea6753ffe0fa7458dbc2d2a6e510"

  depends_on "gh"
  depends_on "node"

  def install
    libexec.install Dir["*"]
    (bin/"secly").write <<~EOS
      #!/bin/bash
      exec /usr/bin/env node "#{libexec}/bin/secly.mjs" "$@"
    EOS
    chmod 0755, bin/"secly"
  end

  def caveats
    <<~EOS
      Before removing the Homebrew formula, run:
        secly uninstall --force

      Then remove the formula itself:
        brew uninstall secly
    EOS
  end

  test do
    output = shell_output("#{bin}/secly paths")
    assert_match "App data root:", output
  end
end
