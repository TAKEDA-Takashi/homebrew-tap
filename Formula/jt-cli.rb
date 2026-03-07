class JtCli < Formula
  desc "JSONata query and transformation tool for the command line"
  homepage "https://github.com/TAKEDA-Takashi/jt-cli"
  url "https://registry.npmjs.org/@2017takeda/jt-cli/-/jt-cli-1.3.0.tgz"
  sha256 "db237b288b699f571aa90952d6a4eea0776a1f332af426928e4c2c4b275003c9"
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