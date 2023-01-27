#!/bin/bash -e

source dev-container-features-test-lib

check '${templateOption:testCommand}' ${templateOption:testCommand}

reportResults
