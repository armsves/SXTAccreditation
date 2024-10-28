#!/bin/bash

# Load variables from .env file
source ./.env

# Define the full command instead of using an alias
SXTCLI_CMD="java -jar /home/armsve/bin/SXTCLI/sxtcli-0.0.8.jar"

CREATE_SQL=$(cat << EOM

  CREATE TABLE SXTTemp.Test_armsves@gmail.com
  ( MyID              INTEGER
  , MyBigint          BIGINT
  , MyText            VARCHAR
  , MyDate            DATE
  , MyBoolean         BOOLEAN
  , MyDecimal         DECIMAL(18,2)
  , MyFloat           FLOAT
  , MyJson            JSONB
  , MyTimestamp       TIMESTAMP
  , primary key(MyID)
  )
  with "public_key=$RESOURCE_PUBLIC_KEY,access_type=permissioned";

EOM
)

# Use the full command
$SXTCLI_CMD sql --url=$API_URL --accessToken=$ACCESS_TOKEN --sqlText="$CREATE_SQL" --biscuits=$ADMIN_BISCUIT