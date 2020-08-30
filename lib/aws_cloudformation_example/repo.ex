defmodule AwsCloudformationExample.Repo do
  use Ecto.Repo,
    otp_app: :aws_cloudformation_example,
    adapter: Ecto.Adapters.Postgres
end
