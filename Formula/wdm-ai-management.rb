include Language::Python::Virtualenv

class WdmAiManagement < Formula
  desc "Manage AI agents, skills, MCP servers, rules, workflows, hooks, and harnesses"
  homepage "https://github.com/WD-Mitchell/WDM-AI-Management"
  url "https://github.com/WD-Mitchell/WDM-AI-Management/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "f12d43f278abef9fdbd60acf27466bd97fc9aea6df096bc44e932577d9e47bc7"
  license "MIT"

  depends_on "python@3.14"

  resource "PyYAML" do
    url "https://github.com/WD-Mitchell/WDM-AI-Management/archive/refs/tags/v1.1.0.tar.gz"
    sha256 "f12d43f278abef9fdbd60acf27466bd97fc9aea6df096bc44e932577d9e47bc7"
  end

  def install
    libexec.install Dir["*"]
    venv = virtualenv_create(libexec/"venv", "python3.14")
    venv.pip_install resources

    (bin/"wdm-ai").write <<~EOS
      #!/bin/bash
      export PYTHONPATH="#{libexec}:$PYTHONPATH"
      exec "#{libexec}/venv/bin/python" "#{libexec}/bin/wdm-ai" "$@"
    EOS
  end

  def post_install
    system bin/"wdm-ai", "bootstrap", "--quiet"
  end

  test do
    system bin/"wdm-ai", "--help"
  end
end
