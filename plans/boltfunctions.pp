# This is the structure of a simple plan. To learn more about writing
# Puppet plans, see the documentation: http://pup.pt/bolt-puppet-plans

# The summary sets the description of the plan that will appear
# in 'bolt plan show' output. Bolt uses puppet-strings to parse the
# summary and parameters from the plan.
# @summary A plan created with bolt plan new.
# @param targets The targets to run on.
plan boltvalidation::boltfunctions (
  TargetSpec $targets = 'localhost',
  String[1] $config = 'server',
  Optional[String[1]] $environment = 'production',
  Optional[String[1]] $section = undef,
) {
  if $section {
    $command_result = boltfunctions::configprint($config,$environment,$section)
  } else {
    $command_result = boltfunctions::configprint($config,$environment)
  }

  return $command_result
}
