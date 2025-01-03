defmodule ElixirStdlib.MixProject do
  use Mix.Project

  @app :elixir_stdlib
  @version "0.1.0"
  @elixir_version "~> 1.16"
  @source_url "https://github.com/elixir-stdlib/elixir_stdlib"

  def project do
    [
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      name: "ElixirStdlib",
      description: "Extended Elixir",
      app: @app,
      version: @version,
      elixir: @elixir_version,
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      test_coverage: test_coverage(),
      preferred_cli_env: preferred_cli_env(),
      package: package(),
      docs: docs(),
      dialyzer: dialyzer()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      # Tools
      {:dialyxir, ">= 0.0.0", only: [:dev], runtime: false},
      {:credo, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:excoveralls, ">= 0.0.0", only: [:test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: [:dev], runtime: false}
    ]
  end

  defp test_coverage do
    [tool: ExCoveralls]
  end

  defp preferred_cli_env do
    [
      "coveralls.html": :test,
      "coveralls.json": :test,
      coveralls: :test
    ]
  end

  defp aliases do
    [
      test: ["test --trace"]
    ]
  end

  defp dialyzer do
    [
      plt_core_path: "priv/plts",
      ignore_warnings: ".dialyzer_ignore.exs"
    ]
  end

  defp package do
    [
      name: @app,
      files: [
        ".formatter.exs",
        "lib",
        "mix.exs",
        "README*",
        "LICENSE*"
      ],
      maintainers: ["Yordis Prieto"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url,
        "Changelog" => "#{@source_url}/blob/#{@version}/CHANGELOG.md"
      }
    ]
  end

  defp docs do
    [
      main: "readme",
      homepage_url: @source_url,
      source_url: @source_url,
      source_ref: "v#{@version}",
      skip_undefined_reference_warnings_on: ["CHANGELOG.md"],
      extras: [
        "README.md",
        "CHANGELOG.md",
        LICENSE: [title: "License"]
      ]
    ]
  end
end
