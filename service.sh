#!/system/bin/sh

MODDIR=${0%/*}
LOG=/data/local/tmp/ksu_boot_cmd.log
echo "[$(date '+%Y-%m-%d %H:%M:%S')] service.sh starting (module=${MODDIR##*/})" >> "$LOG"
# until [ "$(getprop sys.boot_completed)" = "1" ]; do sleep 1; done

# ===========================================================================

echo "boot OK" >> "$LOG"
setprop hal.audio.primary.hdmi $(getprop ro.boot.hdmi_audio)

# ===========================================================================
echo "[$(date '+%Y-%m-%d %H:%M:%S')] service.sh ended" >> "$LOG"
