sudo apt-get install default-jre
java --version
mkdir /home/armsve/bin/SXTCLI
curl -o /home/armsve/bin/SXTCLI/sxtcli-0.0.8.jar https://spaceandtime.jfrog.io/artifactory/sxt-maven-public/io/spaceandtime/client/sxtcli/0.0.8/sxtcli-0.0.8.jar
echo "alias sxtcli='java -jar /home/armsve/bin/sxtcli-0.0.8.jar'" >> ~/.bashrc
source ~/.bashrc
stxcli version
sxtcli authenticate keypair
sxtcli authenticate keychain \
--accessToken="eyJ0eXBlIjoiYWNjZXNzIiwia2lkIjoiZTUxNDVkYmQtZGNmYi00ZjI4LTg3NzItZjVmNjN..." \
--url="https://api.spaceandtime.dev" \
add \
--privateKey="ft2oz41taXy1KtAyNzGOqxnHGbNSSXV8xpxN6FpN8w=" \
--publicKey="eIMaJpSbLC6jyAG9RfwvklgsXbDcdHI2eH7TitL2pA="

sxtcli authenticate login \
  --url="https://api.spaceandtime.dev" \
  --userId="your_userid" \
  --publicKey="your_public_key" \
  --privateKey="your_private_key"

  ACCESS_TOKEN=$( \
  sxtcli authenticate login \
  --url="https://api.spaceandtime.dev" \
  --userId="your_userid" \
  --publicKey="your_public_key" \
  --privateKey="your_private_key" | awk 'NR==2{ print $2 }' )

  curl --request POST \
--url "https://api.spaceandtime.app/v1/sql" \
--header "accept: application/json" \
--header "authorization: Bearer $ACCESS_TOKEN" \
--header "content-type: application/json" \
--data '{
    "sqlText": "Select count(*) as Blocks_Yesterday from Ethereum.Blocks where time_stamp between current_date-1 and current_date"
}'

SQL="Select cast(time_stamp as date) as Block_Date, count(*) as Block_Count from ZKSYNCERA.BLOCKS where time_stamp between current_date-3 and current_date group by 1 order by 1"
API_URL="https://api.spaceandtime.dev"
sxtcli sql --url=$API_URL --accessToken=$ACCESS_TOKEN --sqlText=$SQL
