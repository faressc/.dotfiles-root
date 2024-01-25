# AmdGPU on MacBook Pro 2019 16 inch

For xrandr or shutdown to work properly following must be respected:

https://wiki.archlinux.org/title/AMDGPU#Screen_artifacts_and_frequency_problem

## 6.2 Screen artifacts and frequency problem

Dynamic power management may cause screen artifacts to appear when displaying to monitors at higher frequencies (anything above 60Hz) due to issues in the way GPU clock speeds are managed[1][2].

A workaround [3] is saving high or low in /sys/class/drm/card0/device/power_dpm_force_performance_level.

To make it persistent, you may create a udev rule:

```bash
/etc/udev/rules.d/30-amdgpu-pm.rules

KERNEL=="card0", SUBSYSTEM=="drm", DRIVERS=="amdgpu", ATTR{device/power_dpm_force_performance_level}="low"
```

## Different approach

To make this change only once, you can run the following command:

```bash
echo low | sudo tee /sys/bus/pci/drivers/amdgpu/0000:??:??.?/power_dpm_force_performance_level
```
