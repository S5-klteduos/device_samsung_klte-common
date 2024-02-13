# Audio
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true

# Properties
TARGET_SYSTEM_PROP += $(COMMON_PATH)/radio/dual/system.prop

# Radio/RIL
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/radio/dual/manifest.xml
