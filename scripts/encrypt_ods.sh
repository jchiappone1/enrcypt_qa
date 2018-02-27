#!/bin/bash
#my start of a shell script to decript/encrpt ods data, called by Pentaho job Ruby_Rake_Encrypt  during nightly load

#set ruby path  from:  gem env
export PATH=$PATH:$HOME/bin:/usr/local/rbenv/versions/2.3.1/lib/ruby/gems/2.3.0:/usr/local/rbenv/versions/2.3.1/bin/:/usr/local/rbenv/versions/2.3.1/bin

#export PATH=$PATH:/app/ods_core_etl_helper


progress(){

### Turn on debug mode ###
#  set -x

# Run shell commands
#echo "Hello $(LOGNAME)"
echo "Today is $(date)"
### Turn OFF debug mode ###
# set +x

echo $PATH

  echo -n "$0: Please wait..."
  while true
  do
    echo -n "."
    sleep 5
  done

}

dobackup(){
    # get pid of penthao kitchen
#sdi_init > /home/ec2-user/mylog.log 2>&1

#PROCESS=$1
PIDS=`ps cax | grep kitchen | grep -o '^[ ]*[0-9]*'`
if [ -z "$PIDS" ]; then
  echo "Process not running." 1>&2
#  exit 1
else
  for PID in $PIDS; do
    echo $PID
  done
fi



}

call_encrypt_user()
{
echo "my_working_path is: " $PWD
echo "my_export_path is: " $PATH
echo "running: call_encrypt_user"

RAILS_ENV=production bundle exec rake db:decrypt:init[stage_dim_user,user_key] TARGET_COLUMNS=encrypted_first_name,encrypted_last_name,encrypted_ssn,encrypted_external_pin,bill_addr1,bill_addr2,ship_addr1,ship_addr2,current_encrypted_first_name,current_encrypted_last_name

#RAILS_ENV=production bundle exec rake db:decrypt:init[stage_dim_event,event_key] TARGET_COLUMNS=encrypted_street,encrypted_suite,street,suite

}

call_encrypt_event()
{

echo "running: call_encrypt_event"
RAILS_ENV=production bundle exec rake db:decrypt:init[stage_dim_event,event_key] TARGET_COLUMNS=encrypted_street,encrypted_suite,street,suite

}


call_encrypt_program()
{

echo "running: call_encrypt_program"
RAILS_ENV=production bundle exec rake db:decrypt:init[stage_dim_program,program_id] TARGET_COLUMNS=shipping_address_encrypted_street,shipping_address_encrypted_suite

}

call_encrypt_entity()
{
echo "running: call_encrypt_entity "

RAILS_ENV=production bundle exec rake db:decrypt:init[stage_dim_entity,entity_key] TARGET_COLUMNS=shipping_address_encrypted_street,shipping_address_encrypted_suite

}


call_encrypt_phys_address()
{
echo "running: call_encrypt_physican_address "

RAILS_ENV=production bundle exec rake db:decrypt:init[stage_two_physician_addresses,id] TARGET_COLUMNS=encrypted_street,encrypted_suite

}


call_encrypt_insurance_policy()
{
echo "running: call_encrypt_insurance_policy "

RAILS_ENV=production bundle exec rake db:decrypt:init[stage_dim_insurance_policy,insurance_policy_key] TARGET_COLUMNS=shipping_address_encrypted_street,shipping_address_encrypted_suite

}


call_encrypt_lab()
{
echo "running: call_encrypt_lab "

RAILS_ENV=production bundle exec rake db:decrypt:init[stage_dim_lab,lab_key] TARGET_COLUMNS=shipping_address_encrypted_street,shipping_address_encrypted_suite,billing_address_encrypted_street,billing_address_encrypted_suite

}


call_encrypt_patient_service_center()
{
echo "running: call_encrypt_patient_service_center "

RAILS_ENV=production bundle exec rake db:decrypt:init[stage_dim_patient_service_center,patient_service_center_key] TARGET_COLUMNS=encrypted_street,encrypted_suite

}

#20171016  not active - pending core encryption ticket open 
call_encrypt_event_reservation()
{
echo "running: encrypt_event_reservation "

RAILS_ENV=production bundle exec rake db:decrypt:init[stage_dim_event_reservation,event_reservation_id] TARGET_COLUMNS=signature_text

}




check_file(){
# Store path to commands the need is to timestamp and move this file.  Check with Pavan on permissions
LOGGER=/tmp/job_logger
FILE=/app/ods_core_etl_helper/log/production.log

# Store email settings
AEMAIL="jchiappone@bioiq.com"
ASUB="Error - $(hostname)"
AMESS="Warning - Errors found on $(hostname) @ $(date). log file exist sdi_init active:   /tmp/job_logger/active.log"
OK_MESS="OK: active_log Not Found ."
WARN_MESS="ERROR: Hello Kitchen Process File Exist."


# Check if $FILE exists or not
if test ! -f "$FILE" 
then   
  echo "Error - $FILE not found."
  exit 1
fi

# okay search for errors in file
error_log=$(grep -c -i "error" $FILE)

# error found or not?
if [ $error_log -gt 0 ]
then    # yes error(s) found, let send an email
  echo "$AMESS" | mail -s "$ASUB" $AEMAIL
else    # naa, everything looks okay
  echo "$OK_MESS"
fi

}



# Start it in the background
# progress &



# Save progress() PID
# You need to use the PID to kill the function
MYSELF=$!
echo "Hello-Pid Is " $MYSELF

set +e

# Start backup
# Transfer control to dobackup()
dobackup
#check_file

call_encrypt_user
call_encrypt_event
call_encrypt_program
call_encrypt_entity
call_encrypt_phys_address
call_encrypt_insurance_policy
call_encrypt_lab
call_encrypt_patient_service_center
# call_encrypt_event_reservation

set -e

# Kill progress (don't kill me yet)
# kill $MYSELF >/home/bioiq 2>&1
#kill -15  $MYSELF

echo -n "...encryption done."
