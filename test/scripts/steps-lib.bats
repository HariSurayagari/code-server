#!/usr/bin/env bats

SCRIPT_NAME="steps-lib.sh"
SCRIPT="$BATS_TEST_DIRNAME/../../ci/steps/$SCRIPT_NAME"

source "$SCRIPT"

@test "is_env_var_set should return 1 if env var is not set" {
  run is_env_var_set "ASDF_TEST_SET"
  [ "$output" = 1 ]
}

@test "is_env_var_set should return 0 if env var is set" {
  ASDF_TEST_SET="test" run is_env_var_set "ASDF_TEST_SET"
  [ "$output" = 0 ]
}

@test "directory_exists should 1 if directory doesn't exist" {
  run directory_exists "/tmp/asdfasdfasdf"
  [ "$output" = 1 ]
}

@test "directory_exists should 0 if directory exists" {
  run directory_exists "$(pwd)"
  [ "$output" = 0 ]
}