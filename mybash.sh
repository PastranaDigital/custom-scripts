#!/bin/bash
LOGFILE_PATH="./" # store location of the log file
LOGFILE="{LOGFILE_PATH}/$(basname $0 | cut -d. -f1).log"

SF_ENVIRONMENT=""
CLIENT_ID=""
CLIENT_SECRET=""

get_credentials() {
    if [[ $RECON_USER == "" ]]; then
        sf_org=$TGT_USER
        #will keep only the ending of the login username starting at the @ and going right
        # a1234@usaa.com.ent.appdev => @usaa.com.ent.appdev
        USERNAME_ENDING=$(echo $TGT_USER | cut -d'@' -f 2) 
        # separates based on '.' so @usaa.com.ent.appdev => (1)@usaa (2)com (3)ent (4)appdev 
        sf_org=$(echo $USERNAME_ENDING | cut -d'.' -f 3)_$(echo $USERNAME_ENDING | cut -d'.' -f 4)
    fi

    case "$sf_org" in
        ent_appdev)
            echo "ent_appdev"
            echo ""
            SF_ENVIRONMENT="adsf"
            CLIENT_ID="adsf"
            CLIENT_SECRET="adsf"
            ;;
        ent_test*) # wildcard for the org name
            echo "ent_appdev"
            echo ""
            SF_ENVIRONMENT="adsf"
            CLIENT_ID="adsf"
            CLIENT_SECRET="adsf"
            ;;
        *)
            log "--- NO ORG DETAILS FOUND ---"
            exit 9999
            ;;;
    esac

    echo "sf_org : $sf_org"

}   

execute_change() {
    get_credentials

    log "*** Changing"

    json=$(curl -s -S https://$SF_ENVIRONMENT.salesforce.com/services/oauth2/token -d "grant_type=password" -d "client_id=$CLIENT_ID" -d "client_secret=$CLIENT_SECRET" -d "username=$RECON_USER" -d "password=$RECON_PASS" -H "X-PrettyPrint:1") \
    && access_token1=$(echo $json | sed "s/{.*\"access_token\" : \"\([^\"]*\).*}/\1/g") \
    && echo "**"

    json=$(curl -s -S https://$SF_ENVIRONMENT.salesforce.com/services/oauth2/token -d "grant_type=password" -d "client_id=$CLIENT_ID" -d "client_secret=$CLIENT_SECRET" -d "username=$RECON_USER" -d "password=$RECON_PASS" -H "X-PrettyPrint:1") \
    && instance_url=$(echo $json | sed "s/{.*\"instance_url\" : \"\([^\"]*\).*}/\1/g") \
    && echo "*"

    apex_response1=$(curl -s -S -d "{\"username\" : \"$TGT_USER\", \"password\" : \"$TGT_NEW_PASS\"}" -H "Content-Type: application/json" -H "Authorization: Bearer $access_token1" -X POST $instance_url/services/apexrest/CodeName/MethodName)
    log "response: $apex_response1"
    log "access_token1: ${access_token1:0:15}" # shows just a snippet

    if [[ $access_token1 != *"error"* ]]; then
        exit 0
    else
        exit 9999
    fi
    
}