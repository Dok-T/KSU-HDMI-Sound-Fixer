# HDMI Audio Fix for LineageOS TV (Android x86 14)

This KernelSU module automatically enables HDMI audio on boot by reading a GRUB boot parameter and setting the required Android system property.

It was created for **LineageOS TV (Android 14 x86)** and should also be compatible with **BlissOS 17** (Android x86 14), although it has only been tested on LineageOS TV.

## Requirements

- KernelSU
- LineageOS TV (Android x86 14)
- GRUB bootloader

## Installation

1. Install the module using the KernelSU app.
2. Edit your GRUB configuration file:

   ```
   /boot/grub/grub.cfg
   ```

3. Locate your LineageOS boot entry and append the following kernel parameters to the `linux` line:

   ```text
   androidboot.audio_hdmi=1 syscall_hardening=off
   ```

   Example:

   ```text
   linux /kernel root=/dev/ram0 quiet SRC=/LineageOS DATA= androidboot.audio_hdmi=1 syscall_hardening=off
   ```

4. Save the file and reboot.

## How it works

Android automatically exposes the GRUB boot parameter:

```text
androidboot.audio_hdmi=1
```

as the read-only system property:

```text
ro.boot.audio_hdmi=1
```

During boot, the module reads this property and sets:

```text
hal.audio.primary.hdmi=1
```

This enables HDMI audio automatically, removing the need to manually run:

```sh
setprop hal.audio.primary.hdmi 1
```

after every reboot.

## Notes

- `syscall_hardening=off` is required on some Android x86 / BlissOS / LineageOS builds for KernelSU to function correctly.
- This module does **not** modify the system partition.
- The module can be safely removed at any time through the KernelSU app.

## Compatibility

| OS | Status |
|----|--------|
| LineageOS TV (Android 14 x86) | ✅ Tested |
| BlissOS 17 (Android x86 14) | ✅ Expected to work |

Other Android x86 14-based distributions may also work.

## License

MIT
