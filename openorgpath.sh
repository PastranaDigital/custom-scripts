# Execute by running: bash openorgpath.sh
# https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_force_org.htm#cli_reference_force_org_open
echo "*** Opening Orgs..."
sfdx force:config:set defaultusername=PastranaDigital    # Specific name of Authorized Org
sfdx force:org:open -p lightning/setup/SetupOneHome/home # Destination URL

# switched the Terminal shell to bash
# https://stackoverflow.com/questions/42606837/how-do-i-use-bash-on-windows-from-the-visual-studio-code-integrated-terminal
