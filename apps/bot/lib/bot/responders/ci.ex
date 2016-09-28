defmodule Bot.Responders.Ci do
  @moduledoc """
  Responsible for listening for and parsing the commands to interact with the Continuous Integration (CI) service.
  """

  use Hedwig.Responder

  @ci_name "CircleCI"

  @usage """
  hedwig: deploy <branch name> branch to (QA|qa) - Instruct CI to deploy a branch to QA.
  """
  respond ~r/deploy\s(?<branch>\w+|\w+\/.+)\sbranch\sto\s(?<env>qa|QA)/i, msg do
    reply msg, deploy_reply(msg.matches["branch"], msg.matches["env"])
  end

  respond ~r/Foo/i, msg do
    reply msg, "Bar"
  end

  @doc """
  Helper function to build a reply.
  """
  @spec deploy_reply(String.t, String.t) :: String.t
  def deploy_reply(branch, env) do
    "Ok Michael, I'll have #{@ci_name} deploy #{branch} branch to #{env}."
  end
end
