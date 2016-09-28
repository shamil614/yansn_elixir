defmodule Responders.Ci do
  @moduledoc """
  Responsible for listening for and parsing the commands to interact with the Continuous Integration (CI) service.
  """

  use Hedwig.Responder

  @ci_name "CircleCI"

  @usage """
  deploy <branch name> branch to (QA|qa) Instruct CI to deploy a branch to QA.
  """
  respond ~r/\Adeploy\s(?<branch>\w+|\w+\/.+)\sbranch\sto\s(?<env>qa|QA)\z/i, msg do
    str = "Ok Michael, I'll ask #{@ci_name} to deploy #{msg.matches["branch"]} to #{msg.matches["env"]}."
    reply msg, str
  end
end
