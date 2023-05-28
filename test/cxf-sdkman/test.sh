#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "type java2js && type wsdl2xml" type java2js && type wsdl2xml

reportResults
