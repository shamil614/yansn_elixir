defmodule App.Bot.Responders.CiTest do
  # See Hedwig pkg for details
  use Hedwig.RobotCase
  require IEx

  @responders [{Bot.Responders.Ci, []}]
  @bot_name "kitt"

  # Same setup as Hedwig pkg for testing
  @tag start_robot: true, name: @bot_name, responders: @responders
  test "responds to deploying a simple branch name to QA", %{adapter: adapter, msg: msg} do
    branch_name = "develop"
    env = "QA"
    reply = Bot.Responders.Ci.deploy_reply(branch_name, env)
    text = "testuser: #{reply}"

    send adapter, {:message, %{msg | text: "kitt deploy #{branch_name} branch to #{env}"}}
    assert_receive {:message, %{text: text}}
  end

  @tag start_robot: true, name: @bot_name, responders: @responders
  test "responds to deploying a complex branch name to QA", %{adapter: adapter, msg: msg} do
    branch_name = "feature/XX_X-1234"
    env = "QA"
    reply = Bot.Responders.Ci.deploy_reply(branch_name, env)
    text = "testuser: #{reply}"

    send adapter, {:message, %{msg | text: "kitt deploy #{branch_name} branch to #{env}"}}
    assert_receive {:message, %{text: text}}
  end

  @tag start_robot: true, name: @bot_name, responders: @responders
  test "responds to deploying a release branch name to QA", %{adapter: adapter, msg: msg} do
    branch_name = "feature/v1.2.3"
    env = "QA"
    reply = Bot.Responders.Ci.deploy_reply(branch_name, env)
    text = "testuser: #{reply}"

    send adapter, {:message, %{msg | text: "kitt deploy #{branch_name} branch to #{env}"}}
    assert_receive {:message, %{text: text}}
  end

  @tag start_robot: true, name: @bot_name, responders: @responders
  test "responds to deploying a hotfix branch name to QA", %{adapter: adapter, msg: msg} do
    branch_name = "hotfix/v1.2.3"
    env = "QA"
    reply = Bot.Responders.Ci.deploy_reply(branch_name, env)
    text = "testuser: #{reply}"

    send adapter, {:message, %{msg | text: "kitt deploy #{branch_name} branch to #{env}"}}
    assert_receive {:message, %{text: text}}
  end
end
