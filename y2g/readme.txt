Updating DDH "Yellow Boat" version to "Green Boat" version
----------------------------------------------------------

We created a tool that:
    - it backs up any old "Yellow boat" version (step 2).
    - it gets the code for the new "Green Boat" version (step 3).
You only need to do this the first time you update a boat.
Lowell Instruments staff can obviously support you through this procedure.
Feedback on this procedure is welcome.

    Step 0: Put the tool b_y.sh in your DDH manually, via SCP or via DWService.
        Get it by doing:
        $ wget https://raw.githubusercontent.com/LowellInstruments/pub/main/y2g/b_y.sh

    Step 1: On a DDH command terminal, move the tool to /tmp by doing:
        $ mv b_y.sh /tmp

    Step 2: Run the tool by doing:
        $ chmod +x /tmp/b_y.sh && /tmp/b_y.sh

    Step 3: Install the green boat version by doing:
        $ cd /home/pi/li/ddt && ./dt_install_all.sh

    Step 4: Convert all_macs.yaml to all_macs.toml.
        The format is very easy, just mind the quotes.
        "11:22:33:44:55:66" = "1234567"
        $ nano /home/pi/li/ddh/settings/all_macs.toml

    Step 5: Complete the [credentials] section on your DDH settings file.
        $ nano /home/pi/li/ddh/settings/config.toml

    Step 6: Run DDC by doing:
        $ ddc
        Set USB GPS puck option (2) if needed.
        Check for issues (i) and correct any.
        Optional: set test mode (7) so AWS uploads are prepended the label "testfile_".

    Step 7: Run DDH from desktop icons.
        Open Setup tab (long click on boat icon in the upper left).
        Check assigned loggers, vessel name, forget time etc.
        Save.

    Step 8: Open Advanced Tab (long click on version number in the lower right).
        Show/don't show bottom temperature maps.

    Step 9: Run DDC by doing:
        $ ddc

    Step 10: Wait for DDH to run, and verify operation.
