# mySettings
This repo is basically a script that installs all the packages I need in order to run my Arch desktop
Instead of working as traditional dotfiles backups where you symlink the contents of your repo to your
home folder, instead I have my dotfiles separated from the repo, this folder mySettings then has all my
config files and scripts and then I symlink from that folder to `~/` and `~/.config` to achieve this I
have built 2 scripts `backup.sh` and `install.sh` as the naming sugests one backups the config files
from `~/.mySettings` to `~/Documents/Github/mySettings` and the other one installs all the packages 
I need to run my i3 desktop, I'm still not shure if all the depedencies I need for a bare-metal install
are in the install script, as I've only tested it in VM's, it is able to set up my desktop enviroment to the point where I only need to apply wallpapers. I haven't tested if the audio, networking and bluetooth are working on bare-metal as well. 

The install script also installs yay as an AUR helper, and sets up `auto-cpufreq, intel-undervolt and tlp` as in my pc is actually a laptop and it helps with increasing battery life, my a little, but it helps.

Finally I just wanted to point out that this script was built to work after running `archinstall` when installing Arch linux.
In my testing I ran the base install with the root user disabled and a non-encrypted ext4 partition, and when prompt for what desktop enviroment you want to install you just select the option that installs just the base XORG packages, after a reboot you can run the following commands to install my configs in your system:
```
git clone https://github.com/Filz0r/mySettings
cd mySettings
./install.sh
```
After the script runs you will need to reboot your system and you will be greeted by the lightdm
greeter, after this you're done.


Sources from some of the settings and config files:
- https://www.youtube.com/watch?v=B1iRxoyT4EA (auto-cpufreq)
- https://github.com/BrodieRobertson (some polybar configs and audio setup)
