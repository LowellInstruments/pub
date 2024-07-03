Updating DDH "Yellow Boat" version to "Green Boat" version
----------------------------------------------------------

We created a tool that:
    - it backs up any old "Yellow boat" version (step 2).
    - it gets the code for the new "Green Boat" version (step 3).
You only need to do this the first time you update a boat.
Lowell Instruments staff can obviously support you through this procedure.
Feedback on this procedure is welcome.

    Step 1: Put the tool b_y.sh in your DDH manually, via SCP or via DWService.
        Get it by doing:
        $ wget https://raw.githubusercontent.com/LowellInstruments/pub/main/y2g/b_y.sh

    Step 2: On a DDH command terminal, move the tool to /tmp by doing:
        $ mv b_y.sh /tmp

    Step 3: Run the tool by doing:
        $ chmod +x /tmp/b_y.sh && /tmp/b_y.sh

    Step 4: Install the green boat version by doing:
        $ cd /home/pi/li/ddt && ./dt_install_all.sh
        (this could take ~20 minutes depending on prior installations)

    Step 5: Convert all_macs.yaml to all_macs.toml.
        The format is very easy, just mind the quotes.
        "11:22:33:44:55:66" = "1234567"
        $ nano /home/pi/li/ddh/settings/all_macs.toml

    Step 6: Complete the [credentials] section on your DDH settings file.
        $ nano /home/pi/li/ddh/settings/config.toml

    Step 7: Reboot the DDH

    Step 8: Run DDC by doing:
        $ su pi
        $ ddc
        Set USB GPS puck option (2) if needed.
        Check for issues (i) and correct any.
        Optional: set test mode (7) so AWS uploads are prepended the label "testfile_".

    Step 9: Run DDH from desktop icons.
        Open Setup tab (long click on boat icon in the upper left).
        Check assigned loggers, vessel name, forget time etc.
        Save.

    Step 10: Open Advanced Tab (long click on version number in the lower right).
        Show/don't show bottom temperature maps.

    Step 11: Run DDC by doing:
        $ ddc
        Set the crontab (option 3)

    Step 12: Wait for DDH to run, and verify operation.
