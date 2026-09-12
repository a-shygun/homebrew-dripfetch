class Dripfetch < Formula
  include Language::Python::Virtualenv

  desc "Customizable terminal system information display with animated rain"
  homepage "https://github.com/a-shygun/dripfetch"
  url "https://files.pythonhosted.org/packages/source/d/dripfetch/dripfetch-0.2.0.tar.gz"
  sha256 "0e8e47bf3bfa6f46b9ca085fd9745610795caded381fd6ea8f8db20f68ee9d93"
  license "MIT"

  depends_on "python@3.12"

  resource "psutil" do
    url "https://files.pythonhosted.org/packages/source/p/psutil/psutil-7.0.0.tar.gz"
    sha256 "7be9c3eba38beccb6495ea33afd982a44074b78f28c434a1f51cc07fd315c456"
  end

  resource "ruamel.yaml" do
    url "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel_yaml-0.19.1.tar.gz"
    sha256 "53eb66cd27849eff968ebf8f0bf61f46cdac2da1d1f3576dd4ccee9b25c31993"
  end

  resource "ruamel.yaml.clib" do
    url "https://files.pythonhosted.org/packages/source/r/ruamel.yaml.clib/ruamel_yaml_clib-0.2.15.tar.gz"
    sha256 "46e4cc8c43ef6a94885f72512094e482114a8a706d3c555a34ed4b0d20200600"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dripfetch --version")
  end
end