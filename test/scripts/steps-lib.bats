#!/usr/bin/env bats

SCRIPT_NAME="steps-lib.sh"
SCRIPT="$BATS_TEST_DIRNAME/../../ci/steps/$SCRIPT_NAME"

source "$SCRIPT"

@test "is_env_var_set should return false if env var is not set" {
  run is_env_var_set "ASDF_TEST_SET"
  [ "$status" -eq 1 ]
}

@test "is_env_var_set should return true if env var is set" {
  ASDF_TEST_SET="test" run is_env_var_set "ASDF_TEST_SET"
  [ "$status" -eq 0 ]
}
