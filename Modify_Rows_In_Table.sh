INSERT_SQL=$(cat << EOM
INSERT INTO SXTTemp.Test_armsves
(MyID, MyBigint, MyText, MyDate, MyBoolean, MyDecimal, MyFloat, MyJson, MyTimestamp)
VALUES  
  ( 1, 1e12, 'Foo', '2024-10-31', true, 1.1, 1.11111 * 1e-9, '{"a":1, "b":2}', '2024-10-31 00:00:00' )
, ( 2, 2e12, 'Foo', '2024-10-31', true, 2.2, 1.22222 * 1e-9, '{"a":1, "b":2}', '2024-10-31 06:59:59' )
, ( 3, 3e12, 'Foo', '2024-10-31', true, 3.3, 1.33333 * 1e-9, '{"a":1, "b":2}', '2024-10-31 12:59:59' )
, ( 4, 4e12, 'Foo', '2024-10-31', true, 4.4, 1.44444 * 1e-9, '{"a":1, "b":2}', '2024-10-31 18:59:59' )
, ( 5, 5e12, 'Foo', '2024-10-31', true, 5.5, 1.55555 * 1e-9, '{"a":1, "b":2}', '2024-10-31 23:59:59' )
EOM
)

sxtcli sql \
  --url=$API_URL \
  --accessToken=$ACCESS_TOKEN \
  --sqlText="$INSERT_SQL" \
  --biscuits=$ADMIN_BISCUIT

INSERT_SQL=$(cat << EOM
INSERT INTO SXTTemp.Test_armsves
VALUES  
  ( 6, 6e12, 'Foo', '2024-10-31', true, 6.6, 1.66666 * 1e-9, '{"a":1, "b":2}', '2024-10-31 23:59:59' )
, ( 7, 7e12, 'Foo', '2024-10-31', true, 7.7, 1.77777 * 1e-9, '{"a":1, "b":2}', '2024-10-31 23:59:59' )
, ( 8, 8e12, 'Foo', '2024-10-31', true, 8.8, 1.88888 * 1e-9, '{"a":1, "b":2}', '2024-10-31 23:59:59' )
EOM
)

sxtcli sql \
  --url=$API_URL \
  --accessToken=$ACCESS_TOKEN \
  --sqlText="$INSERT_SQL" \
  --biscuits=$ADMIN_BISCUIT


INSERT_SQL=$(cat << EOM
INSERT INTO SXTTemp.Test_armsves
(MyID, MyBoolean)
VALUES  
  (  9, true)
, ( 10, true)
EOM
)

sxtcli sql \
  --url=$API_URL \
  --accessToken=$ACCESS_TOKEN \
  --sqlText="$INSERT_SQL" \
  --biscuits=$ADMIN_BISCUIT


UPDATE_SQL=$(cat << EOM
UPDATE SXTTemp.Test_armsves
SET 
  MyBoolean = false
, MyText = 'Bar'
WHERE MyID in(1,3,5,7,9)
EOM
)

sxtcli sql \
  --url=$API_URL \
  --accessToken=$ACCESS_TOKEN \
  --sqlText="$UPDATE_SQL" \
  --biscuits=$ADMIN_BISCUIT

DELETE_SQL=$(cat << EOM
SELECT * FROM SXTTemp.Test_armsves
WHERE MyID between 1 and 5
EOM
)

sxtcli sql \
  --url=$API_URL \
  --accessToken=$ACCESS_TOKEN \
  --sqlText="$DELETE_SQL" \
  --biscuits=$ADMIN_BISCUIT

DELETE_SQL=$(cat << EOM
DELETE FROM SXTTemp.Test_armsves
WHERE MyID between 1 and 5
EOM
)

sxtcli sql \
  --url=$API_URL \
  --accessToken=$ACCESS_TOKEN \
  --sqlText="$DELETE_SQL" \
  --biscuits=$ADMIN_BISCUIT



INSERT_SQL=$(cat << EOM
INSERT INTO SXTTemp.Test_armsves
(MyID, MyBoolean)
VALUES  
  (  33345, true)
, ( 33, true)
, ( 234, true)
, ( 742, true)
, ( 422, true)
, ( 13, true)
, ( 564, true)
, ( 456, true)
, ( 768, true)
, ( 999, true)
EOM
)

sxtcli sql \
  --url=$API_URL \
  --accessToken=$ACCESS_TOKEN \
  --sqlText="$INSERT_SQL" \
  --biscuits=$ADMIN_BISCUIT


UPDATE_SQL=$(cat << EOM
UPDATE SXTTemp.Test_armsves
SET MyBoolean = false
WHERE MyID % 2 <> 0;
EOM
)

sxtcli sql \
  --url=$API_URL \
  --accessToken=$ACCESS_TOKEN \
  --sqlText="$UPDATE_SQL" \
  --biscuits=$ADMIN_BISCUIT
