class Secly < Formula
  desc "Standalone local UI for managing GitHub repository variables"
  homepage "https://github.com/chenghsj/secly"
  url "https://github.com/chenghsj/secly/releases/download/v0.1.7/secly-0.1.7-standalone.tar.gz"
  version "0.1.7"
  sha256 "d20f817d56d22808f089824eb4f728836f3f313b3ff3e15e6727986f60a2b360"

  depends_on arch: :arm64
  depends_on "gh"
  depends_on "node@22"

  def install
    libexec.install Dir["*"], ".secly-standalone"
    node = formula_opt_bin("node@22")/"node"
    (bin/"secly").write <<~EOS
      #!/bin/bash
      exec "#{node}" "#{libexec}/bin/secly.mjs" "$@"
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
    native_module = libexec/"build/Release/better_sqlite3.node"
    assert_path_exists libexec/".secly-standalone"
    system formula_opt_bin("node@22")/"node", "-e", "require(#{native_module.to_s.dump})"
    output = shell_output("#{bin}/secly paths")
    assert_match "App data root:", output
  end
end
