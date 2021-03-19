# CleanMediaDirectories

I often see directories which were left over when deleting from Emby or Jellyfin. The video files where removed but leftover artwork, subtitles, season folders, etc... persist and continue to show on the Kodi app as empty shows. This will remove those directories based on the size of the remaining folder.

1. MediaPaths - Set your media paths. (This can contain wildcards to include for to include all season folders of all tv series.)
Tip - Put the season folder path above the TV Series path.

2. MinDirSizeRaw - Set the minimum size in MB (default 69MB) to keep a directory. (Too small and direcoties with large image files will not be deleted. Too big and direcotries with small video/media files will be deleted.)

3. Add a crontask and enjoy not thinking about this again.

Crontab Example (run script every Monday @1330hrs [aka 1:30pm]):
30 13 * * 1 /opt/CleanMediaLibrary/CleanMediaDirectories.sh #> /var/log/CleanMediaDirectories.log 2>&1#

If you would like to show support, please use the button below.

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/donate?hosted_button_id=4CFFHMJV3H4M2)
