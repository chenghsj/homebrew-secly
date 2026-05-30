class Secly < Formula
  desc "Standalone local UI for managing GitHub repository variables"
  homepage "https://github.com/chenghsj/secly"
  url "https://github.com/chenghsj/secly/releases/download/v0.1.5/secly-0.1.5-standalone.tar.gz"
  version "0.1.5"
  sha256 "5d3a104f5252fd766b9b8c641397d0bc41e19e06eb3b3a37993893d668a9a7b2"

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
