#!/bin/bash

set -e

echo "=> Starting and running Glassfish server"
asadmin start-domain -v
