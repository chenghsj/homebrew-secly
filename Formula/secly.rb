class Secly < Formula
  desc "Standalone local UI for managing GitHub repository variables"
  homepage "https://github.com/chenghsj/secly"
  url "https://github.com/chenghsj/secly/releases/download/v0.1.0/secly-0.1.0-standalone.tar.gz"
  version "0.1.0"
  sha256 "85ebb0a241fbcab1e377c854229283e12afcf2f094e0851ac408612647d93eed"

  depends_on "gh"
  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/secly.mjs" => "secly"
  end

  test do
    output = shell_output("#{bin}/secly paths")
    assert_match "App data root:", output
  end
end
