class JtCli < Formula
  desc "JSONata query and transformation tool for the command line"
  homepage "https://github.com/TAKEDA-Takashi/jt-cli"
  url "https://registry.npmjs.org/@2017takeda/jt-cli/-/jt-cli-1.2.4.tgz"
  sha256 "e84a3fbd1835d63c6c3062f1a8c122f97e52a589c6e470eac625f5844abb1a95"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    # シンプルなJSONataクエリのテスト
    test_json = '{"name": "test", "value": 42}'
    output = shell_output("#{bin}/jt '$.name' <<< '#{test_json}'").strip
    assert_equal '"test"', output

    # バージョン確認
    assert_match version.to_s, shell_output("#{bin}/jt --version")
  end
end