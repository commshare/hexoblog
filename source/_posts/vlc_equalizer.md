title: VLC的均衡器
---
# VLC的均衡器
    
> 在libvlc的MediaPlayer.java中

    public static class Equalizer {
        @SuppressWarnings("unused") /* Used from JNI */
        private long mInstance;

        private Equalizer() {
            nativeNew();
        }

        private Equalizer(int index) {
            nativeNewFromPreset(index);
        }

        @Override
        protected void finalize() throws Throwable {
            try {
                nativeRelease();
            } finally {
                super.finalize();
            }
        }

        /**
         * Create a new default equalizer, with all frequency values zeroed.
         * The new equalizer can subsequently be applied to a media player by invoking
         * {@link MediaPlayer#setEqualizer}.
         */
        public static Equalizer create() {
            return new Equalizer();
        }

        /**
         * Create a new equalizer, with initial frequency values copied from an existing
         * preset.
         * The new equalizer can subsequently be applied to a media player by invoking
         * {@link MediaPlayer#setEqualizer}.
         */
        public static Equalizer createFromPreset(int index) {
            return new Equalizer(index);
        }

        /**
         * Get the number of equalizer presets.
         */
        public static int getPresetCount() {
            return nativeGetPresetCount();
        }

        /**
         * Get the name of a particular equalizer preset.
         * This name can be used, for example, to prepare a preset label or menu in a user
         * interface.
         *
         * @param  index index of the preset, counting from zero.
         * @return preset name, or NULL if there is no such preset
         */

        public static String getPresetName(int index) {
            return nativeGetPresetName(index);
        }

        /**
         * Get the number of distinct frequency bands for an equalizer.
         */
        public static int getBandCount() {
            return nativeGetBandCount();
        }

        /**
         * Get a particular equalizer band frequency.
         * This value can be used, for example, to create a label for an equalizer band control
         * in a user interface.
         *
         * @param index index of the band, counting from zero.
         * @return equalizer band frequency (Hz), or -1 if there is no such band
         */
        public static float getBandFrequency(int index) {
            return nativeGetBandFrequency(index);
        }

        /**
         * Get the current pre-amplification value from an equalizer.
         *
         * @return preamp value (Hz)
         */
        public float getPreAmp() {
            return nativeGetPreAmp();
        }

        /**
         * Set a new pre-amplification value for an equalizer.
         * The new equalizer settings are subsequently applied to a media player by invoking
         * {@link MediaPlayer#setEqualizer}.
         * The supplied amplification value will be clamped to the -20.0 to +20.0 range.
         *
         * @param preamp value (-20.0 to 20.0 Hz)
         * @return true on success.
         */
        public boolean setPreAmp(float preamp) {
            return nativeSetPreAmp(preamp);
        }

        /**
         * Get the amplification value for a particular equalizer frequency band.
         *
         * @param index counting from zero, of the frequency band to get.
         * @return amplification value (Hz); NaN if there is no such frequency band.
         */
        public float getAmp(int index) {
            return nativeGetAmp(index);
        }

        /**
         * Set a new amplification value for a particular equalizer frequency band.
         * The new equalizer settings are subsequently applied to a media player by invoking
         * {@link MediaPlayer#setEqualizer}.
         * The supplied amplification value will be clamped to the -20.0 to +20.0 range.
         *
         * @param index counting from zero, of the frequency band to set.
         * @param amp amplification value (-20.0 to 20.0 Hz).
         * \return true on success.
         */
        public boolean setAmp(int index, float amp) {
            return nativeSetAmp(index, amp);
        }

        private static native int nativeGetPresetCount();/*预设的均衡器的数目*/
        private static native String nativeGetPresetName(int index);/*预设的均衡器的名字*/
        private static native int nativeGetBandCount();
        private static native float nativeGetBandFrequency(int index);
        private native void nativeNew();
        private native void nativeNewFromPreset(int index);
        private native void nativeRelease();
        private native float nativeGetPreAmp();
        private native boolean nativeSetPreAmp(float preamp);
        private native float nativeGetAmp(int index);
        private native boolean nativeSetAmp(int index, float amp);
    }

##1 均衡器在libvlc的jni实现代码，调用的是libvlc的接口啊
>libvlc/jni/libvlcjni-mediaplayer.c


```

jboolean
Java_org_videolan_libvlc_MediaPlayer_nativeSetEqualizer(JNIEnv *env,
                                                        jobject thiz,
                                                        jobject jequalizer)
{
    vlcjni_object *p_obj = VLCJniObject_getInstance(env, thiz);
    libvlc_equalizer_t *p_eq = NULL;

    if (!p_obj)
       return false;

    if (jequalizer)
    {
        p_eq = Equalizer_getInstance(env, jequalizer);
        if (!p_eq)
            return false;
    }

    return libvlc_media_player_set_equalizer(p_obj->u.p_mp, p_eq) == 0 ? true: false;
}

jint
Java_org_videolan_libvlc_MediaPlayer_00024Equalizer_nativeGetPresetCount(JNIEnv *env,
                                                                         jobject thiz)
{
    return libvlc_audio_equalizer_get_preset_count();
}

jstring
Java_org_videolan_libvlc_MediaPlayer_00024Equalizer_nativeGetPresetName(JNIEnv *env,
                                                                        jobject thiz,
                                                                        jint index)
{
    const char *psz_name;

    if (index < 0)
    {
        throw_IllegalArgumentException(env, "index invalid");
        return NULL;
    }

    psz_name = libvlc_audio_equalizer_get_preset_name(index);

    return psz_name ? (*env)->NewStringUTF(env, psz_name) : NULL;

}

jint
Java_org_videolan_libvlc_MediaPlayer_00024Equalizer_nativeGetBandCount(JNIEnv *env,
                                                                       jobject thiz)
{
    return libvlc_audio_equalizer_get_band_count();
}

jfloat
Java_org_videolan_libvlc_MediaPlayer_00024Equalizer_nativeGetBandFrequency(JNIEnv *env,
                                                                           jobject thiz,
                                                                           jint index)
{
    if (index < 0)
    {
        throw_IllegalArgumentException(env, "index invalid");
        return 0.0;
    }

    return libvlc_audio_equalizer_get_band_frequency(index);
}

void
Java_org_videolan_libvlc_MediaPlayer_00024Equalizer_nativeNew(JNIEnv *env,
                                                              jobject thiz)
{
    libvlc_equalizer_t *p_eq = libvlc_audio_equalizer_new();
    if (!p_eq)
        throw_IllegalStateException(env, "can't create Equalizer instance");

    VLCJniObject_setInstance(env, thiz, p_eq);
}

void
Java_org_videolan_libvlc_MediaPlayer_00024Equalizer_nativeNewFromPreset(JNIEnv *env,
                                                                        jobject thiz,
                                                                        jint index)
{
    libvlc_equalizer_t *p_eq = libvlc_audio_equalizer_new_from_preset(index);
    if (!p_eq)
        throw_IllegalStateException(env, "can't create Equalizer instance");

    VLCJniObject_setInstance(env, thiz, p_eq);
}

void
Java_org_videolan_libvlc_MediaPlayer_00024Equalizer_nativeRelease(JNIEnv *env,
                                                                  jobject thiz)
{
    libvlc_equalizer_t *p_eq = Equalizer_getInstance(env, thiz);
    if (!p_eq)
        return;

    libvlc_audio_equalizer_release(p_eq);
    VLCJniObject_setInstance(env, thiz, NULL);
}

jfloat
Java_org_videolan_libvlc_MediaPlayer_00024Equalizer_nativeGetPreAmp(JNIEnv *env,
                                                                    jobject thiz)
{
    libvlc_equalizer_t *p_eq = Equalizer_getInstance(env, thiz);
    if (!p_eq)
        return 0.0;

    return libvlc_audio_equalizer_get_preamp(p_eq);
}

jboolean
Java_org_videolan_libvlc_MediaPlayer_00024Equalizer_nativeSetPreAmp(JNIEnv *env,
                                                                    jobject thiz,
                                                                    jfloat preamp)
{
    libvlc_equalizer_t *p_eq = Equalizer_getInstance(env, thiz);
    if (!p_eq)
        return false;

    return libvlc_audio_equalizer_set_preamp(p_eq, preamp) == 0 ? true : false;
}

jfloat
Java_org_videolan_libvlc_MediaPlayer_00024Equalizer_nativeGetAmp(JNIEnv *env,
                                                                 jobject thiz,
                                                                 jint index)
{
    libvlc_equalizer_t *p_eq = Equalizer_getInstance(env, thiz);
    if (!p_eq)
        return 0.0;

    return libvlc_audio_equalizer_get_amp_at_index(p_eq, index);
}

jboolean
Java_org_videolan_libvlc_MediaPlayer_00024Equalizer_nativeSetAmp(JNIEnv *env,
                                                                 jobject thiz,
                                                                 jint index,
                                                                 jfloat amp)
{
    libvlc_equalizer_t *p_eq = Equalizer_getInstance(env, thiz);
    if (!p_eq)
        return false;

    return libvlc_audio_equalizer_set_amp_at_index(p_eq, amp, index) == 0 ? true : false;
}
```
## 2. libvlc的实现在vlc/lib/Audio.c
### 2.1 均衡器
> 总感觉这些预设就是amp的值的设定
```
/**
 * Internal equalizer structure.
 */
struct libvlc_equalizer_t
{
    float f_preamp;/*preamp是（无线电）前置放大器*/
    float f_amp[EQZ_BANDS_MAX];
};
```
### 2.2 通过重新绑定均衡器到MediaPlayer使得效果生效
> 
```
    private class BandListener implements OnEqualizerBarChangeListener {
        private int index;

        public BandListener(int index) {
            this.index = index;
        }

        @Override
        public void onProgressChanged(float value) {
            /*改变均衡器的amp*/
            mEqualizer.setAmp(index, value);
            if (button.isChecked() && mService != null)
                /*重新设定局衡器绑定mediaplayer*/
                mService.setEqualizer(mEqualizer);
        }
    }
```
> 实际调用的是MediaPlayer的setEqualizer方法
```
    /**
     * Apply new equalizer settings to a media player.
     *
     * The equalizer is first created by invoking {@link Equalizer#create()} or
     * {@link Equalizer#createFromPreset(int)}}.
     *
     * It is possible to apply new equalizer settings to a media player whether the media
     * player is currently playing media or not.
     *
     * Invoking this method will immediately apply the new equalizer settings to the audio
     * output of the currently playing media if there is any.
     *
     * If there is no currently playing media, the new equalizer settings will be applied
     * later if and when new media is played.
     *
     * Equalizer settings will automatically be applied to subsequently played media.
     *
     * To disable the equalizer for a media player invoke this method passing null.
     *
     * @return true on success.
     */
    public boolean setEqualizer(Equalizer equalizer) {
        return nativeSetEqualizer(equalizer);
    }
```

> vlc/lib/media_player.c,这个非常关键啊

```

/**
 * Maximum size of a formatted equalizer amplification band frequency value.
 *
 * The allowed value range is supposed to be constrained from -20.0 to 20.0.
 *
 * The format string " %.07f" with a minimum value of "-20" gives a maximum
 * string length of e.g. " -19.1234567", i.e. 12 bytes (not including the null
 * terminator).
 */
#define EQZ_BAND_VALUE_SIZE 12

int libvlc_media_player_set_equalizer( libvlc_media_player_t *p_mi, libvlc_equalizer_t *p_equalizer )
{
    char bands[EQZ_BANDS_MAX * EQZ_BAND_VALUE_SIZE + 1];

    if( p_equalizer != NULL )
    {
        for( unsigned i = 0, c = 0; i < EQZ_BANDS_MAX; i++ )
        {
            c += snprintf( bands + c, sizeof(bands) - c, " %.07f",
                          p_equalizer->f_amp[i] );
            if( unlikely(c >= sizeof(bands)) )
                return -1;
        }

        var_SetFloat( p_mi, "equalizer-preamp", p_equalizer->f_preamp );
        var_SetString( p_mi, "equalizer-bands", bands );
    }
    var_SetString( p_mi, "audio-filter", p_equalizer ? "equalizer" : "" );

    audio_output_t *p_aout = input_resource_HoldAout( p_mi->input.p_resource );
    if( p_aout != NULL )
    {
        if( p_equalizer != NULL )
        {
            var_SetFloat( p_aout, "equalizer-preamp", p_equalizer->f_preamp );
            var_SetString( p_aout, "equalizer-bands", bands );
        }

        var_SetString( p_aout, "audio-filter", p_equalizer ? "equalizer" : "" );
        vlc_object_release( p_aout );
    }

    return 0;
```