Updating DDH "Yellow Boat" version to "Green Boat" version
----------------------------------------------------------

We created a tool that:
    - it backs up any old "Yellow boat" version (step 2).
    - it gets the code for the new "Green Boat" version (step 3).
You only need to do this the first time you update a "yellow boat" version.
Any feedback on this procedure is welcome.

    Step 1: Put the tool b_y.sh in your DDH manually, via SCP or via DWService.
        You can get it by doing on a DDH terminal:
        $ curl https://raw.githubusercontent.com/LowellInstruments/pub/main/y2g/b_y.sh > /tmp/b_y.sh

    Step 2: Run the tool by doing:
        $ chmod +x /tmp/b_y.sh && /tmp/b_y.sh

    Step 3: Install the green boat version by doing:
        $ rm -rf /home/pi/li/ddt; cd /home/pi/li 
        $ git clone https://github.com/lowellinstruments/ddt.git -b toml
        $ cd /home/pi/li/ddt && ./dt_install_all.sh
        (this could take ~20 minutes depending on prior installations)

    Step 4: Populate your new file to /home/pi/li/ddh/settings/all_macs.toml.
        You can use your old file li_all_macs.yaml for this.
        The format is very easy, just mind the quotes.
        "11:22:33:44:55:66" = "1234567"
        $ nano /home/pi/li/ddh/settings/all_macs.toml

    Step 5: Complete the [credentials] section on your DDH settings file by doing:
        $ nano /home/pi/li/ddh/settings/config.toml

    Step 6: Reboot the DDH.

    Step 7: Run DDC by clicking its icon on the desktop:
        Don't run ddc from command line, it could run the previous version.
        Set USB GPS puck option (2), if needed.
        Check for issues (i) and correct any.
        Optional: set test mode (7) so AWS uploads are prepended the label "testfile_".

    Step 8: Run DDH by clicking its icon on the desktop:
        Open Setup tab (long click on boat icon in the upper left).
        Check assigned loggers, vessel name, forget time etc.
        Save.

    Step 9: Open Advanced Tab (long click on version number in the lower right).
        Choose if you want to show/don't show bottom temperature maps.

    Step 10: Run again DDC by clicking its icon on the desktop:
        Set the crontab (option 3).
        Wait for DDH to run, and verify operation.
