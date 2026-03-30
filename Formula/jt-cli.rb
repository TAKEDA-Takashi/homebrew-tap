class JtCli < Formula
  desc "JSONata query and transformation tool for the command line"
  homepage "https://github.com/TAKEDA-Takashi/jt-cli"
  url "https://registry.npmjs.org/@2017takeda/jt-cli/-/jt-cli-1.3.1.tgz"
  sha256 "df8b944d24c58cdad97593014164c066249d61dcd8a3148960bc63f72ea2994b"
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