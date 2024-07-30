## Updating a DDH from "Yellow Boat" version to "Green Boat" version

We created a tool that:
- it backs up any old "Yellow boat" version (step 2).
- it gets the code for the new "Green Boat" version (step 3).

You only need to do this the first time you update a ``yellow boat`` version.

#### Step 1 
Get the ``b_y.sh`` tool. In your DDH terminal, paste the following:
```console
curl https://raw.githubusercontent.com/LowellInstruments/pub/main/y2g/b_y.sh > /tmp/b_y.sh
```

#### Step 2
Run the tool by doing:
```console  
chmod +x /tmp/b_y.sh && /tmp/b_y.sh
```

#### Step 3
Install the green boat version. First we get the latest installer:
```console
rm -rf /home/pi/li/ddt; cd /home/pi/li 
```
```console
git clone https://github.com/lowellinstruments/ddt.git -b toml
```
Then we install the DDH. The first time ever, the following can take up to 20 minutes.
```console
cd /home/pi/li/ddt && ./dt_install_all.sh
```
Let's copy any existing logger files to the new installation:
```console
mkdir -p /home/pi/li/ddh/dl_files;
cp -r /home/pi/li/ddh_yellow/dl_files/*-* /home/pi/li/ddh/dl_files/
```

#### Step 4
Populate your new file ``/home/pi/li/ddh/settings/all_macs.toml``.
You can use your old file ``li_all_macs.yaml`` for this.
The new format is very easy, just mind the quotes.
      
"11:22:33:44:55:66" = "1234567"
```console
nano /home/pi/li/ddh/settings/all_macs.toml
```

#### Step 5
Complete the [credentials] section on your DDH settings file by doing:
```console
nano /home/pi/li/ddh/settings/config.toml
```

#### Step 6
Reboot the DDH.

#### Step 7
Run DDC by clicking its desktop icon.
- Set USB GPS puck option (2), if needed.
- Check for issues (i) and correct any.
- Optional: set test mode (7) so AWS uploads are prepended the label "testfile_".

#### Step 8
Run DDH by clicking its desktop icon.
- Open Setup tab (long click on boat icon in the upper left).
- Check assigned loggers, vessel name, forget time etc.
- Save.

#### Step 9
Open Advanced Tab (long click on version number in the lower right).
- Choose if you want to show/don't show bottom temperature maps.

#### Step 10
Run again DDC by clicking its icon on the desktop:
- Set crontab (option 3).
- Wait for DDH to run, and verify operation.
