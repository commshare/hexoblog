title: ijkplayer编译过程
---


```
[zhangbin@c7 ~]$ sudo su
[sudo] password for zhangbin: 
[root@c7 zhangbin]# ls
android  gui  nuf  xlive  公共  模板  视频  图片  文档  下载  音乐  桌面
[root@c7 zhangbin]# cd xlive
[root@c7 xlive]# ls
arm-hisiv200-linux  ffmpegpush33.sh      sc_rootfs_uclibc_256k.jffs2  web
depff.sh            Hi3531_SDK_V1.0.C.0  setv100.sh                   YUVPlayer
easycam             hisi-linux-nptl      setv200.sh
encRecord           openssl              srshome
ffmpeg              rtmppush             vlc
[root@c7 xlive]# cd ../nuf
[root@c7 nuf]# ls
245home              codec               net       omx          sunxi_kernel
acoral.disk.tar.gz   dlna                net-snmp  sc           test
acoral_linux.tar.gz  glib-2.46.1.tar.xz  nfshome   setTools.sh
audio                go                  nuhome    startnfs.sh
binder               mali                nusmart   sunxi
[root@c7 nuf]# cd sc
[root@c7 sc]# ls
expriment_linux_kernel  setNDKv5.sh  sparrow   testscbsp
s3cplayer               sl           testhttp
[root@c7 sc]# cd sparrow/
[root@c7 sparrow]# ls
dep  docs  README.md  ref  SI  src  test
[root@c7 sparrow]# cd ref
[root@c7 ref]# ls
AMP             dtplayer_c    FFmpeg-Android     ogre-ffmpeg-videoplayer
android_FFMPEG  dttv-android  FFmpegMediaPlayer  Spartacus
[root@c7 ref]# cd ..
[root@c7 sparrow]# ls
dep  docs  README.md  ref  SI  src  test
[root@c7 sparrow]# cd ..
[root@c7 sc]# ls
expriment_linux_kernel  setNDKv5.sh  sparrow   testscbsp
s3cplayer               sl           testhttp
[root@c7 sc]# cd ..
[root@c7 nuf]# ls
245home              codec               net       omx          sunxi_kernel
acoral.disk.tar.gz   dlna                net-snmp  sc           test
acoral_linux.tar.gz  glib-2.46.1.tar.xz  nfshome   setTools.sh
audio                go                  nuhome    startnfs.sh
binder               mali                nusmart   sunxi
[root@c7 nuf]# cd sc
[root@c7 sc]# ls
expriment_linux_kernel  setNDKv5.sh  sparrow   testscbsp
s3cplayer               sl           testhttp
[root@c7 sc]# cd sl
[root@c7 sl]# ls
meSCOpenSL  sczb.tar.gz                 shariplay-android-20150225.rar
scaudio     shariplay-android-20150225  zbALACDecoder
[root@c7 sl]# cd meSCOpenSL/
[root@c7 meSCOpenSL]# ls
docs  Readme.md  README.md  ref  ylOpenSL-JNI
[root@c7 meSCOpenSL]# cd ref
[root@c7 ref]# ls
ASPlayer           opensl-jni          Singleton5.cpp     testSingleton.cpp~
ijkplayer-android  opensl-jni-eclipse  testSingleton
music_player       plog                testSingleton.cpp
[root@c7 ref]# cd ijkplayer-android/
[root@c7 ijkplayer-android]# ls
android               ijkprof                  ios
config                init-android-exo.sh      MODULE_LICENSE_APACHE2
COPYING.GPLv2         init-android-libyuv.sh   NEWS.md
COPYING.GPLv3         init-android-openssl.sh  NOTICE
COPYING.LGPLv2.1      init-android-prof.sh     README.md
COPYING.LGPLv2.1.txt  init-android.sh          tools
COPYING.LGPLv3        init-config.sh           version.sh
extra                 init-ios-openssl.sh
ijkmedia              init-ios.sh
[root@c7 ijkplayer-android]# git pull origin master
remote: Counting objects: 372, done.
remote: Total 372 (delta 206), reused 206 (delta 206), pack-reused 166
接收对象中: 100% (372/372), 151.09 KiB | 90.00 KiB/s, done.
处理 delta 中: 100% (232/232), 完成 96 个本地对象.
来自 https://github.com/Bilibili/ijkplayer
 * branch            master     -> FETCH_HEAD
更新 151f29e..6cb2c05
Fast-forward
 NEWS.md                                            |    6 +
 android/compile-ijk.sh                             |   11 +-
 android/contrib/compile-ffmpeg.sh                  |    6 +-
 android/contrib/tools/do-compile-ffmpeg.sh         |   62 +-
 android/contrib/tools/do-compile-openssl.sh        |    6 +-
 android/ijk-addr2line.sh                           |    3 +
 .../ijkplayer-armv7a/src/main/jni/Android.mk       |    8 +-
 .../danmaku/ijk/media/exo/IjkExoMediaPlayer.java   |    7 +
 .../tv/danmaku/ijk/media/player/IjkMediaMeta.java  |    3 +
 .../danmaku/ijk/media/player/IjkMediaPlayer.java   |   53 +-
 .../ijk/media/player/misc/AndroidTrackInfo.java    |    9 +
 .../danmaku/ijk/media/player/misc/ITrackInfo.java  |    2 +
 .../ijk/media/player/misc/IjkTrackInfo.java        |   14 +-
 android/ijkplayer/ijkplayer-sample/build.gradle    |    2 +
 .../media/sample/widget/media/IjkVideoView.java    |   10 +-
 .../sample/widget/media/InfoHudViewHolder.java     |   45 +-
 .../src/main/res/values/strings.xml                |    7 +-
 .../src/main/res/values/strings_pref.xml           |    3 +
 android/ijkplayer/ijkplayer-x86_64/.gitignore      |    1 +
 android/ijkplayer/ijkplayer-x86_64/build.gradle    |   39 +
 .../ijkplayer/ijkplayer-x86_64/gradle.properties   |    3 +
 .../ijkplayer/ijkplayer-x86_64/proguard-rules.pro  |   17 +
 .../example/ijkplayer_x86_64/ApplicationTest.java  |   13 +
 .../ijkplayer-x86_64/src/main/AndroidManifest.xml  |    7 +
 .../ijkplayer-x86_64/src/main/jni/Android.mk       |    1 +
 .../ijkplayer-x86_64/src/main/jni/Application.mk   |   29 +
 .../src/main/jni/ffmpeg/Android.mk                 |    6 +
 .../ijkplayer-x86_64/src/main/jni/ffmpeg/include   |    1 +
 .../ijkplayer-x86_64/src/main/jni/ijkmedia         |    1 +
 .../src/main/res/values/strings.xml                |    3 +
 .../example/ijkplayer_x86_64/ExampleUnitTest.java  |   15 +
 android/ijkplayer/settings.gradle                  |    2 +-
 compile-android-j4a.sh                             |   27 +
 config/module-lite.sh                              |    2 +-
 ijkmedia/ijkj4a/.gitignore                         |    1 +
 ijkmedia/ijkj4a/Android.mk                         |   47 +
 ijkmedia/ijkj4a/Makefile                           |   49 +
 .../ijkj4a/j4a/class/android/media/AudioTrack.c    |  415 ++++
 .../ijkj4a/j4a/class/android/media/AudioTrack.h    |   97 +
 .../j4a/class/android/media/AudioTrack.include.j4a |    1 +
 .../j4a/class/android/media/AudioTrack.loader.j4a  |    1 +
 .../ijkj4a/j4a/class/android/media/MediaCodec.c    |  637 ++++++
 .../ijkj4a/j4a/class/android/media/MediaCodec.h    |  131 ++
 .../j4a/class/android/media/MediaCodec.include.j4a |    1 +
 .../j4a/class/android/media/MediaCodec.loader.j4a  |    1 +
 .../ijkj4a/j4a/class/android/media/MediaFormat.c   |  361 ++++
 .../ijkj4a/j4a/class/android/media/MediaFormat.h   |   75 +
 .../class/android/media/MediaFormat.include.j4a    |    1 +
 .../j4a/class/android/media/MediaFormat.loader.j4a |    1 +
 .../j4a/class/android/media/PlaybackParams.c       |  101 +
 .../j4a/class/android/media/PlaybackParams.h       |   39 +
 .../class/android/media/PlaybackParams.include.j4a |    1 +
 .../class/android/media/PlaybackParams.loader.j4a  |    1 +
 ijkmedia/ijkj4a/j4a/class/android/os/Build.c       |  116 ++
 ijkmedia/ijkj4a/j4a/class/android/os/Build.h       |   33 +
 .../ijkj4a/j4a/class/android/os/Build.include.j4a  |    1 +
 .../ijkj4a/j4a/class/android/os/Build.loader.j4a   |    1 +
 ijkmedia/ijkj4a/j4a/class/android/os/Bundle.c      |  502 +++++
 ijkmedia/ijkj4a/j4a/class/android/os/Bundle.h      |   91 +
 .../ijkj4a/j4a/class/android/os/Bundle.include.j4a |    1 +
 .../ijkj4a/j4a/class/android/os/Bundle.loader.j4a  |    1 +
 ijkmedia/ijkj4a/j4a/class/java/nio/Buffer.c        |   49 +
 ijkmedia/ijkj4a/j4a/class/java/nio/Buffer.h        |   29 +
 .../ijkj4a/j4a/class/java/nio/Buffer.include.j4a   |    1 +
 .../ijkj4a/j4a/class/java/nio/Buffer.loader.j4a    |    1 +
 ijkmedia/ijkj4a/j4a/class/java/nio/ByteBuffer.c    |  179 ++
 ijkmedia/ijkj4a/j4a/class/java/nio/ByteBuffer.h    |   51 +
 .../j4a/class/java/nio/ByteBuffer.include.j4a      |    1 +
 .../j4a/class/java/nio/ByteBuffer.loader.j4a       |    1 +
 ijkmedia/ijkj4a/j4a/class/java/util/ArrayList.c    |  116 ++
 ijkmedia/ijkj4a/j4a/class/java/util/ArrayList.h    |   43 +
 .../j4a/class/java/util/ArrayList.include.j4a      |    1 +
 .../j4a/class/java/util/ArrayList.loader.j4a       |    1 +
 .../tv/danmaku/ijk/media/player/IjkMediaPlayer.c   |  355 ++++
 .../tv/danmaku/ijk/media/player/IjkMediaPlayer.h   |   77 +
 .../ijk/media/player/IjkMediaPlayer.include.j4a    |    1 +
 .../ijk/media/player/IjkMediaPlayer.loader.j4a     |    1 +
 .../ijk/media/player/misc/IMediaDataSource.c       |  115 ++
 .../ijk/media/player/misc/IMediaDataSource.h       |   45 +
 .../media/player/misc/IMediaDataSource.include.j4a |    1 +
 .../media/player/misc/IMediaDataSource.loader.j4a  |    1 +
 ijkmedia/ijkj4a/j4a/j4a_allclasses.c               |   34 +
 ijkmedia/ijkj4a/j4a/j4a_allclasses.h               |   27 +
 ijkmedia/ijkj4a/j4a/j4a_allclasses.include.h       |   11 +
 ijkmedia/ijkj4a/j4a/j4a_allclasses.loader.h        |   11 +
 .../jjk_internal.c => ijkj4a/j4a/j4a_base.c}       |  122 +-
 ijkmedia/ijkj4a/j4a/j4a_base.h                     |  103 +
 .../j4au/class/android/media/AudioTrack.util.c     |   56 +
 .../j4au/class/android/media/AudioTrack.util.h}    |   22 +-
 .../j4au/class}/java/nio/ByteBuffer.util.c         |   24 +-
 .../j4au/class}/java/nio/ByteBuffer.util.h         |   22 +-
 .../java/android/media/AudioTrack.java             |    6 +
 .../java/android/media/MediaCodec.java             |    0
 .../java/android/media/MediaCrypto.java            |    0
 .../java/android/media/MediaFormat.java            |    0
 .../ijkj4a/java/android/media/PlaybackParams.java  |    7 +
 .../jjk => ijkj4a}/java/android/os/Build.java      |    0
 .../jjk => ijkj4a}/java/android/os/Bundle.java     |    0
 .../jjk => ijkj4a}/java/java/nio/Buffer.java       |    0
 .../jjk => ijkj4a}/java/java/nio/ByteBuffer.java   |    0
 .../jjk => ijkj4a}/java/java/util/ArrayList.java   |    0
 .../danmaku/ijk/media/player/IjkMediaPlayer.java   |    0
 .../ijk/media/player/misc/IMediaDataSource.java    |    0
 ijkmedia/ijkplayer/Android.mk                      |    1 +
 ijkmedia/ijkplayer/android/ijkplayer_jni.c         |   73 +-
 .../android/pipeline/ffpipeline_android.c          |    2 +-
 .../pipeline/ffpipenode_android_mediacodec_vdec.c  |  215 +-
 ijkmedia/ijkplayer/config.h                        |    5 +-
 ijkmedia/ijkplayer/ff_ffmsg.h                      |   20 +-
 ijkmedia/ijkplayer/ff_ffplay.c                     |  184 +-
 ijkmedia/ijkplayer/ff_ffplay.h                     |    5 +-
 ijkmedia/ijkplayer/ff_ffplay_debug.h               |    2 +
 ijkmedia/ijkplayer/ff_ffplay_def.h                 |   90 +-
 ijkmedia/ijkplayer/ff_ffplay_options.h             |   30 +-
 ijkmedia/ijkplayer/ijkavformat/async.c             |   84 +-
 ijkmedia/ijkplayer/ijkavformat/ijkavformat.h       |   22 +
 ijkmedia/ijkplayer/ijkavformat/ijkinject.c         |   14 -
 .../ijkplayer/ijkavformat/ijkmediadatasource.c     |   35 +-
 ijkmedia/ijkplayer/ijkmeta.c                       |    5 +
 ijkmedia/ijkplayer/ijkmeta.h                       |    1 +
 .../ijkplayer/pipeline/ffpipenode_ffplay_vdec.c    |    1 +
 ijkmedia/ijksdl/Android.mk                         |   32 +-
 ijkmedia/ijksdl/android/android_audiotrack.c       |   64 +-
 ijkmedia/ijksdl/android/android_audiotrack.h       |    3 +-
 ijkmedia/ijksdl/android/ijksdl_android_jni.c       |    9 +-
 ijkmedia/ijksdl/android/ijksdl_android_jni.h       |    7 +-
 .../android/ijksdl_aout_android_audiotrack.c       |   26 +
 .../android/ijksdl_codec_android_mediacodec.c      |  108 +-
 .../android/ijksdl_codec_android_mediacodec.h      |   26 +-
 .../ijksdl_codec_android_mediacodec_dummy.c        |  150 ++
 ...r.h => ijksdl_codec_android_mediacodec_dummy.h} |   12 +-
 .../ijksdl_codec_android_mediacodec_internal.c     |  166 ++
 .../ijksdl_codec_android_mediacodec_internal.h     |   64 +-
 .../android/ijksdl_codec_android_mediacodec_java.c |  125 +-
 .../ijksdl/android/ijksdl_codec_android_mediadef.h |    4 +
 .../ijksdl_codec_android_mediaformat_java.c        |   30 +-
 .../android/ijksdl_vout_android_nativewindow.c     |   75 +-
 .../android/ijksdl_vout_android_nativewindow.h     |    3 +-
 .../ijksdl_vout_overlay_android_mediacodec.c       |   18 +-
 .../ijksdl_vout_overlay_android_mediacodec.h       |    2 +-
 ijkmedia/ijksdl/android/jjk/Makefile               |   31 -
 ijkmedia/ijksdl/android/jjk/build.sh               |   10 -
 .../android/jjk/c/android/media/AudioTrack.c       |  345 ----
 .../android/jjk/c/android/media/AudioTrack.h       |   55 -
 .../android/jjk/c/android/media/MediaCodec.c       |  630 ------
 .../android/jjk/c/android/media/MediaCodec.h       |   77 -
 .../android/jjk/c/android/media/MediaFormat.c      |  357 ----
 .../android/jjk/c/android/media/MediaFormat.h      |   49 -
 ijkmedia/ijksdl/android/jjk/c/android/os/Build.c   |  109 -
 ijkmedia/ijksdl/android/jjk/c/android/os/Bundle.c  |  498 -----
 ijkmedia/ijksdl/android/jjk/c/android/os/Bundle.h  |   57 -
 ijkmedia/ijksdl/android/jjk/c/java/nio/Buffer.c    |   45 -
 .../ijksdl/android/jjk/c/java/nio/ByteBuffer.c     |  175 --
 .../ijksdl/android/jjk/c/java/nio/ByteBuffer.h     |   41 -
 .../ijksdl/android/jjk/c/java/util/ArrayList.c     |  112 -
 .../c/tv/danmaku/ijk/media/player/IjkMediaPlayer.c |  351 ----
 .../c/tv/danmaku/ijk/media/player/IjkMediaPlayer.h |   50 -
 .../ijk/media/player/misc/IMediaDataSource.c       |  111 -
 .../ijk/media/player/misc/IMediaDataSource.h       |   34 -
 .../ijksdl/android/jjk/internal/jjk_allclasses.c   |   59 -
 .../ijksdl/android/jjk/internal/jjk_internal.h     |   82 -
 .../android/jjk/parser.xcodeproj/project.pbxproj   |  381 ----
 .../project.xcworkspace/contents.xcworkspacedata   |    7 -
 ijkmedia/ijksdl/android/jjk/parser/.gitignore      |    8 -
 ijkmedia/ijksdl/android/jjk/parser/Makefile        |   56 -
 .../ijksdl/android/jjk/parser/ast/ast__context.cpp |   82 -
 .../ijksdl/android/jjk/parser/ast/ast__context.hpp |   75 -
 .../ijksdl/android/jjk/parser/ast/ast__def.hpp     |   84 -
 .../ijksdl/android/jjk/parser/ast/ast__forward.hpp |   56 -
 .../android/jjk/parser/ast/ast__namespace.cpp      |   77 -
 .../android/jjk/parser/ast/ast__namespace.hpp      |   59 -
 .../android/jjk/parser/ast/ast_annotation.hpp      |   75 -
 .../ijksdl/android/jjk/parser/ast/ast_argument.hpp |   78 -
 .../android/jjk/parser/ast/ast_basic_type.hpp      |  121 --
 .../ijksdl/android/jjk/parser/ast/ast_class.cpp    |  120 --
 .../ijksdl/android/jjk/parser/ast/ast_class.hpp    |  142 --
 .../jjk/parser/ast/ast_compilation_unit.cpp        |  111 -
 .../jjk/parser/ast/ast_compilation_unit.hpp        |   92 -
 .../android/jjk/parser/ast/ast_constructor.cpp     |   66 -
 .../android/jjk/parser/ast/ast_constructor.hpp     |   61 -
 .../ijksdl/android/jjk/parser/ast/ast_field.cpp    |   72 -
 .../ijksdl/android/jjk/parser/ast/ast_field.hpp    |   63 -
 .../android/jjk/parser/ast/ast_identifier.cpp      |  110 -
 .../android/jjk/parser/ast/ast_identifier.hpp      |  306 ---
 .../ijksdl/android/jjk/parser/ast/ast_import.hpp   |   59 -
 .../ijksdl/android/jjk/parser/ast/ast_member.cpp   |  113 --
 .../ijksdl/android/jjk/parser/ast/ast_member.hpp   |  126 --
 .../ijksdl/android/jjk/parser/ast/ast_method.cpp   |  492 -----
 .../ijksdl/android/jjk/parser/ast/ast_method.hpp   |   95 -
 .../ijksdl/android/jjk/parser/ast/ast_modifier.hpp |   91 -
 .../ijksdl/android/jjk/parser/ast/ast_node.cpp     |   56 -
 .../ijksdl/android/jjk/parser/ast/ast_node.hpp     |  127 --
 .../jjk/parser/ast/ast_property_accessor.cpp       |   58 -
 .../jjk/parser/ast/ast_property_accessor.hpp       |  116 --
 .../android/jjk/parser/ast/ast_reference_type.cpp  |   79 -
 .../android/jjk/parser/ast/ast_reference_type.hpp  |   63 -
 .../ijksdl/android/jjk/parser/ast/ast_type.hpp     |   78 -
 ijkmedia/ijksdl/android/jjk/parser/bfc/bfc__def.h  |   98 -
 .../ijksdl/android/jjk/parser/bfc/bfc_object.h     |   64 -
 .../ijksdl/android/jjk/parser/bfc/bfc_string.h     |  104 -
 ijkmedia/ijksdl/android/jjk/parser/jjk.cpp         |   39 -
 .../ijksdl/android/jjk/parser/jni.bison.tab.cpp    | 2134 --------------------
 .../ijksdl/android/jjk/parser/jni.bison.tab.hpp    |  116 --
 ijkmedia/ijksdl/android/jjk/parser/jni.bison.y     |  422 ----
 ijkmedia/ijksdl/android/jjk/parser/jni.flex.l      |   75 -
 ijkmedia/ijksdl/android/jjk/parser/jni.flex.yy.cpp | 2018 ------------------
 ijkmedia/ijksdl/android/jjk/parser/parser.hpp      |   55 -
 .../ijksdl/ffmpeg/ijksdl_vout_overlay_ffmpeg.c     |   59 +-
 .../ijksdl/ffmpeg/ijksdl_vout_overlay_ffmpeg.h     |    2 +-
 .../jjk/parser/ast/ast.hpp => gles2/color.c}       |   40 +-
 ijkmedia/ijksdl/gles2/common.c                     |   62 +
 ijkmedia/ijksdl/gles2/fsh/yuv420p.fsh.c            |   47 +
 ijkmedia/ijksdl/gles2/fsh/yuv444p10le.fsh.c        |   55 +
 ijkmedia/ijksdl/gles2/internal.h                   |   52 +
 ijkmedia/ijksdl/gles2/renderer.c                   |  293 +++
 ijkmedia/ijksdl/gles2/renderer_yuv420p.c           |  118 ++
 ijkmedia/ijksdl/gles2/renderer_yuv444p10le.c       |  114 ++
 ijkmedia/ijksdl/gles2/shader.c                     |   82 +
 .../c/android/os/Build.h => gles2/vsh/mvp.vsh.c}   |   28 +-
 ijkmedia/ijksdl/ijksdl_aout.c                      |    8 +
 ijkmedia/ijksdl/ijksdl_aout.h                      |    5 +
 ijkmedia/ijksdl/ijksdl_egl.c                       |  385 ++++
 ijkmedia/ijksdl/ijksdl_egl.h                       |   65 +
 ijkmedia/ijksdl/ijksdl_fourcc.h                    |    8 +
 ijkmedia/ijksdl/ijksdl_gles2.h                     |   82 +
 ijkmedia/ijksdl/ijksdl_vout.c                      |   13 +-
 ijkmedia/ijksdl/ijksdl_vout.h                      |    9 +-
 init-android-j4a.sh                                |   33 +
 init-android.sh                                    |    5 +-
 init-ios.sh                                        |   62 +-
 .../IJKMediaDemo.xcodeproj/project.pbxproj         |   20 -
 .../IJKMediaDemo/IJKMoviePlayerViewController.h    |    4 +-
 .../IJKMediaDemo/IJKMoviePlayerViewController.m    |   23 +-
 .../IJKMediaDemo/IJKMoviePlayerViewController.xib  |   59 +-
 .../AppIcon.appiconset/Contents.json               |   13 +-
 .../IJKMediaPlayer.xcodeproj/project.pbxproj       |   34 +-
 .../IJKMediaPlayer/IJKAVMoviePlayerController.m    |   36 +-
 .../IJKMediaPlayer/IJKFFMoviePlayerController.h    |    1 +
 .../IJKMediaPlayer/IJKFFMoviePlayerController.m    |  294 ++-
 ios/IJKMediaPlayer/IJKMediaPlayer/IJKFFOptions.h   |    2 +-
 ios/IJKMediaPlayer/IJKMediaPlayer/IJKFFOptions.m   |    5 +-
 .../ijkplayer/ios/pipeline/IJKVideoToolBox.m       |    8 +-
 .../ijkplayer/ios/pipeline/ffpipeline_ios.c        |    2 +
 .../pipeline/ffpipenode_ios_videotoolbox_vdec.m    |    1 +
 .../ijksdl/ios/IJKSDLAudioQueueController.h        |    1 +
 .../ijksdl/ios/IJKSDLAudioQueueController.m        |   22 +
 .../ijkmedia/ijksdl/ios/IJKSDLGLRender.h           |   14 +
 .../ijkmedia/ijksdl/ios/IJKSDLGLRenderI420.m       |   39 +-
 .../ijkmedia/ijksdl/ios/IJKSDLGLRenderI444P10LE.h  |   17 +-
 .../ijkmedia/ijksdl/ios/IJKSDLGLRenderI444P10LE.m  |  151 ++
 .../ijkmedia/ijksdl/ios/IJKSDLGLRenderNV12.m       |   18 -
 .../ijkmedia/ijksdl/ios/IJKSDLGLView.h             |    4 +-
 .../ijkmedia/ijksdl/ios/IJKSDLGLView.m             |  144 +-
 .../ijkmedia/ijksdl/ios/IJKSDLHudViewCell.h        |   17 +
 .../ijkmedia/ijksdl/ios/IJKSDLHudViewCell.m        |   65 +
 .../ijkmedia/ijksdl/ios/IJKSDLHudViewController.h  |   17 +
 .../ijkmedia/ijksdl/ios/IJKSDLHudViewController.m  |   93 +
 .../ijksdl/ios/ijksdl_aout_ios_audiounit.m         |   10 +
 .../ijkmedia/ijksdl/ios/ijksdl_vout_ios_gles2.m    |   14 +-
 .../ijksdl/ios/ijksdl_vout_overlay_videotoolbox.h  |    2 +-
 .../ijksdl/ios/ijksdl_vout_overlay_videotoolbox.m  |    9 +-
 ios/IJKMediaPlayer/NSString+IJKMedia.h             |   15 +
 ios/IJKMediaPlayer/NSString+IJKMedia.m             |   22 +
 tools/pull-repo-ref.sh                             |    2 +-
 264 files changed, 8217 insertions(+), 13204 deletions(-)
 create mode 100644 android/ijk-addr2line.sh
 create mode 100644 android/ijkplayer/ijkplayer-x86_64/.gitignore
 create mode 100644 android/ijkplayer/ijkplayer-x86_64/build.gradle
 create mode 100644 android/ijkplayer/ijkplayer-x86_64/gradle.properties
 create mode 100644 android/ijkplayer/ijkplayer-x86_64/proguard-rules.pro
 create mode 100644 android/ijkplayer/ijkplayer-x86_64/src/androidTest/java/com/example/ijkplayer_x86_64/ApplicationTest.java
 create mode 100644 android/ijkplayer/ijkplayer-x86_64/src/main/AndroidManifest.xml
 create mode 120000 android/ijkplayer/ijkplayer-x86_64/src/main/jni/Android.mk
 create mode 100644 android/ijkplayer/ijkplayer-x86_64/src/main/jni/Application.mk
 create mode 100644 android/ijkplayer/ijkplayer-x86_64/src/main/jni/ffmpeg/Android.mk
 create mode 120000 android/ijkplayer/ijkplayer-x86_64/src/main/jni/ffmpeg/include
 create mode 120000 android/ijkplayer/ijkplayer-x86_64/src/main/jni/ijkmedia
 create mode 100644 android/ijkplayer/ijkplayer-x86_64/src/main/res/values/strings.xml
 create mode 100644 android/ijkplayer/ijkplayer-x86_64/src/test/java/com/example/ijkplayer_x86_64/ExampleUnitTest.java
 create mode 100755 compile-android-j4a.sh
 create mode 100644 ijkmedia/ijkj4a/.gitignore
 create mode 100644 ijkmedia/ijkj4a/Android.mk
 create mode 100644 ijkmedia/ijkj4a/Makefile
 create mode 100644 ijkmedia/ijkj4a/j4a/class/android/media/AudioTrack.c
 create mode 100644 ijkmedia/ijkj4a/j4a/class/android/media/AudioTrack.h
 create mode 100644 ijkmedia/ijkj4a/j4a/class/android/media/AudioTrack.include.j4a
 create mode 100644 ijkmedia/ijkj4a/j4a/class/android/media/AudioTrack.loader.j4a
 create mode 100644 ijkmedia/ijkj4a/j4a/class/android/media/MediaCodec.c
 create mode 100644 ijkmedia/ijkj4a/j4a/class/android/media/MediaCodec.h
 create mode 100644 ijkmedia/ijkj4a/j4a/class/android/media/MediaCodec.include.j4a
 create mode 100644 ijkmedia/ijkj4a/j4a/class/android/media/MediaCodec.loader.j4a
 create mode 100644 ijkmedia/ijkj4a/j4a/class/android/media/MediaFormat.c
 create mode 100644 ijkmedia/ijkj4a/j4a/class/android/media/MediaFormat.h
 create mode 100644 ijkmedia/ijkj4a/j4a/class/android/media/MediaFormat.include.j4a
 create mode 100644 ijkmedia/ijkj4a/j4a/class/android/media/MediaFormat.loader.j4a
 create mode 100644 ijkmedia/ijkj4a/j4a/class/android/media/PlaybackParams.c
 create mode 100644 ijkmedia/ijkj4a/j4a/class/android/media/PlaybackParams.h
 create mode 100644 ijkmedia/ijkj4a/j4a/class/android/media/PlaybackParams.include.j4a
 create mode 100644 ijkmedia/ijkj4a/j4a/class/android/media/PlaybackParams.loader.j4a
 create mode 100644 ijkmedia/ijkj4a/j4a/class/android/os/Build.c
 create mode 100644 ijkmedia/ijkj4a/j4a/class/android/os/Build.h
 create mode 100644 ijkmedia/ijkj4a/j4a/class/android/os/Build.include.j4a
 create mode 100644 ijkmedia/ijkj4a/j4a/class/android/os/Build.loader.j4a
 create mode 100644 ijkmedia/ijkj4a/j4a/class/android/os/Bundle.c
 create mode 100644 ijkmedia/ijkj4a/j4a/class/android/os/Bundle.h
 create mode 100644 ijkmedia/ijkj4a/j4a/class/android/os/Bundle.include.j4a
 create mode 100644 ijkmedia/ijkj4a/j4a/class/android/os/Bundle.loader.j4a
 create mode 100644 ijkmedia/ijkj4a/j4a/class/java/nio/Buffer.c
 create mode 100644 ijkmedia/ijkj4a/j4a/class/java/nio/Buffer.h
 create mode 100644 ijkmedia/ijkj4a/j4a/class/java/nio/Buffer.include.j4a
 create mode 100644 ijkmedia/ijkj4a/j4a/class/java/nio/Buffer.loader.j4a
 create mode 100644 ijkmedia/ijkj4a/j4a/class/java/nio/ByteBuffer.c
 create mode 100644 ijkmedia/ijkj4a/j4a/class/java/nio/ByteBuffer.h
 create mode 100644 ijkmedia/ijkj4a/j4a/class/java/nio/ByteBuffer.include.j4a
 create mode 100644 ijkmedia/ijkj4a/j4a/class/java/nio/ByteBuffer.loader.j4a
 create mode 100644 ijkmedia/ijkj4a/j4a/class/java/util/ArrayList.c
 create mode 100644 ijkmedia/ijkj4a/j4a/class/java/util/ArrayList.h
 create mode 100644 ijkmedia/ijkj4a/j4a/class/java/util/ArrayList.include.j4a
 create mode 100644 ijkmedia/ijkj4a/j4a/class/java/util/ArrayList.loader.j4a
 create mode 100644 ijkmedia/ijkj4a/j4a/class/tv/danmaku/ijk/media/player/IjkMediaPlayer.c
 create mode 100644 ijkmedia/ijkj4a/j4a/class/tv/danmaku/ijk/media/player/IjkMediaPlayer.h
 create mode 100644 ijkmedia/ijkj4a/j4a/class/tv/danmaku/ijk/media/player/IjkMediaPlayer.include.j4a
 create mode 100644 ijkmedia/ijkj4a/j4a/class/tv/danmaku/ijk/media/player/IjkMediaPlayer.loader.j4a
 create mode 100644 ijkmedia/ijkj4a/j4a/class/tv/danmaku/ijk/media/player/misc/IMediaDataSource.c
 create mode 100644 ijkmedia/ijkj4a/j4a/class/tv/danmaku/ijk/media/player/misc/IMediaDataSource.h
 create mode 100644 ijkmedia/ijkj4a/j4a/class/tv/danmaku/ijk/media/player/misc/IMediaDataSource.include.j4a
 create mode 100644 ijkmedia/ijkj4a/j4a/class/tv/danmaku/ijk/media/player/misc/IMediaDataSource.loader.j4a
 create mode 100644 ijkmedia/ijkj4a/j4a/j4a_allclasses.c
 create mode 100644 ijkmedia/ijkj4a/j4a/j4a_allclasses.h
 create mode 100644 ijkmedia/ijkj4a/j4a/j4a_allclasses.include.h
 create mode 100644 ijkmedia/ijkj4a/j4a/j4a_allclasses.loader.h
 rename ijkmedia/{ijksdl/android/jjk/internal/jjk_internal.c => ijkj4a/j4a/j4a_base.c} (52%)
 create mode 100644 ijkmedia/ijkj4a/j4a/j4a_base.h
 create mode 100644 ijkmedia/ijkj4a/j4au/class/android/media/AudioTrack.util.c
 rename ijkmedia/{ijksdl/android/jjk/c/java/util/ArrayList.h => ijkj4a/j4au/class/android/media/AudioTrack.util.h} (58%)
 rename ijkmedia/{ijksdl/android/jjk/c => ijkj4a/j4au/class}/java/nio/ByteBuffer.util.c (64%)
 rename ijkmedia/{ijksdl/android/jjk/c => ijkj4a/j4au/class}/java/nio/ByteBuffer.util.h (50%)
 rename ijkmedia/{ijksdl/android/jjk => ijkj4a}/java/android/media/AudioTrack.java (83%)
 rename ijkmedia/{ijksdl/android/jjk => ijkj4a}/java/android/media/MediaCodec.java (100%)
 rename ijkmedia/{ijksdl/android/jjk => ijkj4a}/java/android/media/MediaCrypto.java (100%)
 rename ijkmedia/{ijksdl/android/jjk => ijkj4a}/java/android/media/MediaFormat.java (100%)
 create mode 100644 ijkmedia/ijkj4a/java/android/media/PlaybackParams.java
 rename ijkmedia/{ijksdl/android/jjk => ijkj4a}/java/android/os/Build.java (100%)
 rename ijkmedia/{ijksdl/android/jjk => ijkj4a}/java/android/os/Bundle.java (100%)
 rename ijkmedia/{ijksdl/android/jjk => ijkj4a}/java/java/nio/Buffer.java (100%)
 rename ijkmedia/{ijksdl/android/jjk => ijkj4a}/java/java/nio/ByteBuffer.java (100%)
 rename ijkmedia/{ijksdl/android/jjk => ijkj4a}/java/java/util/ArrayList.java (100%)
 rename ijkmedia/{ijksdl/android/jjk => ijkj4a}/java/tv/danmaku/ijk/media/player/IjkMediaPlayer.java (100%)
 rename ijkmedia/{ijksdl/android/jjk => ijkj4a}/java/tv/danmaku/ijk/media/player/misc/IMediaDataSource.java (100%)
 create mode 100644 ijkmedia/ijksdl/android/ijksdl_codec_android_mediacodec_dummy.c
 rename ijkmedia/ijksdl/android/{jjk/c/java/nio/Buffer.h => ijksdl_codec_android_mediacodec_dummy.h} (73%)
 create mode 100644 ijkmedia/ijksdl/android/ijksdl_codec_android_mediacodec_internal.c
 delete mode 100644 ijkmedia/ijksdl/android/jjk/Makefile
 delete mode 100644 ijkmedia/ijksdl/android/jjk/build.sh
 delete mode 100644 ijkmedia/ijksdl/android/jjk/c/android/media/AudioTrack.c
 delete mode 100644 ijkmedia/ijksdl/android/jjk/c/android/media/AudioTrack.h
 delete mode 100644 ijkmedia/ijksdl/android/jjk/c/android/media/MediaCodec.c
 delete mode 100644 ijkmedia/ijksdl/android/jjk/c/android/media/MediaCodec.h
 delete mode 100644 ijkmedia/ijksdl/android/jjk/c/android/media/MediaFormat.c
 delete mode 100644 ijkmedia/ijksdl/android/jjk/c/android/media/MediaFormat.h
 delete mode 100644 ijkmedia/ijksdl/android/jjk/c/android/os/Build.c
 delete mode 100644 ijkmedia/ijksdl/android/jjk/c/android/os/Bundle.c
 delete mode 100644 ijkmedia/ijksdl/android/jjk/c/android/os/Bundle.h
 delete mode 100644 ijkmedia/ijksdl/android/jjk/c/java/nio/Buffer.c
 delete mode 100644 ijkmedia/ijksdl/android/jjk/c/java/nio/ByteBuffer.c
 delete mode 100644 ijkmedia/ijksdl/android/jjk/c/java/nio/ByteBuffer.h
 delete mode 100644 ijkmedia/ijksdl/android/jjk/c/java/util/ArrayList.c
 delete mode 100644 ijkmedia/ijksdl/android/jjk/c/tv/danmaku/ijk/media/player/IjkMediaPlayer.c
 delete mode 100644 ijkmedia/ijksdl/android/jjk/c/tv/danmaku/ijk/media/player/IjkMediaPlayer.h
 delete mode 100644 ijkmedia/ijksdl/android/jjk/c/tv/danmaku/ijk/media/player/misc/IMediaDataSource.c
 delete mode 100644 ijkmedia/ijksdl/android/jjk/c/tv/danmaku/ijk/media/player/misc/IMediaDataSource.h
 delete mode 100644 ijkmedia/ijksdl/android/jjk/internal/jjk_allclasses.c
 delete mode 100644 ijkmedia/ijksdl/android/jjk/internal/jjk_internal.h
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser.xcodeproj/project.pbxproj
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser.xcodeproj/project.xcworkspace/contents.xcworkspacedata
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/.gitignore
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/Makefile
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast__context.cpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast__context.hpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast__def.hpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast__forward.hpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast__namespace.cpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast__namespace.hpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_annotation.hpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_argument.hpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_basic_type.hpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_class.cpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_class.hpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_compilation_unit.cpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_compilation_unit.hpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_constructor.cpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_constructor.hpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_field.cpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_field.hpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_identifier.cpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_identifier.hpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_import.hpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_member.cpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_member.hpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_method.cpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_method.hpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_modifier.hpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_node.cpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_node.hpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_property_accessor.cpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_property_accessor.hpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_reference_type.cpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_reference_type.hpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/ast/ast_type.hpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/bfc/bfc__def.h
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/bfc/bfc_object.h
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/bfc/bfc_string.h
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/jjk.cpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/jni.bison.tab.cpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/jni.bison.tab.hpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/jni.bison.y
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/jni.flex.l
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/jni.flex.yy.cpp
 delete mode 100644 ijkmedia/ijksdl/android/jjk/parser/parser.hpp
 rename ijkmedia/ijksdl/{android/jjk/parser/ast/ast.hpp => gles2/color.c} (61%)
 create mode 100644 ijkmedia/ijksdl/gles2/common.c
 create mode 100644 ijkmedia/ijksdl/gles2/fsh/yuv420p.fsh.c
 create mode 100644 ijkmedia/ijksdl/gles2/fsh/yuv444p10le.fsh.c
 create mode 100644 ijkmedia/ijksdl/gles2/internal.h
 create mode 100644 ijkmedia/ijksdl/gles2/renderer.c
 create mode 100644 ijkmedia/ijksdl/gles2/renderer_yuv420p.c
 create mode 100644 ijkmedia/ijksdl/gles2/renderer_yuv444p10le.c
 create mode 100644 ijkmedia/ijksdl/gles2/shader.c
 rename ijkmedia/ijksdl/{android/jjk/c/android/os/Build.h => gles2/vsh/mvp.vsh.c} (58%)
 create mode 100644 ijkmedia/ijksdl/ijksdl_egl.c
 create mode 100644 ijkmedia/ijksdl/ijksdl_egl.h
 create mode 100644 ijkmedia/ijksdl/ijksdl_gles2.h
 create mode 100755 init-android-j4a.sh
 rename ijkmedia/ijksdl/android/jjk/parser/bfc/bfc.h => ios/IJKMediaPlayer/IJKMediaPlayer/ijkmedia/ijksdl/ios/IJKSDLGLRenderI444P10LE.h (74%)
 create mode 100644 ios/IJKMediaPlayer/IJKMediaPlayer/ijkmedia/ijksdl/ios/IJKSDLGLRenderI444P10LE.m
 create mode 100644 ios/IJKMediaPlayer/IJKMediaPlayer/ijkmedia/ijksdl/ios/IJKSDLHudViewCell.h
 create mode 100644 ios/IJKMediaPlayer/IJKMediaPlayer/ijkmedia/ijksdl/ios/IJKSDLHudViewCell.m
 create mode 100644 ios/IJKMediaPlayer/IJKMediaPlayer/ijkmedia/ijksdl/ios/IJKSDLHudViewController.h
 create mode 100644 ios/IJKMediaPlayer/IJKMediaPlayer/ijkmedia/ijksdl/ios/IJKSDLHudViewController.m
 create mode 100644 ios/IJKMediaPlayer/NSString+IJKMedia.h
 create mode 100644 ios/IJKMediaPlayer/NSString+IJKMedia.m
[root@c7 ijkplayer-android]# ls
android                 ijkmedia                 init-ios-openssl.sh
compile-android-j4a.sh  ijkprof                  init-ios.sh
config                  init-android-exo.sh      ios
COPYING.GPLv2           init-android-j4a.sh      MODULE_LICENSE_APACHE2
COPYING.GPLv3           init-android-libyuv.sh   NEWS.md
COPYING.LGPLv2.1        init-android-openssl.sh  NOTICE
COPYING.LGPLv2.1.txt    init-android-prof.sh     README.md
COPYING.LGPLv3          init-android.sh          tools
extra                   init-config.sh           version.sh
[root@c7 ijkplayer-android]# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
See Linuxbrew: http://brew.sh/linuxbrew/
[root@c7 ijkplayer-android]# brew install yasm
bash: brew: 未找到命令...
[root@c7 ijkplayer-android]# cd ijkplayer-android
bash: cd: ijkplayer-android: 没有那个文件或目录
[root@c7 ijkplayer-android]# ls
android                 ijkmedia                 init-ios-openssl.sh
compile-android-j4a.sh  ijkprof                  init-ios.sh
config                  init-android-exo.sh      ios
COPYING.GPLv2           init-android-j4a.sh      MODULE_LICENSE_APACHE2
COPYING.GPLv3           init-android-libyuv.sh   NEWS.md
COPYING.LGPLv2.1        init-android-openssl.sh  NOTICE
COPYING.LGPLv2.1.txt    init-android-prof.sh     README.md
COPYING.LGPLv3          init-android.sh          tools
extra                   init-config.sh           version.sh
[root@c7 ijkplayer-android]# git checkout -B latest k0.4.4.1
重置分支 'latest'
[root@c7 ijkplayer-android]# source /home/zhangbin/android/setNDKv5_r10e.sh 
set ndk env for vlc android build 
ANDROID_NDK IS /home/zhangbin/android/NDK/android-ndk-r10e
=============================
ANDROID_SDK IS /home/zhangbin/android/sdk/android-sdk-linux
=============================
==============================
PATH IS /usr/java/jdk1.8.0_60/bin:/usr/java/jdk1.8.0_60/jre/bin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/home/zhangbin/android/NDK/android-ndk-r10e:/home/zhangbin/android/sdk/android-sdk-linux/platform-tools:/home/zhangbin/android/sdk/android-sdk-linux/tools:/usr/java/jdk1.8.0_60/bin:/usr/java/jdk1.8.0_60/jre/bin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
ANDROID_TOOLCHAIN is /home/zhangbin/android/android-toolchain/r9d-4.8/android-14
PATH IS /home/zhangbin/android/android-toolchain/r9d-4.8/android-14/bin:/usr/java/jdk1.8.0_60/bin:/usr/java/jdk1.8.0_60/jre/bin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/home/zhangbin/android/NDK/android-ndk-r10e:/home/zhangbin/android/sdk/android-sdk-linux/platform-tools:/home/zhangbin/android/sdk/android-sdk-linux/tools:/usr/java/jdk1.8.0_60/bin:/usr/java/jdk1.8.0_60/jre/bin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
[root@c7 ijkplayer-android]# 
[root@c7 ijkplayer-android]# ./init-android.sh
== pull ffmpeg base ==
正在获取 origin
remote: Counting objects: 3515, done.
remote: Compressing objects: 100% (11/11), done.
remote: Total 3515 (delta 1371), reused 1367 (delta 1367), pack-reused 2137
接收对象中: 100% (3515/3515), 2.27 MiB | 447.00 KiB/s, done.
处理 delta 中: 100% (2681/2681), 完成 388 个本地对象.
来自 https://github.com/Bilibili/FFmpeg
 * [新tag]           ff2.8--ijk0.4.4.1--dev0.3.3--rc7 -> ff2.8--ijk0.4.4.1--dev0.3.3--rc7
 * [新tag]           n2.4.12    -> n2.4.12
 * [新tag]           n2.5.10    -> n2.5.10
 * [新tag]           n2.5.9     -> n2.5.9
 * [新tag]           n2.6.5     -> n2.6.5
 * [新tag]           n2.6.6     -> n2.6.6
 * [新tag]           n2.6.7     -> n2.6.7
 * [新tag]           n2.7.3     -> n2.7.3
 * [新tag]           n2.7.4     -> n2.7.4
 * [新tag]           n2.7.5     -> n2.7.5
 * [新tag]           n2.8.2     -> n2.8.2
 * [新tag]           n2.8.3     -> n2.8.3
 * [新tag]           n2.8.4     -> n2.8.4
 * [新tag]           n2.8.5     -> n2.8.5
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android
== pull ffmpeg fork armv7a ==
正在获取 origin
来自 https://github.com/Bilibili/FFmpeg
 * [新tag]           ff2.8--ijk0.4.4.1--dev0.3.3--rc7 -> ff2.8--ijk0.4.4.1--dev0.3.3--rc7
 * [新tag]           n2.4.12    -> n2.4.12
 * [新tag]           n2.5.10    -> n2.5.10
 * [新tag]           n2.5.9     -> n2.5.9
 * [新tag]           n2.6.5     -> n2.6.5
 * [新tag]           n2.6.6     -> n2.6.6
 * [新tag]           n2.6.7     -> n2.6.7
 * [新tag]           n2.7.3     -> n2.7.3
 * [新tag]           n2.7.4     -> n2.7.4
 * [新tag]           n2.7.5     -> n2.7.5
 * [新tag]           n2.8.2     -> n2.8.2
 * [新tag]           n2.8.3     -> n2.8.3
 * [新tag]           n2.8.4     -> n2.8.4
 * [新tag]           n2.8.5     -> n2.8.5
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android
重置分支 'ijkplayer'
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android
== pull ffmpeg fork armv5 ==
正在获取 origin
来自 https://github.com/Bilibili/FFmpeg
 * [新tag]           ff2.8--ijk0.4.4.1--dev0.3.3--rc7 -> ff2.8--ijk0.4.4.1--dev0.3.3--rc7
 * [新tag]           n2.4.12    -> n2.4.12
 * [新tag]           n2.5.10    -> n2.5.10
 * [新tag]           n2.5.9     -> n2.5.9
 * [新tag]           n2.6.5     -> n2.6.5
 * [新tag]           n2.6.6     -> n2.6.6
 * [新tag]           n2.6.7     -> n2.6.7
 * [新tag]           n2.7.3     -> n2.7.3
 * [新tag]           n2.7.4     -> n2.7.4
 * [新tag]           n2.7.5     -> n2.7.5
 * [新tag]           n2.8.2     -> n2.8.2
 * [新tag]           n2.8.3     -> n2.8.3
 * [新tag]           n2.8.4     -> n2.8.4
 * [新tag]           n2.8.5     -> n2.8.5
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android
重置分支 'ijkplayer'
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android
== pull ffmpeg fork x86 ==
正在获取 origin
来自 https://github.com/Bilibili/FFmpeg
 * [新tag]           ff2.8--ijk0.4.4.1--dev0.3.3--rc7 -> ff2.8--ijk0.4.4.1--dev0.3.3--rc7
 * [新tag]           n2.4.12    -> n2.4.12
 * [新tag]           n2.5.10    -> n2.5.10
 * [新tag]           n2.5.9     -> n2.5.9
 * [新tag]           n2.6.5     -> n2.6.5
 * [新tag]           n2.6.6     -> n2.6.6
 * [新tag]           n2.6.7     -> n2.6.7
 * [新tag]           n2.7.3     -> n2.7.3
 * [新tag]           n2.7.4     -> n2.7.4
 * [新tag]           n2.7.5     -> n2.7.5
 * [新tag]           n2.8.2     -> n2.8.2
 * [新tag]           n2.8.3     -> n2.8.3
 * [新tag]           n2.8.4     -> n2.8.4
 * [新tag]           n2.8.5     -> n2.8.5
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android
重置分支 'ijkplayer'
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android
== pull ffmpeg fork arm64 ==
正在获取 origin
来自 https://github.com/Bilibili/FFmpeg
 * [新tag]           ff2.8--ijk0.4.4.1--dev0.3.3--rc7 -> ff2.8--ijk0.4.4.1--dev0.3.3--rc7
 * [新tag]           n2.4.12    -> n2.4.12
 * [新tag]           n2.5.10    -> n2.5.10
 * [新tag]           n2.5.9     -> n2.5.9
 * [新tag]           n2.6.5     -> n2.6.5
 * [新tag]           n2.6.6     -> n2.6.6
 * [新tag]           n2.6.7     -> n2.6.7
 * [新tag]           n2.7.3     -> n2.7.3
 * [新tag]           n2.7.4     -> n2.7.4
 * [新tag]           n2.7.5     -> n2.7.5
 * [新tag]           n2.8.2     -> n2.8.2
 * [新tag]           n2.8.3     -> n2.8.3
 * [新tag]           n2.8.4     -> n2.8.4
 * [新tag]           n2.8.5     -> n2.8.5
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android
重置分支 'ijkplayer'
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android
== pull libyuv base ==
正在获取 origin
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android
== pull libyuv fork ==
正在获取 origin
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android
已经位于 'ijk-r0.2.1-dev'
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android
[root@c7 ijkplayer-android]# cd android/contrib
[root@c7 contrib]# ./compile-ffmpeg.sh clean
====================
[*] check archs
====================
FF_ALL_ARCHS = armv5 armv7a x86 arm64
FF_ACT_ARCHS = FF_ACT_ARCHS_64

正删除 .config
正删除 .version
正删除 compat/strtod.d
正删除 compat/strtod.o
正删除 config.fate
正删除 config.h
正删除 config.log
正删除 config.mak
正删除 doc/config.texi
正删除 doc/examples/pc-uninstalled/
正删除 libavcodec/aac_ac3_parser.d
正删除 libavcodec/aac_ac3_parser.o
正删除 libavcodec/aac_adtstoasc_bsf.d
正删除 libavcodec/aac_adtstoasc_bsf.o
正删除 libavcodec/aac_parser.d
正删除 libavcodec/aac_parser.o
正删除 libavcodec/aacadtsdec.d
正删除 libavcodec/aacadtsdec.o
正删除 libavcodec/aacdec.d
正删除 libavcodec/aacdec.o
正删除 libavcodec/aacps_float.d
正删除 libavcodec/aacps_float.o
正删除 libavcodec/aacpsdsp_float.d
正删除 libavcodec/aacpsdsp_float.o
正删除 libavcodec/aacsbr.d
正删除 libavcodec/aacsbr.o
正删除 libavcodec/aactab.d
正删除 libavcodec/aactab.o
正删除 libavcodec/ac3tab.d
正删除 libavcodec/ac3tab.o
正删除 libavcodec/allcodecs.d
正删除 libavcodec/allcodecs.o
正删除 libavcodec/arm/aacpsdsp_init_arm.d
正删除 libavcodec/arm/aacpsdsp_init_arm.o
正删除 libavcodec/arm/aacpsdsp_neon.d
正删除 libavcodec/arm/aacpsdsp_neon.o
正删除 libavcodec/arm/blockdsp_init_arm.d
正删除 libavcodec/arm/blockdsp_init_arm.o
正删除 libavcodec/arm/blockdsp_init_neon.d
正删除 libavcodec/arm/blockdsp_init_neon.o
正删除 libavcodec/arm/blockdsp_neon.d
正删除 libavcodec/arm/blockdsp_neon.o
正删除 libavcodec/arm/fft_fixed_init_arm.d
正删除 libavcodec/arm/fft_fixed_init_arm.o
正删除 libavcodec/arm/fft_fixed_neon.d
正删除 libavcodec/arm/fft_fixed_neon.o
正删除 libavcodec/arm/fft_init_arm.d
正删除 libavcodec/arm/fft_init_arm.o
正删除 libavcodec/arm/fft_neon.d
正删除 libavcodec/arm/fft_neon.o
正删除 libavcodec/arm/fft_vfp.d
正删除 libavcodec/arm/fft_vfp.o
正删除 libavcodec/arm/h264chroma_init_arm.d
正删除 libavcodec/arm/h264chroma_init_arm.o
正删除 libavcodec/arm/h264cmc_neon.d
正删除 libavcodec/arm/h264cmc_neon.o
正删除 libavcodec/arm/h264dsp_init_arm.d
正删除 libavcodec/arm/h264dsp_init_arm.o
正删除 libavcodec/arm/h264dsp_neon.d
正删除 libavcodec/arm/h264dsp_neon.o
正删除 libavcodec/arm/h264idct_neon.d
正删除 libavcodec/arm/h264idct_neon.o
正删除 libavcodec/arm/h264pred_init_arm.d
正删除 libavcodec/arm/h264pred_init_arm.o
正删除 libavcodec/arm/h264pred_neon.d
正删除 libavcodec/arm/h264pred_neon.o
正删除 libavcodec/arm/h264qpel_init_arm.d
正删除 libavcodec/arm/h264qpel_init_arm.o
正删除 libavcodec/arm/h264qpel_neon.d
正删除 libavcodec/arm/h264qpel_neon.o
正删除 libavcodec/arm/hpeldsp_arm.d
正删除 libavcodec/arm/hpeldsp_arm.o
正删除 libavcodec/arm/hpeldsp_armv6.d
正删除 libavcodec/arm/hpeldsp_armv6.o
正删除 libavcodec/arm/hpeldsp_init_arm.d
正删除 libavcodec/arm/hpeldsp_init_arm.o
正删除 libavcodec/arm/hpeldsp_init_armv6.d
正删除 libavcodec/arm/hpeldsp_init_armv6.o
正删除 libavcodec/arm/hpeldsp_init_neon.d
正删除 libavcodec/arm/hpeldsp_init_neon.o
正删除 libavcodec/arm/hpeldsp_neon.d
正删除 libavcodec/arm/hpeldsp_neon.o
正删除 libavcodec/arm/idctdsp_arm.d
正删除 libavcodec/arm/idctdsp_arm.o
正删除 libavcodec/arm/idctdsp_armv6.d
正删除 libavcodec/arm/idctdsp_armv6.o
正删除 libavcodec/arm/idctdsp_init_arm.d
正删除 libavcodec/arm/idctdsp_init_arm.o
正删除 libavcodec/arm/idctdsp_init_armv5te.d
正删除 libavcodec/arm/idctdsp_init_armv5te.o
正删除 libavcodec/arm/idctdsp_init_armv6.d
正删除 libavcodec/arm/idctdsp_init_armv6.o
正删除 libavcodec/arm/idctdsp_init_neon.d
正删除 libavcodec/arm/idctdsp_init_neon.o
正删除 libavcodec/arm/idctdsp_neon.d
正删除 libavcodec/arm/idctdsp_neon.o
正删除 libavcodec/arm/jrevdct_arm.d
正删除 libavcodec/arm/jrevdct_arm.o
正删除 libavcodec/arm/mdct_fixed_neon.d
正删除 libavcodec/arm/mdct_fixed_neon.o
正删除 libavcodec/arm/mdct_neon.d
正删除 libavcodec/arm/mdct_neon.o
正删除 libavcodec/arm/mdct_vfp.d
正删除 libavcodec/arm/mdct_vfp.o
正删除 libavcodec/arm/me_cmp_armv6.d
正删除 libavcodec/arm/me_cmp_armv6.o
正删除 libavcodec/arm/me_cmp_init_arm.d
正删除 libavcodec/arm/me_cmp_init_arm.o
正删除 libavcodec/arm/mpegaudiodsp_fixed_armv6.d
正删除 libavcodec/arm/mpegaudiodsp_fixed_armv6.o
正删除 libavcodec/arm/mpegaudiodsp_init_arm.d
正删除 libavcodec/arm/mpegaudiodsp_init_arm.o
正删除 libavcodec/arm/mpegvideo_arm.d
正删除 libavcodec/arm/mpegvideo_arm.o
正删除 libavcodec/arm/mpegvideo_armv5te.d
正删除 libavcodec/arm/mpegvideo_armv5te.o
正删除 libavcodec/arm/mpegvideo_armv5te_s.d
正删除 libavcodec/arm/mpegvideo_armv5te_s.o
正删除 libavcodec/arm/mpegvideo_neon.d
正删除 libavcodec/arm/mpegvideo_neon.o
正删除 libavcodec/arm/pixblockdsp_armv6.d
正删除 libavcodec/arm/pixblockdsp_armv6.o
正删除 libavcodec/arm/pixblockdsp_init_arm.d
正删除 libavcodec/arm/pixblockdsp_init_arm.o
正删除 libavcodec/arm/rdft_neon.d
正删除 libavcodec/arm/rdft_neon.o
正删除 libavcodec/arm/sbrdsp_init_arm.d
正删除 libavcodec/arm/sbrdsp_init_arm.o
正删除 libavcodec/arm/sbrdsp_neon.d
正删除 libavcodec/arm/sbrdsp_neon.o
正删除 libavcodec/arm/simple_idct_arm.d
正删除 libavcodec/arm/simple_idct_arm.o
正删除 libavcodec/arm/simple_idct_armv5te.d
正删除 libavcodec/arm/simple_idct_armv5te.o
正删除 libavcodec/arm/simple_idct_armv6.d
正删除 libavcodec/arm/simple_idct_armv6.o
正删除 libavcodec/arm/simple_idct_neon.d
正删除 libavcodec/arm/simple_idct_neon.o
正删除 libavcodec/arm/startcode_armv6.d
正删除 libavcodec/arm/startcode_armv6.o
正删除 libavcodec/arm/videodsp_armv5te.d
正删除 libavcodec/arm/videodsp_armv5te.o
正删除 libavcodec/arm/videodsp_init_arm.d
正删除 libavcodec/arm/videodsp_init_arm.o
正删除 libavcodec/arm/videodsp_init_armv5te.d
正删除 libavcodec/arm/videodsp_init_armv5te.o
正删除 libavcodec/arm/vp3dsp_init_arm.d
正删除 libavcodec/arm/vp3dsp_init_arm.o
正删除 libavcodec/arm/vp3dsp_neon.d
正删除 libavcodec/arm/vp3dsp_neon.o
正删除 libavcodec/arm/vp6dsp_init_arm.d
正删除 libavcodec/arm/vp6dsp_init_arm.o
正删除 libavcodec/arm/vp6dsp_neon.d
正删除 libavcodec/arm/vp6dsp_neon.o
正删除 libavcodec/audioconvert.d
正删除 libavcodec/audioconvert.o
正删除 libavcodec/avdct.d
正删除 libavcodec/avdct.o
正删除 libavcodec/avfft.d
正删除 libavcodec/avfft.o
正删除 libavcodec/avpacket.d
正删除 libavcodec/avpacket.o
正删除 libavcodec/avpicture.d
正删除 libavcodec/avpicture.o
正删除 libavcodec/bitstream.d
正删除 libavcodec/bitstream.o
正删除 libavcodec/bitstream_filter.d
正删除 libavcodec/bitstream_filter.o
正删除 libavcodec/blockdsp.d
正删除 libavcodec/blockdsp.o
正删除 libavcodec/cabac.d
正删除 libavcodec/cabac.o
正删除 libavcodec/chomp_bsf.d
正删除 libavcodec/chomp_bsf.o
正删除 libavcodec/codec_desc.d
正删除 libavcodec/codec_desc.o
正删除 libavcodec/dct.d
正删除 libavcodec/dct.o
正删除 libavcodec/dct32_fixed.d
正删除 libavcodec/dct32_fixed.o
正删除 libavcodec/dct32_float.d
正删除 libavcodec/dct32_float.o
正删除 libavcodec/dump_extradata_bsf.d
正删除 libavcodec/dump_extradata_bsf.o
正删除 libavcodec/dv_profile.d
正删除 libavcodec/dv_profile.o
正删除 libavcodec/elbg.d
正删除 libavcodec/elbg.o
正删除 libavcodec/error_resilience.d
正删除 libavcodec/error_resilience.o
正删除 libavcodec/faandct.d
正删除 libavcodec/faandct.o
正删除 libavcodec/faanidct.d
正删除 libavcodec/faanidct.o
正删除 libavcodec/fdctdsp.d
正删除 libavcodec/fdctdsp.o
正删除 libavcodec/fft_fixed.d
正删除 libavcodec/fft_fixed.o
正删除 libavcodec/fft_fixed_32.d
正删除 libavcodec/fft_fixed_32.o
正删除 libavcodec/fft_float.d
正删除 libavcodec/fft_float.o
正删除 libavcodec/fft_init_table.d
正删除 libavcodec/fft_init_table.o
正删除 libavcodec/flvdec.d
正删除 libavcodec/flvdec.o
正删除 libavcodec/golomb.d
正删除 libavcodec/golomb.o
正删除 libavcodec/h263.d
正删除 libavcodec/h263.o
正删除 libavcodec/h263_parser.d
正删除 libavcodec/h263_parser.o
正删除 libavcodec/h263data.d
正删除 libavcodec/h263data.o
正删除 libavcodec/h263dec.d
正删除 libavcodec/h263dec.o
正删除 libavcodec/h263dsp.d
正删除 libavcodec/h263dsp.o
正删除 libavcodec/h264.d
正删除 libavcodec/h264.o
正删除 libavcodec/h264_cabac.d
正删除 libavcodec/h264_cabac.o
正删除 libavcodec/h264_cavlc.d
正删除 libavcodec/h264_cavlc.o
正删除 libavcodec/h264_direct.d
正删除 libavcodec/h264_direct.o
正删除 libavcodec/h264_loopfilter.d
正删除 libavcodec/h264_loopfilter.o
正删除 libavcodec/h264_mb.d
正删除 libavcodec/h264_mb.o
正删除 libavcodec/h264_mp4toannexb_bsf.d
正删除 libavcodec/h264_mp4toannexb_bsf.o
正删除 libavcodec/h264_parser.d
正删除 libavcodec/h264_parser.o
正删除 libavcodec/h264_picture.d
正删除 libavcodec/h264_picture.o
正删除 libavcodec/h264_ps.d
正删除 libavcodec/h264_ps.o
正删除 libavcodec/h264_refs.d
正删除 libavcodec/h264_refs.o
正删除 libavcodec/h264_sei.d
正删除 libavcodec/h264_sei.o
正删除 libavcodec/h264_slice.d
正删除 libavcodec/h264_slice.o
正删除 libavcodec/h264chroma.d
正删除 libavcodec/h264chroma.o
正删除 libavcodec/h264dsp.d
正删除 libavcodec/h264dsp.o
正删除 libavcodec/h264idct.d
正删除 libavcodec/h264idct.o
正删除 libavcodec/h264pred.d
正删除 libavcodec/h264pred.o
正删除 libavcodec/h264qpel.d
正删除 libavcodec/h264qpel.o
正删除 libavcodec/hevc_mp4toannexb_bsf.d
正删除 libavcodec/hevc_mp4toannexb_bsf.o
正删除 libavcodec/hpeldsp.d
正删除 libavcodec/hpeldsp.o
正删除 libavcodec/huffman.d
正删除 libavcodec/huffman.o
正删除 libavcodec/idctdsp.d
正删除 libavcodec/idctdsp.o
正删除 libavcodec/imdct15.d
正删除 libavcodec/imdct15.o
正删除 libavcodec/imgconvert.d
正删除 libavcodec/imgconvert.o
正删除 libavcodec/imx_dump_header_bsf.d
正删除 libavcodec/imx_dump_header_bsf.o
正删除 libavcodec/intelh263dec.d
正删除 libavcodec/intelh263dec.o
正删除 libavcodec/ituh263dec.d
正删除 libavcodec/ituh263dec.o
正删除 libavcodec/jfdctfst.d
正删除 libavcodec/jfdctfst.o
正删除 libavcodec/jfdctint.d
正删除 libavcodec/jfdctint.o
正删除 libavcodec/jrevdct.d
正删除 libavcodec/jrevdct.o
正删除 libavcodec/kbdwin.d
正删除 libavcodec/kbdwin.o
正删除 libavcodec/latm_parser.d
正删除 libavcodec/latm_parser.o
正删除 libavcodec/libavcodec.a
正删除 libavcodec/libavcodec.pc
正删除 libavcodec/mathtables.d
正删除 libavcodec/mathtables.o
正删除 libavcodec/mdct_fixed.d
正删除 libavcodec/mdct_fixed.o
正删除 libavcodec/mdct_fixed_32.d
正删除 libavcodec/mdct_fixed_32.o
正删除 libavcodec/mdct_float.d
正删除 libavcodec/mdct_float.o
正删除 libavcodec/me_cmp.d
正删除 libavcodec/me_cmp.o
正删除 libavcodec/mp3_header_decompress_bsf.d
正删除 libavcodec/mp3_header_decompress_bsf.o
正删除 libavcodec/mpeg4_unpack_bframes_bsf.d
正删除 libavcodec/mpeg4_unpack_bframes_bsf.o
正删除 libavcodec/mpeg4audio.d
正删除 libavcodec/mpeg4audio.o
正删除 libavcodec/mpeg4video.d
正删除 libavcodec/mpeg4video.o
正删除 libavcodec/mpeg4videodec.d
正删除 libavcodec/mpeg4videodec.o
正删除 libavcodec/mpeg_er.d
正删除 libavcodec/mpeg_er.o
正删除 libavcodec/mpegaudio.d
正删除 libavcodec/mpegaudio.o
正删除 libavcodec/mpegaudio_parser.d
正删除 libavcodec/mpegaudio_parser.o
正删除 libavcodec/mpegaudiodata.d
正删除 libavcodec/mpegaudiodata.o
正删除 libavcodec/mpegaudiodec_fixed.d
正删除 libavcodec/mpegaudiodec_fixed.o
正删除 libavcodec/mpegaudiodec_float.d
正删除 libavcodec/mpegaudiodec_float.o
正删除 libavcodec/mpegaudiodecheader.d
正删除 libavcodec/mpegaudiodecheader.o
正删除 libavcodec/mpegaudiodsp.d
正删除 libavcodec/mpegaudiodsp.o
正删除 libavcodec/mpegaudiodsp_data.d
正删除 libavcodec/mpegaudiodsp_data.o
正删除 libavcodec/mpegaudiodsp_fixed.d
正删除 libavcodec/mpegaudiodsp_fixed.o
正删除 libavcodec/mpegaudiodsp_float.d
正删除 libavcodec/mpegaudiodsp_float.o
正删除 libavcodec/mpegpicture.d
正删除 libavcodec/mpegpicture.o
正删除 libavcodec/mpegutils.d
正删除 libavcodec/mpegutils.o
正删除 libavcodec/mpegvideo.d
正删除 libavcodec/mpegvideo.o
正删除 libavcodec/mpegvideo_motion.d
正删除 libavcodec/mpegvideo_motion.o
正删除 libavcodec/mpegvideodata.d
正删除 libavcodec/mpegvideodata.o
正删除 libavcodec/mpegvideodsp.d
正删除 libavcodec/mpegvideodsp.o
正删除 libavcodec/noise_bsf.d
正删除 libavcodec/noise_bsf.o
正删除 libavcodec/options.d
正删除 libavcodec/options.o
正删除 libavcodec/parser.d
正删除 libavcodec/parser.o
正删除 libavcodec/pixblockdsp.d
正删除 libavcodec/pixblockdsp.o
正删除 libavcodec/pthread.d
正删除 libavcodec/pthread.o
正删除 libavcodec/pthread_frame.d
正删除 libavcodec/pthread_frame.o
正删除 libavcodec/pthread_slice.d
正删除 libavcodec/pthread_slice.o
正删除 libavcodec/qpeldsp.d
正删除 libavcodec/qpeldsp.o
正删除 libavcodec/qsv_api.d
正删除 libavcodec/qsv_api.o
正删除 libavcodec/raw.d
正删除 libavcodec/raw.o
正删除 libavcodec/rdft.d
正删除 libavcodec/rdft.o
正删除 libavcodec/remove_extradata_bsf.d
正删除 libavcodec/remove_extradata_bsf.o
正删除 libavcodec/resample.d
正删除 libavcodec/resample.o
正删除 libavcodec/resample2.d
正删除 libavcodec/resample2.o
正删除 libavcodec/rl.d
正删除 libavcodec/rl.o
正删除 libavcodec/sbrdsp.d
正删除 libavcodec/sbrdsp.o
正删除 libavcodec/simple_idct.d
正删除 libavcodec/simple_idct.o
正删除 libavcodec/sinewin.d
正删除 libavcodec/sinewin.o
正删除 libavcodec/sinewin_fixed.d
正删除 libavcodec/sinewin_fixed.o
正删除 libavcodec/startcode.d
正删除 libavcodec/startcode.o
正删除 libavcodec/utils.d
正删除 libavcodec/utils.o
正删除 libavcodec/videodsp.d
正删除 libavcodec/videodsp.o
正删除 libavcodec/vorbis_parser.d
正删除 libavcodec/vorbis_parser.o
正删除 libavcodec/vp3dsp.d
正删除 libavcodec/vp3dsp.o
正删除 libavcodec/vp56.d
正删除 libavcodec/vp56.o
正删除 libavcodec/vp56data.d
正删除 libavcodec/vp56data.o
正删除 libavcodec/vp56dsp.d
正删除 libavcodec/vp56dsp.o
正删除 libavcodec/vp56rac.d
正删除 libavcodec/vp56rac.o
正删除 libavcodec/vp6.d
正删除 libavcodec/vp6.o
正删除 libavcodec/vp6dsp.d
正删除 libavcodec/vp6dsp.o
正删除 libavcodec/xiph.d
正删除 libavcodec/xiph.o
正删除 libavfilter/aeval.d
正删除 libavfilter/aeval.o
正删除 libavfilter/af_adelay.d
正删除 libavfilter/af_adelay.o
正删除 libavfilter/af_aecho.d
正删除 libavfilter/af_aecho.o
正删除 libavfilter/af_afade.d
正删除 libavfilter/af_afade.o
正删除 libavfilter/af_aformat.d
正删除 libavfilter/af_aformat.o
正删除 libavfilter/af_amerge.d
正删除 libavfilter/af_amerge.o
正删除 libavfilter/af_amix.d
正删除 libavfilter/af_amix.o
正删除 libavfilter/af_anull.d
正删除 libavfilter/af_anull.o
正删除 libavfilter/af_apad.d
正删除 libavfilter/af_apad.o
正删除 libavfilter/af_aphaser.d
正删除 libavfilter/af_aphaser.o
正删除 libavfilter/af_aresample.d
正删除 libavfilter/af_aresample.o
正删除 libavfilter/af_asetnsamples.d
正删除 libavfilter/af_asetnsamples.o
正删除 libavfilter/af_asetrate.d
正删除 libavfilter/af_asetrate.o
正删除 libavfilter/af_ashowinfo.d
正删除 libavfilter/af_ashowinfo.o
正删除 libavfilter/af_astats.d
正删除 libavfilter/af_astats.o
正删除 libavfilter/af_astreamsync.d
正删除 libavfilter/af_astreamsync.o
正删除 libavfilter/af_atempo.d
正删除 libavfilter/af_atempo.o
正删除 libavfilter/af_biquads.d
正删除 libavfilter/af_biquads.o
正删除 libavfilter/af_channelmap.d
正删除 libavfilter/af_channelmap.o
正删除 libavfilter/af_channelsplit.d
正删除 libavfilter/af_channelsplit.o
正删除 libavfilter/af_chorus.d
正删除 libavfilter/af_chorus.o
正删除 libavfilter/af_compand.d
正删除 libavfilter/af_compand.o
正删除 libavfilter/af_dcshift.d
正删除 libavfilter/af_dcshift.o
正删除 libavfilter/af_dynaudnorm.d
正删除 libavfilter/af_dynaudnorm.o
正删除 libavfilter/af_earwax.d
正删除 libavfilter/af_earwax.o
正删除 libavfilter/af_flanger.d
正删除 libavfilter/af_flanger.o
正删除 libavfilter/af_join.d
正删除 libavfilter/af_join.o
正删除 libavfilter/af_pan.d
正删除 libavfilter/af_pan.o
正删除 libavfilter/af_replaygain.d
正删除 libavfilter/af_replaygain.o
正删除 libavfilter/af_sidechaincompress.d
正删除 libavfilter/af_sidechaincompress.o
正删除 libavfilter/af_silencedetect.d
正删除 libavfilter/af_silencedetect.o
正删除 libavfilter/af_silenceremove.d
正删除 libavfilter/af_silenceremove.o
正删除 libavfilter/af_volume.d
正删除 libavfilter/af_volume.o
正删除 libavfilter/af_volumedetect.d
正删除 libavfilter/af_volumedetect.o
正删除 libavfilter/allfilters.d
正删除 libavfilter/allfilters.o
正删除 libavfilter/asink_anullsink.d
正删除 libavfilter/asink_anullsink.o
正删除 libavfilter/asrc_anullsrc.d
正删除 libavfilter/asrc_anullsrc.o
正删除 libavfilter/asrc_sine.d
正删除 libavfilter/asrc_sine.o
正删除 libavfilter/audio.d
正删除 libavfilter/audio.o
正删除 libavfilter/avcodec.d
正删除 libavfilter/avcodec.o
正删除 libavfilter/avf_aphasemeter.d
正删除 libavfilter/avf_aphasemeter.o
正删除 libavfilter/avf_avectorscope.d
正删除 libavfilter/avf_avectorscope.o
正删除 libavfilter/avf_concat.d
正删除 libavfilter/avf_concat.o
正删除 libavfilter/avf_showcqt.d
正删除 libavfilter/avf_showcqt.o
正删除 libavfilter/avf_showfreqs.d
正删除 libavfilter/avf_showfreqs.o
正删除 libavfilter/avf_showspectrum.d
正删除 libavfilter/avf_showspectrum.o
正删除 libavfilter/avf_showvolume.d
正删除 libavfilter/avf_showvolume.o
正删除 libavfilter/avf_showwaves.d
正删除 libavfilter/avf_showwaves.o
正删除 libavfilter/avfilter.d
正删除 libavfilter/avfilter.o
正删除 libavfilter/avfiltergraph.d
正删除 libavfilter/avfiltergraph.o
正删除 libavfilter/bbox.d
正删除 libavfilter/bbox.o
正删除 libavfilter/buffer.d
正删除 libavfilter/buffer.o
正删除 libavfilter/buffersink.d
正删除 libavfilter/buffersink.o
正删除 libavfilter/buffersrc.d
正删除 libavfilter/buffersrc.o
正删除 libavfilter/drawutils.d
正删除 libavfilter/drawutils.o
正删除 libavfilter/dualinput.d
正删除 libavfilter/dualinput.o
正删除 libavfilter/f_drawgraph.d
正删除 libavfilter/f_drawgraph.o
正删除 libavfilter/f_interleave.d
正删除 libavfilter/f_interleave.o
正删除 libavfilter/f_perms.d
正删除 libavfilter/f_perms.o
正删除 libavfilter/f_reverse.d
正删除 libavfilter/f_reverse.o
正删除 libavfilter/f_select.d
正删除 libavfilter/f_select.o
正删除 libavfilter/f_sendcmd.d
正删除 libavfilter/f_sendcmd.o
正删除 libavfilter/fifo.d
正删除 libavfilter/fifo.o
正删除 libavfilter/formats.d
正删除 libavfilter/formats.o
正删除 libavfilter/framesync.d
正删除 libavfilter/framesync.o
正删除 libavfilter/generate_wave_table.d
正删除 libavfilter/generate_wave_table.o
正删除 libavfilter/graphdump.d
正删除 libavfilter/graphdump.o
正删除 libavfilter/graphparser.d
正删除 libavfilter/graphparser.o
正删除 libavfilter/lavfutils.d
正删除 libavfilter/lavfutils.o
正删除 libavfilter/libavfilter.a
正删除 libavfilter/libavfilter.pc
正删除 libavfilter/lswsutils.d
正删除 libavfilter/lswsutils.o
正删除 libavfilter/opencl_allkernels.d
正删除 libavfilter/opencl_allkernels.o
正删除 libavfilter/pthread.d
正删除 libavfilter/pthread.o
正删除 libavfilter/setpts.d
正删除 libavfilter/setpts.o
正删除 libavfilter/settb.d
正删除 libavfilter/settb.o
正删除 libavfilter/split.d
正删除 libavfilter/split.o
正删除 libavfilter/src_movie.d
正删除 libavfilter/src_movie.o
正删除 libavfilter/transform.d
正删除 libavfilter/transform.o
正删除 libavfilter/trim.d
正删除 libavfilter/trim.o
正删除 libavfilter/vf_alphamerge.d
正删除 libavfilter/vf_alphamerge.o
正删除 libavfilter/vf_aspect.d
正删除 libavfilter/vf_aspect.o
正删除 libavfilter/vf_atadenoise.d
正删除 libavfilter/vf_atadenoise.o
正删除 libavfilter/vf_bbox.d
正删除 libavfilter/vf_bbox.o
正删除 libavfilter/vf_blackdetect.d
正删除 libavfilter/vf_blackdetect.o
正删除 libavfilter/vf_blend.d
正删除 libavfilter/vf_blend.o
正删除 libavfilter/vf_codecview.d
正删除 libavfilter/vf_codecview.o
正删除 libavfilter/vf_colorbalance.d
正删除 libavfilter/vf_colorbalance.o
正删除 libavfilter/vf_colorchannelmixer.d
正删除 libavfilter/vf_colorchannelmixer.o
正删除 libavfilter/vf_colorkey.d
正删除 libavfilter/vf_colorkey.o
正删除 libavfilter/vf_colorlevels.d
正删除 libavfilter/vf_colorlevels.o
正删除 libavfilter/vf_copy.d
正删除 libavfilter/vf_copy.o
正删除 libavfilter/vf_crop.d
正删除 libavfilter/vf_crop.o
正删除 libavfilter/vf_curves.d
正删除 libavfilter/vf_curves.o
正删除 libavfilter/vf_dctdnoiz.d
正删除 libavfilter/vf_dctdnoiz.o
正删除 libavfilter/vf_deband.d
正删除 libavfilter/vf_deband.o
正删除 libavfilter/vf_decimate.d
正删除 libavfilter/vf_decimate.o
正删除 libavfilter/vf_dejudder.d
正删除 libavfilter/vf_dejudder.o
正删除 libavfilter/vf_deshake.d
正删除 libavfilter/vf_deshake.o
正删除 libavfilter/vf_detelecine.d
正删除 libavfilter/vf_detelecine.o
正删除 libavfilter/vf_drawbox.d
正删除 libavfilter/vf_drawbox.o
正删除 libavfilter/vf_edgedetect.d
正删除 libavfilter/vf_edgedetect.o
正删除 libavfilter/vf_elbg.d
正删除 libavfilter/vf_elbg.o
正删除 libavfilter/vf_extractplanes.d
正删除 libavfilter/vf_extractplanes.o
正删除 libavfilter/vf_fade.d
正删除 libavfilter/vf_fade.o
正删除 libavfilter/vf_fftfilt.d
正删除 libavfilter/vf_fftfilt.o
正删除 libavfilter/vf_field.d
正删除 libavfilter/vf_field.o
正删除 libavfilter/vf_fieldmatch.d
正删除 libavfilter/vf_fieldmatch.o
正删除 libavfilter/vf_fieldorder.d
正删除 libavfilter/vf_fieldorder.o
正删除 libavfilter/vf_format.d
正删除 libavfilter/vf_format.o
正删除 libavfilter/vf_fps.d
正删除 libavfilter/vf_fps.o
正删除 libavfilter/vf_framepack.d
正删除 libavfilter/vf_framepack.o
正删除 libavfilter/vf_framerate.d
正删除 libavfilter/vf_framerate.o
正删除 libavfilter/vf_framestep.d
正删除 libavfilter/vf_framestep.o
正删除 libavfilter/vf_gradfun.d
正删除 libavfilter/vf_gradfun.o
正删除 libavfilter/vf_hflip.d
正删除 libavfilter/vf_hflip.o
正删除 libavfilter/vf_histogram.d
正删除 libavfilter/vf_histogram.o
正删除 libavfilter/vf_hqx.d
正删除 libavfilter/vf_hqx.o
正删除 libavfilter/vf_hue.d
正删除 libavfilter/vf_hue.o
正删除 libavfilter/vf_idet.d
正删除 libavfilter/vf_idet.o
正删除 libavfilter/vf_il.d
正删除 libavfilter/vf_il.o
正删除 libavfilter/vf_lenscorrection.d
正删除 libavfilter/vf_lenscorrection.o
正删除 libavfilter/vf_lut.d
正删除 libavfilter/vf_lut.o
正删除 libavfilter/vf_lut3d.d
正删除 libavfilter/vf_lut3d.o
正删除 libavfilter/vf_mergeplanes.d
正删除 libavfilter/vf_mergeplanes.o
正删除 libavfilter/vf_neighbor.d
正删除 libavfilter/vf_neighbor.o
正删除 libavfilter/vf_noise.d
正删除 libavfilter/vf_noise.o
正删除 libavfilter/vf_null.d
正删除 libavfilter/vf_null.o
正删除 libavfilter/vf_overlay.d
正删除 libavfilter/vf_overlay.o
正删除 libavfilter/vf_pad.d
正删除 libavfilter/vf_pad.o
正删除 libavfilter/vf_palettegen.d
正删除 libavfilter/vf_palettegen.o
正删除 libavfilter/vf_paletteuse.d
正删除 libavfilter/vf_paletteuse.o
正删除 libavfilter/vf_pixdesctest.d
正删除 libavfilter/vf_pixdesctest.o
正删除 libavfilter/vf_psnr.d
正删除 libavfilter/vf_psnr.o
正删除 libavfilter/vf_qp.d
正删除 libavfilter/vf_qp.o
正删除 libavfilter/vf_random.d
正删除 libavfilter/vf_random.o
正删除 libavfilter/vf_removegrain.d
正删除 libavfilter/vf_removegrain.o
正删除 libavfilter/vf_removelogo.d
正删除 libavfilter/vf_removelogo.o
正删除 libavfilter/vf_rotate.d
正删除 libavfilter/vf_rotate.o
正删除 libavfilter/vf_scale.d
正删除 libavfilter/vf_scale.o
正删除 libavfilter/vf_separatefields.d
正删除 libavfilter/vf_separatefields.o
正删除 libavfilter/vf_setfield.d
正删除 libavfilter/vf_setfield.o
正删除 libavfilter/vf_showinfo.d
正删除 libavfilter/vf_showinfo.o
正删除 libavfilter/vf_showpalette.d
正删除 libavfilter/vf_showpalette.o
正删除 libavfilter/vf_shuffleplanes.d
正删除 libavfilter/vf_shuffleplanes.o
正删除 libavfilter/vf_signalstats.d
正删除 libavfilter/vf_signalstats.o
正删除 libavfilter/vf_ssim.d
正删除 libavfilter/vf_ssim.o
正删除 libavfilter/vf_stack.d
正删除 libavfilter/vf_stack.o
正删除 libavfilter/vf_swapuv.d
正删除 libavfilter/vf_swapuv.o
正删除 libavfilter/vf_telecine.d
正删除 libavfilter/vf_telecine.o
正删除 libavfilter/vf_thumbnail.d
正删除 libavfilter/vf_thumbnail.o
正删除 libavfilter/vf_tile.d
正删除 libavfilter/vf_tile.o
正删除 libavfilter/vf_transpose.d
正删除 libavfilter/vf_transpose.o
正删除 libavfilter/vf_unsharp.d
正删除 libavfilter/vf_unsharp.o
正删除 libavfilter/vf_vectorscope.d
正删除 libavfilter/vf_vectorscope.o
正删除 libavfilter/vf_vflip.d
正删除 libavfilter/vf_vflip.o
正删除 libavfilter/vf_vignette.d
正删除 libavfilter/vf_vignette.o
正删除 libavfilter/vf_w3fdif.d
正删除 libavfilter/vf_w3fdif.o
正删除 libavfilter/vf_waveform.d
正删除 libavfilter/vf_waveform.o
正删除 libavfilter/vf_xbr.d
正删除 libavfilter/vf_xbr.o
正删除 libavfilter/vf_yadif.d
正删除 libavfilter/vf_yadif.o
正删除 libavfilter/vf_zoompan.d
正删除 libavfilter/vf_zoompan.o
正删除 libavfilter/video.d
正删除 libavfilter/video.o
正删除 libavfilter/vsink_nullsink.d
正删除 libavfilter/vsink_nullsink.o
正删除 libavfilter/vsrc_cellauto.d
正删除 libavfilter/vsrc_cellauto.o
正删除 libavfilter/vsrc_life.d
正删除 libavfilter/vsrc_life.o
正删除 libavfilter/vsrc_mandelbrot.d
正删除 libavfilter/vsrc_mandelbrot.o
正删除 libavfilter/vsrc_testsrc.d
正删除 libavfilter/vsrc_testsrc.o
正删除 libavformat/aacdec.d
正删除 libavformat/aacdec.o
正删除 libavformat/adtsenc.d
正删除 libavformat/adtsenc.o
正删除 libavformat/allformats.d
正删除 libavformat/allformats.o
正删除 libavformat/apetag.d
正删除 libavformat/apetag.o
正删除 libavformat/avc.d
正删除 libavformat/avc.o
正删除 libavformat/avio.d
正删除 libavformat/avio.o
正删除 libavformat/aviobuf.d
正删除 libavformat/aviobuf.o
正删除 libavformat/cache.d
正删除 libavformat/cache.o
正删除 libavformat/concat.d
正删除 libavformat/concat.o
正删除 libavformat/concatdec.d
正删除 libavformat/concatdec.o
正删除 libavformat/crypto.d
正删除 libavformat/crypto.o
正删除 libavformat/cutils.d
正删除 libavformat/cutils.o
正删除 libavformat/data_uri.d
正删除 libavformat/data_uri.o
正删除 libavformat/dump.d
正删除 libavformat/dump.o
正删除 libavformat/file.d
正删除 libavformat/file.o
正删除 libavformat/flvdec.d
正删除 libavformat/flvdec.o
正删除 libavformat/format.d
正删除 libavformat/format.o
正删除 libavformat/ftp.d
正删除 libavformat/ftp.o
正删除 libavformat/hevc.d
正删除 libavformat/hevc.o
正删除 libavformat/hls.d
正删除 libavformat/hls.o
正删除 libavformat/hlsproto.d
正删除 libavformat/hlsproto.o
正删除 libavformat/http.d
正删除 libavformat/http.o
正删除 libavformat/httpauth.d
正删除 libavformat/httpauth.o
正删除 libavformat/icecast.d
正删除 libavformat/icecast.o
正删除 libavformat/id3v1.d
正删除 libavformat/id3v1.o
正删除 libavformat/id3v2.d
正删除 libavformat/id3v2.o
正删除 libavformat/id3v2enc.d
正删除 libavformat/id3v2enc.o
正删除 libavformat/img2.d
正删除 libavformat/img2.o
正删除 libavformat/isom.d
正删除 libavformat/isom.o
正删除 libavformat/latmenc.d
正删除 libavformat/latmenc.o
正删除 libavformat/libavformat.a
正删除 libavformat/libavformat.pc
正删除 libavformat/loasdec.d
正删除 libavformat/loasdec.o
正删除 libavformat/m4vdec.d
正删除 libavformat/m4vdec.o
正删除 libavformat/md5proto.d
正删除 libavformat/md5proto.o
正删除 libavformat/metadata.d
正删除 libavformat/metadata.o
正删除 libavformat/mov.d
正删除 libavformat/mov.o
正删除 libavformat/mov_chan.d
正删除 libavformat/mov_chan.o
正删除 libavformat/movenc.d
正删除 libavformat/movenc.o
正删除 libavformat/movenchint.d
正删除 libavformat/movenchint.o
正删除 libavformat/mp3dec.d
正删除 libavformat/mp3dec.o
正删除 libavformat/mpeg.d
正删除 libavformat/mpeg.o
正删除 libavformat/mpegts.d
正删除 libavformat/mpegts.o
正删除 libavformat/mpegtsenc.d
正删除 libavformat/mpegtsenc.o
正删除 libavformat/mpegvideodec.d
正删除 libavformat/mpegvideodec.o
正删除 libavformat/mux.d
正删除 libavformat/mux.o
正删除 libavformat/network.d
正删除 libavformat/network.o
正删除 libavformat/options.d
正删除 libavformat/options.o
正删除 libavformat/os_support.d
正删除 libavformat/os_support.o
正删除 libavformat/rawdec.d
正删除 libavformat/rawdec.o
正删除 libavformat/rawenc.d
正删除 libavformat/rawenc.o
正删除 libavformat/replaygain.d
正删除 libavformat/replaygain.o
正删除 libavformat/riff.d
正删除 libavformat/riff.o
正删除 libavformat/riffdec.d
正删除 libavformat/riffdec.o
正删除 libavformat/riffenc.d
正删除 libavformat/riffenc.o
正删除 libavformat/rtmphttp.d
正删除 libavformat/rtmphttp.o
正删除 libavformat/rtmppkt.d
正删除 libavformat/rtmppkt.o
正删除 libavformat/rtmpproto.d
正删除 libavformat/rtmpproto.o
正删除 libavformat/rtp.d
正删除 libavformat/rtp.o
正删除 libavformat/rtpenc_chain.d
正删除 libavformat/rtpenc_chain.o
正删除 libavformat/sdp.d
正删除 libavformat/sdp.o
正删除 libavformat/subfile.d
正删除 libavformat/subfile.o
正删除 libavformat/tcp.d
正删除 libavformat/tcp.o
正删除 libavformat/udp.d
正删除 libavformat/udp.o
正删除 libavformat/url.d
正删除 libavformat/url.o
正删除 libavformat/urldecode.d
正删除 libavformat/urldecode.o
正删除 libavformat/utils.d
正删除 libavformat/utils.o
正删除 libavutil/adler32.d
正删除 libavutil/adler32.o
正删除 libavutil/aes.d
正删除 libavutil/aes.o
正删除 libavutil/arm/cpu.d
正删除 libavutil/arm/cpu.o
正删除 libavutil/arm/float_dsp_init_arm.d
正删除 libavutil/arm/float_dsp_init_arm.o
正删除 libavutil/arm/float_dsp_init_neon.d
正删除 libavutil/arm/float_dsp_init_neon.o
正删除 libavutil/arm/float_dsp_init_vfp.d
正删除 libavutil/arm/float_dsp_init_vfp.o
正删除 libavutil/arm/float_dsp_neon.d
正删除 libavutil/arm/float_dsp_neon.o
正删除 libavutil/arm/float_dsp_vfp.d
正删除 libavutil/arm/float_dsp_vfp.o
正删除 libavutil/audio_fifo.d
正删除 libavutil/audio_fifo.o
正删除 libavutil/avconfig.h
正删除 libavutil/avstring.d
正删除 libavutil/avstring.o
正删除 libavutil/base64.d
正删除 libavutil/base64.o
正删除 libavutil/blowfish.d
正删除 libavutil/blowfish.o
正删除 libavutil/bprint.d
正删除 libavutil/bprint.o
正删除 libavutil/buffer.d
正删除 libavutil/buffer.o
正删除 libavutil/camellia.d
正删除 libavutil/camellia.o
正删除 libavutil/cast5.d
正删除 libavutil/cast5.o
正删除 libavutil/channel_layout.d
正删除 libavutil/channel_layout.o
正删除 libavutil/color_utils.d
正删除 libavutil/color_utils.o
正删除 libavutil/cpu.d
正删除 libavutil/cpu.o
正删除 libavutil/crc.d
正删除 libavutil/crc.o
正删除 libavutil/des.d
正删除 libavutil/des.o
正删除 libavutil/dict.d
正删除 libavutil/dict.o
正删除 libavutil/display.d
正删除 libavutil/display.o
正删除 libavutil/downmix_info.d
正删除 libavutil/downmix_info.o
正删除 libavutil/error.d
正删除 libavutil/error.o
正删除 libavutil/eval.d
正删除 libavutil/eval.o
正删除 libavutil/ffversion.h
正删除 libavutil/fifo.d
正删除 libavutil/fifo.o
正删除 libavutil/file.d
正删除 libavutil/file.o
正删除 libavutil/file_open.d
正删除 libavutil/file_open.o
正删除 libavutil/fixed_dsp.d
正删除 libavutil/fixed_dsp.o
正删除 libavutil/float_dsp.d
正删除 libavutil/float_dsp.o
正删除 libavutil/frame.d
正删除 libavutil/frame.o
正删除 libavutil/hash.d
正删除 libavutil/hash.o
正删除 libavutil/hmac.d
正删除 libavutil/hmac.o
正删除 libavutil/imgutils.d
正删除 libavutil/imgutils.o
正删除 libavutil/intmath.d
正删除 libavutil/intmath.o
正删除 libavutil/lfg.d
正删除 libavutil/lfg.o
正删除 libavutil/libavutil.a
正删除 libavutil/libavutil.pc
正删除 libavutil/lls.d
正删除 libavutil/lls.o
正删除 libavutil/log.d
正删除 libavutil/log.o
正删除 libavutil/log2_tab.d
正删除 libavutil/log2_tab.o
正删除 libavutil/mathematics.d
正删除 libavutil/mathematics.o
正删除 libavutil/md5.d
正删除 libavutil/md5.o
正删除 libavutil/mem.d
正删除 libavutil/mem.o
正删除 libavutil/murmur3.d
正删除 libavutil/murmur3.o
正删除 libavutil/opt.d
正删除 libavutil/opt.o
正删除 libavutil/parseutils.d
正删除 libavutil/parseutils.o
正删除 libavutil/pixdesc.d
正删除 libavutil/pixdesc.o
正删除 libavutil/pixelutils.d
正删除 libavutil/pixelutils.o
正删除 libavutil/random_seed.d
正删除 libavutil/random_seed.o
正删除 libavutil/rational.d
正删除 libavutil/rational.o
正删除 libavutil/rc4.d
正删除 libavutil/rc4.o
正删除 libavutil/reverse.d
正删除 libavutil/reverse.o
正删除 libavutil/ripemd.d
正删除 libavutil/ripemd.o
正删除 libavutil/samplefmt.d
正删除 libavutil/samplefmt.o
正删除 libavutil/sha.d
正删除 libavutil/sha.o
正删除 libavutil/sha512.d
正删除 libavutil/sha512.o
正删除 libavutil/stereo3d.d
正删除 libavutil/stereo3d.o
正删除 libavutil/tea.d
正删除 libavutil/tea.o
正删除 libavutil/threadmessage.d
正删除 libavutil/threadmessage.o
正删除 libavutil/time.d
正删除 libavutil/time.o
正删除 libavutil/timecode.d
正删除 libavutil/timecode.o
正删除 libavutil/tree.d
正删除 libavutil/tree.o
正删除 libavutil/twofish.d
正删除 libavutil/twofish.o
正删除 libavutil/utils.d
正删除 libavutil/utils.o
正删除 libavutil/xga_font_data.d
正删除 libavutil/xga_font_data.o
正删除 libavutil/xtea.d
正删除 libavutil/xtea.o
正删除 libswresample/arm/audio_convert_init.d
正删除 libswresample/arm/audio_convert_init.o
正删除 libswresample/arm/audio_convert_neon.d
正删除 libswresample/arm/audio_convert_neon.o
正删除 libswresample/audioconvert.d
正删除 libswresample/audioconvert.o
正删除 libswresample/dither.d
正删除 libswresample/dither.o
正删除 libswresample/libswresample.a
正删除 libswresample/libswresample.pc
正删除 libswresample/options.d
正删除 libswresample/options.o
正删除 libswresample/rematrix.d
正删除 libswresample/rematrix.o
正删除 libswresample/resample.d
正删除 libswresample/resample.o
正删除 libswresample/resample_dsp.d
正删除 libswresample/resample_dsp.o
正删除 libswresample/swresample.d
正删除 libswresample/swresample.o
正删除 libswresample/swresample_frame.d
正删除 libswresample/swresample_frame.o
正删除 libswscale/alphablend.d
正删除 libswscale/alphablend.o
正删除 libswscale/gamma.d
正删除 libswscale/gamma.o
正删除 libswscale/hscale.d
正删除 libswscale/hscale.o
正删除 libswscale/hscale_fast_bilinear.d
正删除 libswscale/hscale_fast_bilinear.o
正删除 libswscale/input.d
正删除 libswscale/input.o
正删除 libswscale/libswscale.a
正删除 libswscale/libswscale.pc
正删除 libswscale/options.d
正删除 libswscale/options.o
正删除 libswscale/output.d
正删除 libswscale/output.o
正删除 libswscale/rgb2rgb.d
正删除 libswscale/rgb2rgb.o
正删除 libswscale/slice.d
正删除 libswscale/slice.o
正删除 libswscale/swscale.d
正删除 libswscale/swscale.o
正删除 libswscale/swscale_unscaled.d
正删除 libswscale/swscale_unscaled.o
正删除 libswscale/utils.d
正删除 libswscale/utils.o
正删除 libswscale/vscale.d
正删除 libswscale/vscale.o
正删除 libswscale/yuv2rgb.d
正删除 libswscale/yuv2rgb.o
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/contrib
正删除 .config
正删除 .version
正删除 compat/strtod.d
正删除 compat/strtod.o
正删除 config.fate
正删除 config.h
正删除 config.log
正删除 config.mak
正删除 doc/config.texi
正删除 doc/examples/pc-uninstalled/
正删除 libavcodec/aac_ac3_parser.d
正删除 libavcodec/aac_ac3_parser.o
正删除 libavcodec/aac_adtstoasc_bsf.d
正删除 libavcodec/aac_adtstoasc_bsf.o
正删除 libavcodec/aac_parser.d
正删除 libavcodec/aac_parser.o
正删除 libavcodec/aacadtsdec.d
正删除 libavcodec/aacadtsdec.o
正删除 libavcodec/aacdec.d
正删除 libavcodec/aacdec.o
正删除 libavcodec/aacps_float.d
正删除 libavcodec/aacps_float.o
正删除 libavcodec/aacpsdsp_float.d
正删除 libavcodec/aacpsdsp_float.o
正删除 libavcodec/aacsbr.d
正删除 libavcodec/aacsbr.o
正删除 libavcodec/aactab.d
正删除 libavcodec/aactab.o
正删除 libavcodec/ac3tab.d
正删除 libavcodec/ac3tab.o
正删除 libavcodec/allcodecs.d
正删除 libavcodec/allcodecs.o
正删除 libavcodec/arm/aacpsdsp_init_arm.d
正删除 libavcodec/arm/aacpsdsp_init_arm.o
正删除 libavcodec/arm/aacpsdsp_neon.d
正删除 libavcodec/arm/aacpsdsp_neon.o
正删除 libavcodec/arm/blockdsp_init_arm.d
正删除 libavcodec/arm/blockdsp_init_arm.o
正删除 libavcodec/arm/blockdsp_init_neon.d
正删除 libavcodec/arm/blockdsp_init_neon.o
正删除 libavcodec/arm/blockdsp_neon.d
正删除 libavcodec/arm/blockdsp_neon.o
正删除 libavcodec/arm/fft_fixed_init_arm.d
正删除 libavcodec/arm/fft_fixed_init_arm.o
正删除 libavcodec/arm/fft_fixed_neon.d
正删除 libavcodec/arm/fft_fixed_neon.o
正删除 libavcodec/arm/fft_init_arm.d
正删除 libavcodec/arm/fft_init_arm.o
正删除 libavcodec/arm/fft_neon.d
正删除 libavcodec/arm/fft_neon.o
正删除 libavcodec/arm/fft_vfp.d
正删除 libavcodec/arm/fft_vfp.o
正删除 libavcodec/arm/h264chroma_init_arm.d
正删除 libavcodec/arm/h264chroma_init_arm.o
正删除 libavcodec/arm/h264cmc_neon.d
正删除 libavcodec/arm/h264cmc_neon.o
正删除 libavcodec/arm/h264dsp_init_arm.d
正删除 libavcodec/arm/h264dsp_init_arm.o
正删除 libavcodec/arm/h264dsp_neon.d
正删除 libavcodec/arm/h264dsp_neon.o
正删除 libavcodec/arm/h264idct_neon.d
正删除 libavcodec/arm/h264idct_neon.o
正删除 libavcodec/arm/h264pred_init_arm.d
正删除 libavcodec/arm/h264pred_init_arm.o
正删除 libavcodec/arm/h264pred_neon.d
正删除 libavcodec/arm/h264pred_neon.o
正删除 libavcodec/arm/h264qpel_init_arm.d
正删除 libavcodec/arm/h264qpel_init_arm.o
正删除 libavcodec/arm/h264qpel_neon.d
正删除 libavcodec/arm/h264qpel_neon.o
正删除 libavcodec/arm/hpeldsp_arm.d
正删除 libavcodec/arm/hpeldsp_arm.o
正删除 libavcodec/arm/hpeldsp_armv6.d
正删除 libavcodec/arm/hpeldsp_armv6.o
正删除 libavcodec/arm/hpeldsp_init_arm.d
正删除 libavcodec/arm/hpeldsp_init_arm.o
正删除 libavcodec/arm/hpeldsp_init_armv6.d
正删除 libavcodec/arm/hpeldsp_init_armv6.o
正删除 libavcodec/arm/hpeldsp_init_neon.d
正删除 libavcodec/arm/hpeldsp_init_neon.o
正删除 libavcodec/arm/hpeldsp_neon.d
正删除 libavcodec/arm/hpeldsp_neon.o
正删除 libavcodec/arm/idctdsp_arm.d
正删除 libavcodec/arm/idctdsp_arm.o
正删除 libavcodec/arm/idctdsp_armv6.d
正删除 libavcodec/arm/idctdsp_armv6.o
正删除 libavcodec/arm/idctdsp_init_arm.d
正删除 libavcodec/arm/idctdsp_init_arm.o
正删除 libavcodec/arm/idctdsp_init_armv5te.d
正删除 libavcodec/arm/idctdsp_init_armv5te.o
正删除 libavcodec/arm/idctdsp_init_armv6.d
正删除 libavcodec/arm/idctdsp_init_armv6.o
正删除 libavcodec/arm/idctdsp_init_neon.d
正删除 libavcodec/arm/idctdsp_init_neon.o
正删除 libavcodec/arm/idctdsp_neon.d
正删除 libavcodec/arm/idctdsp_neon.o
正删除 libavcodec/arm/jrevdct_arm.d
正删除 libavcodec/arm/jrevdct_arm.o
正删除 libavcodec/arm/mdct_fixed_neon.d
正删除 libavcodec/arm/mdct_fixed_neon.o
正删除 libavcodec/arm/mdct_neon.d
正删除 libavcodec/arm/mdct_neon.o
正删除 libavcodec/arm/mdct_vfp.d
正删除 libavcodec/arm/mdct_vfp.o
正删除 libavcodec/arm/me_cmp_armv6.d
正删除 libavcodec/arm/me_cmp_armv6.o
正删除 libavcodec/arm/me_cmp_init_arm.d
正删除 libavcodec/arm/me_cmp_init_arm.o
正删除 libavcodec/arm/mpegaudiodsp_fixed_armv6.d
正删除 libavcodec/arm/mpegaudiodsp_fixed_armv6.o
正删除 libavcodec/arm/mpegaudiodsp_init_arm.d
正删除 libavcodec/arm/mpegaudiodsp_init_arm.o
正删除 libavcodec/arm/mpegvideo_arm.d
正删除 libavcodec/arm/mpegvideo_arm.o
正删除 libavcodec/arm/mpegvideo_armv5te.d
正删除 libavcodec/arm/mpegvideo_armv5te.o
正删除 libavcodec/arm/mpegvideo_armv5te_s.d
正删除 libavcodec/arm/mpegvideo_armv5te_s.o
正删除 libavcodec/arm/mpegvideo_neon.d
正删除 libavcodec/arm/mpegvideo_neon.o
正删除 libavcodec/arm/pixblockdsp_armv6.d
正删除 libavcodec/arm/pixblockdsp_armv6.o
正删除 libavcodec/arm/pixblockdsp_init_arm.d
正删除 libavcodec/arm/pixblockdsp_init_arm.o
正删除 libavcodec/arm/rdft_neon.d
正删除 libavcodec/arm/rdft_neon.o
正删除 libavcodec/arm/sbrdsp_init_arm.d
正删除 libavcodec/arm/sbrdsp_init_arm.o
正删除 libavcodec/arm/sbrdsp_neon.d
正删除 libavcodec/arm/sbrdsp_neon.o
正删除 libavcodec/arm/simple_idct_arm.d
正删除 libavcodec/arm/simple_idct_arm.o
正删除 libavcodec/arm/simple_idct_armv5te.d
正删除 libavcodec/arm/simple_idct_armv5te.o
正删除 libavcodec/arm/simple_idct_armv6.d
正删除 libavcodec/arm/simple_idct_armv6.o
正删除 libavcodec/arm/simple_idct_neon.d
正删除 libavcodec/arm/simple_idct_neon.o
正删除 libavcodec/arm/startcode_armv6.d
正删除 libavcodec/arm/startcode_armv6.o
正删除 libavcodec/arm/videodsp_armv5te.d
正删除 libavcodec/arm/videodsp_armv5te.o
正删除 libavcodec/arm/videodsp_init_arm.d
正删除 libavcodec/arm/videodsp_init_arm.o
正删除 libavcodec/arm/videodsp_init_armv5te.d
正删除 libavcodec/arm/videodsp_init_armv5te.o
正删除 libavcodec/arm/vp3dsp_init_arm.d
正删除 libavcodec/arm/vp3dsp_init_arm.o
正删除 libavcodec/arm/vp3dsp_neon.d
正删除 libavcodec/arm/vp3dsp_neon.o
正删除 libavcodec/arm/vp6dsp_init_arm.d
正删除 libavcodec/arm/vp6dsp_init_arm.o
正删除 libavcodec/arm/vp6dsp_neon.d
正删除 libavcodec/arm/vp6dsp_neon.o
正删除 libavcodec/audioconvert.d
正删除 libavcodec/audioconvert.o
正删除 libavcodec/avdct.d
正删除 libavcodec/avdct.o
正删除 libavcodec/avfft.d
正删除 libavcodec/avfft.o
正删除 libavcodec/avpacket.d
正删除 libavcodec/avpacket.o
正删除 libavcodec/avpicture.d
正删除 libavcodec/avpicture.o
正删除 libavcodec/bitstream.d
正删除 libavcodec/bitstream.o
正删除 libavcodec/bitstream_filter.d
正删除 libavcodec/bitstream_filter.o
正删除 libavcodec/blockdsp.d
正删除 libavcodec/blockdsp.o
正删除 libavcodec/cabac.d
正删除 libavcodec/cabac.o
正删除 libavcodec/chomp_bsf.d
正删除 libavcodec/chomp_bsf.o
正删除 libavcodec/codec_desc.d
正删除 libavcodec/codec_desc.o
正删除 libavcodec/dct.d
正删除 libavcodec/dct.o
正删除 libavcodec/dct32_fixed.d
正删除 libavcodec/dct32_fixed.o
正删除 libavcodec/dct32_float.d
正删除 libavcodec/dct32_float.o
正删除 libavcodec/dump_extradata_bsf.d
正删除 libavcodec/dump_extradata_bsf.o
正删除 libavcodec/dv_profile.d
正删除 libavcodec/dv_profile.o
正删除 libavcodec/elbg.d
正删除 libavcodec/elbg.o
正删除 libavcodec/error_resilience.d
正删除 libavcodec/error_resilience.o
正删除 libavcodec/faandct.d
正删除 libavcodec/faandct.o
正删除 libavcodec/faanidct.d
正删除 libavcodec/faanidct.o
正删除 libavcodec/fdctdsp.d
正删除 libavcodec/fdctdsp.o
正删除 libavcodec/fft_fixed.d
正删除 libavcodec/fft_fixed.o
正删除 libavcodec/fft_fixed_32.d
正删除 libavcodec/fft_fixed_32.o
正删除 libavcodec/fft_float.d
正删除 libavcodec/fft_float.o
正删除 libavcodec/fft_init_table.d
正删除 libavcodec/fft_init_table.o
正删除 libavcodec/flvdec.d
正删除 libavcodec/flvdec.o
正删除 libavcodec/golomb.d
正删除 libavcodec/golomb.o
正删除 libavcodec/h263.d
正删除 libavcodec/h263.o
正删除 libavcodec/h263_parser.d
正删除 libavcodec/h263_parser.o
正删除 libavcodec/h263data.d
正删除 libavcodec/h263data.o
正删除 libavcodec/h263dec.d
正删除 libavcodec/h263dec.o
正删除 libavcodec/h263dsp.d
正删除 libavcodec/h263dsp.o
正删除 libavcodec/h264.d
正删除 libavcodec/h264.o
正删除 libavcodec/h264_cabac.d
正删除 libavcodec/h264_cabac.o
正删除 libavcodec/h264_cavlc.d
正删除 libavcodec/h264_cavlc.o
正删除 libavcodec/h264_direct.d
正删除 libavcodec/h264_direct.o
正删除 libavcodec/h264_loopfilter.d
正删除 libavcodec/h264_loopfilter.o
正删除 libavcodec/h264_mb.d
正删除 libavcodec/h264_mb.o
正删除 libavcodec/h264_mp4toannexb_bsf.d
正删除 libavcodec/h264_mp4toannexb_bsf.o
正删除 libavcodec/h264_parser.d
正删除 libavcodec/h264_parser.o
正删除 libavcodec/h264_picture.d
正删除 libavcodec/h264_picture.o
正删除 libavcodec/h264_ps.d
正删除 libavcodec/h264_ps.o
正删除 libavcodec/h264_refs.d
正删除 libavcodec/h264_refs.o
正删除 libavcodec/h264_sei.d
正删除 libavcodec/h264_sei.o
正删除 libavcodec/h264_slice.d
正删除 libavcodec/h264_slice.o
正删除 libavcodec/h264chroma.d
正删除 libavcodec/h264chroma.o
正删除 libavcodec/h264dsp.d
正删除 libavcodec/h264dsp.o
正删除 libavcodec/h264idct.d
正删除 libavcodec/h264idct.o
正删除 libavcodec/h264pred.d
正删除 libavcodec/h264pred.o
正删除 libavcodec/h264qpel.d
正删除 libavcodec/h264qpel.o
正删除 libavcodec/hevc_mp4toannexb_bsf.d
正删除 libavcodec/hevc_mp4toannexb_bsf.o
正删除 libavcodec/hpeldsp.d
正删除 libavcodec/hpeldsp.o
正删除 libavcodec/huffman.d
正删除 libavcodec/huffman.o
正删除 libavcodec/idctdsp.d
正删除 libavcodec/idctdsp.o
正删除 libavcodec/imdct15.d
正删除 libavcodec/imdct15.o
正删除 libavcodec/imgconvert.d
正删除 libavcodec/imgconvert.o
正删除 libavcodec/imx_dump_header_bsf.d
正删除 libavcodec/imx_dump_header_bsf.o
正删除 libavcodec/intelh263dec.d
正删除 libavcodec/intelh263dec.o
正删除 libavcodec/ituh263dec.d
正删除 libavcodec/ituh263dec.o
正删除 libavcodec/jfdctfst.d
正删除 libavcodec/jfdctfst.o
正删除 libavcodec/jfdctint.d
正删除 libavcodec/jfdctint.o
正删除 libavcodec/jrevdct.d
正删除 libavcodec/jrevdct.o
正删除 libavcodec/kbdwin.d
正删除 libavcodec/kbdwin.o
正删除 libavcodec/latm_parser.d
正删除 libavcodec/latm_parser.o
正删除 libavcodec/libavcodec.a
正删除 libavcodec/libavcodec.pc
正删除 libavcodec/mathtables.d
正删除 libavcodec/mathtables.o
正删除 libavcodec/mdct_fixed.d
正删除 libavcodec/mdct_fixed.o
正删除 libavcodec/mdct_fixed_32.d
正删除 libavcodec/mdct_fixed_32.o
正删除 libavcodec/mdct_float.d
正删除 libavcodec/mdct_float.o
正删除 libavcodec/me_cmp.d
正删除 libavcodec/me_cmp.o
正删除 libavcodec/mp3_header_decompress_bsf.d
正删除 libavcodec/mp3_header_decompress_bsf.o
正删除 libavcodec/mpeg4_unpack_bframes_bsf.d
正删除 libavcodec/mpeg4_unpack_bframes_bsf.o
正删除 libavcodec/mpeg4audio.d
正删除 libavcodec/mpeg4audio.o
正删除 libavcodec/mpeg4video.d
正删除 libavcodec/mpeg4video.o
正删除 libavcodec/mpeg4videodec.d
正删除 libavcodec/mpeg4videodec.o
正删除 libavcodec/mpeg_er.d
正删除 libavcodec/mpeg_er.o
正删除 libavcodec/mpegaudio.d
正删除 libavcodec/mpegaudio.o
正删除 libavcodec/mpegaudio_parser.d
正删除 libavcodec/mpegaudio_parser.o
正删除 libavcodec/mpegaudiodata.d
正删除 libavcodec/mpegaudiodata.o
正删除 libavcodec/mpegaudiodec_fixed.d
正删除 libavcodec/mpegaudiodec_fixed.o
正删除 libavcodec/mpegaudiodec_float.d
正删除 libavcodec/mpegaudiodec_float.o
正删除 libavcodec/mpegaudiodecheader.d
正删除 libavcodec/mpegaudiodecheader.o
正删除 libavcodec/mpegaudiodsp.d
正删除 libavcodec/mpegaudiodsp.o
正删除 libavcodec/mpegaudiodsp_data.d
正删除 libavcodec/mpegaudiodsp_data.o
正删除 libavcodec/mpegaudiodsp_fixed.d
正删除 libavcodec/mpegaudiodsp_fixed.o
正删除 libavcodec/mpegaudiodsp_float.d
正删除 libavcodec/mpegaudiodsp_float.o
正删除 libavcodec/mpegpicture.d
正删除 libavcodec/mpegpicture.o
正删除 libavcodec/mpegutils.d
正删除 libavcodec/mpegutils.o
正删除 libavcodec/mpegvideo.d
正删除 libavcodec/mpegvideo.o
正删除 libavcodec/mpegvideo_motion.d
正删除 libavcodec/mpegvideo_motion.o
正删除 libavcodec/mpegvideodata.d
正删除 libavcodec/mpegvideodata.o
正删除 libavcodec/mpegvideodsp.d
正删除 libavcodec/mpegvideodsp.o
正删除 libavcodec/noise_bsf.d
正删除 libavcodec/noise_bsf.o
正删除 libavcodec/options.d
正删除 libavcodec/options.o
正删除 libavcodec/parser.d
正删除 libavcodec/parser.o
正删除 libavcodec/pixblockdsp.d
正删除 libavcodec/pixblockdsp.o
正删除 libavcodec/pthread.d
正删除 libavcodec/pthread.o
正删除 libavcodec/pthread_frame.d
正删除 libavcodec/pthread_frame.o
正删除 libavcodec/pthread_slice.d
正删除 libavcodec/pthread_slice.o
正删除 libavcodec/qpeldsp.d
正删除 libavcodec/qpeldsp.o
正删除 libavcodec/qsv_api.d
正删除 libavcodec/qsv_api.o
正删除 libavcodec/raw.d
正删除 libavcodec/raw.o
正删除 libavcodec/rdft.d
正删除 libavcodec/rdft.o
正删除 libavcodec/remove_extradata_bsf.d
正删除 libavcodec/remove_extradata_bsf.o
正删除 libavcodec/resample.d
正删除 libavcodec/resample.o
正删除 libavcodec/resample2.d
正删除 libavcodec/resample2.o
正删除 libavcodec/rl.d
正删除 libavcodec/rl.o
正删除 libavcodec/sbrdsp.d
正删除 libavcodec/sbrdsp.o
正删除 libavcodec/simple_idct.d
正删除 libavcodec/simple_idct.o
正删除 libavcodec/sinewin.d
正删除 libavcodec/sinewin.o
正删除 libavcodec/sinewin_fixed.d
正删除 libavcodec/sinewin_fixed.o
正删除 libavcodec/startcode.d
正删除 libavcodec/startcode.o
正删除 libavcodec/utils.d
正删除 libavcodec/utils.o
正删除 libavcodec/videodsp.d
正删除 libavcodec/videodsp.o
正删除 libavcodec/vorbis_parser.d
正删除 libavcodec/vorbis_parser.o
正删除 libavcodec/vp3dsp.d
正删除 libavcodec/vp3dsp.o
正删除 libavcodec/vp56.d
正删除 libavcodec/vp56.o
正删除 libavcodec/vp56data.d
正删除 libavcodec/vp56data.o
正删除 libavcodec/vp56dsp.d
正删除 libavcodec/vp56dsp.o
正删除 libavcodec/vp56rac.d
正删除 libavcodec/vp56rac.o
正删除 libavcodec/vp6.d
正删除 libavcodec/vp6.o
正删除 libavcodec/vp6dsp.d
正删除 libavcodec/vp6dsp.o
正删除 libavcodec/xiph.d
正删除 libavcodec/xiph.o
正删除 libavfilter/aeval.d
正删除 libavfilter/aeval.o
正删除 libavfilter/af_adelay.d
正删除 libavfilter/af_adelay.o
正删除 libavfilter/af_aecho.d
正删除 libavfilter/af_aecho.o
正删除 libavfilter/af_afade.d
正删除 libavfilter/af_afade.o
正删除 libavfilter/af_aformat.d
正删除 libavfilter/af_aformat.o
正删除 libavfilter/af_amerge.d
正删除 libavfilter/af_amerge.o
正删除 libavfilter/af_amix.d
正删除 libavfilter/af_amix.o
正删除 libavfilter/af_anull.d
正删除 libavfilter/af_anull.o
正删除 libavfilter/af_apad.d
正删除 libavfilter/af_apad.o
正删除 libavfilter/af_aphaser.d
正删除 libavfilter/af_aphaser.o
正删除 libavfilter/af_aresample.d
正删除 libavfilter/af_aresample.o
正删除 libavfilter/af_asetnsamples.d
正删除 libavfilter/af_asetnsamples.o
正删除 libavfilter/af_asetrate.d
正删除 libavfilter/af_asetrate.o
正删除 libavfilter/af_ashowinfo.d
正删除 libavfilter/af_ashowinfo.o
正删除 libavfilter/af_astats.d
正删除 libavfilter/af_astats.o
正删除 libavfilter/af_astreamsync.d
正删除 libavfilter/af_astreamsync.o
正删除 libavfilter/af_atempo.d
正删除 libavfilter/af_atempo.o
正删除 libavfilter/af_biquads.d
正删除 libavfilter/af_biquads.o
正删除 libavfilter/af_channelmap.d
正删除 libavfilter/af_channelmap.o
正删除 libavfilter/af_channelsplit.d
正删除 libavfilter/af_channelsplit.o
正删除 libavfilter/af_chorus.d
正删除 libavfilter/af_chorus.o
正删除 libavfilter/af_compand.d
正删除 libavfilter/af_compand.o
正删除 libavfilter/af_dcshift.d
正删除 libavfilter/af_dcshift.o
正删除 libavfilter/af_dynaudnorm.d
正删除 libavfilter/af_dynaudnorm.o
正删除 libavfilter/af_earwax.d
正删除 libavfilter/af_earwax.o
正删除 libavfilter/af_flanger.d
正删除 libavfilter/af_flanger.o
正删除 libavfilter/af_join.d
正删除 libavfilter/af_join.o
正删除 libavfilter/af_pan.d
正删除 libavfilter/af_pan.o
正删除 libavfilter/af_replaygain.d
正删除 libavfilter/af_replaygain.o
正删除 libavfilter/af_sidechaincompress.d
正删除 libavfilter/af_sidechaincompress.o
正删除 libavfilter/af_silencedetect.d
正删除 libavfilter/af_silencedetect.o
正删除 libavfilter/af_silenceremove.d
正删除 libavfilter/af_silenceremove.o
正删除 libavfilter/af_volume.d
正删除 libavfilter/af_volume.o
正删除 libavfilter/af_volumedetect.d
正删除 libavfilter/af_volumedetect.o
正删除 libavfilter/allfilters.d
正删除 libavfilter/allfilters.o
正删除 libavfilter/asink_anullsink.d
正删除 libavfilter/asink_anullsink.o
正删除 libavfilter/asrc_anullsrc.d
正删除 libavfilter/asrc_anullsrc.o
正删除 libavfilter/asrc_sine.d
正删除 libavfilter/asrc_sine.o
正删除 libavfilter/audio.d
正删除 libavfilter/audio.o
正删除 libavfilter/avcodec.d
正删除 libavfilter/avcodec.o
正删除 libavfilter/avf_aphasemeter.d
正删除 libavfilter/avf_aphasemeter.o
正删除 libavfilter/avf_avectorscope.d
正删除 libavfilter/avf_avectorscope.o
正删除 libavfilter/avf_concat.d
正删除 libavfilter/avf_concat.o
正删除 libavfilter/avf_showcqt.d
正删除 libavfilter/avf_showcqt.o
正删除 libavfilter/avf_showfreqs.d
正删除 libavfilter/avf_showfreqs.o
正删除 libavfilter/avf_showspectrum.d
正删除 libavfilter/avf_showspectrum.o
正删除 libavfilter/avf_showvolume.d
正删除 libavfilter/avf_showvolume.o
正删除 libavfilter/avf_showwaves.d
正删除 libavfilter/avf_showwaves.o
正删除 libavfilter/avfilter.d
正删除 libavfilter/avfilter.o
正删除 libavfilter/avfiltergraph.d
正删除 libavfilter/avfiltergraph.o
正删除 libavfilter/bbox.d
正删除 libavfilter/bbox.o
正删除 libavfilter/buffer.d
正删除 libavfilter/buffer.o
正删除 libavfilter/buffersink.d
正删除 libavfilter/buffersink.o
正删除 libavfilter/buffersrc.d
正删除 libavfilter/buffersrc.o
正删除 libavfilter/drawutils.d
正删除 libavfilter/drawutils.o
正删除 libavfilter/dualinput.d
正删除 libavfilter/dualinput.o
正删除 libavfilter/f_drawgraph.d
正删除 libavfilter/f_drawgraph.o
正删除 libavfilter/f_interleave.d
正删除 libavfilter/f_interleave.o
正删除 libavfilter/f_perms.d
正删除 libavfilter/f_perms.o
正删除 libavfilter/f_reverse.d
正删除 libavfilter/f_reverse.o
正删除 libavfilter/f_select.d
正删除 libavfilter/f_select.o
正删除 libavfilter/f_sendcmd.d
正删除 libavfilter/f_sendcmd.o
正删除 libavfilter/fifo.d
正删除 libavfilter/fifo.o
正删除 libavfilter/formats.d
正删除 libavfilter/formats.o
正删除 libavfilter/framesync.d
正删除 libavfilter/framesync.o
正删除 libavfilter/generate_wave_table.d
正删除 libavfilter/generate_wave_table.o
正删除 libavfilter/graphdump.d
正删除 libavfilter/graphdump.o
正删除 libavfilter/graphparser.d
正删除 libavfilter/graphparser.o
正删除 libavfilter/lavfutils.d
正删除 libavfilter/lavfutils.o
正删除 libavfilter/libavfilter.a
正删除 libavfilter/libavfilter.pc
正删除 libavfilter/lswsutils.d
正删除 libavfilter/lswsutils.o
正删除 libavfilter/opencl_allkernels.d
正删除 libavfilter/opencl_allkernels.o
正删除 libavfilter/pthread.d
正删除 libavfilter/pthread.o
正删除 libavfilter/setpts.d
正删除 libavfilter/setpts.o
正删除 libavfilter/settb.d
正删除 libavfilter/settb.o
正删除 libavfilter/split.d
正删除 libavfilter/split.o
正删除 libavfilter/src_movie.d
正删除 libavfilter/src_movie.o
正删除 libavfilter/transform.d
正删除 libavfilter/transform.o
正删除 libavfilter/trim.d
正删除 libavfilter/trim.o
正删除 libavfilter/vf_alphamerge.d
正删除 libavfilter/vf_alphamerge.o
正删除 libavfilter/vf_aspect.d
正删除 libavfilter/vf_aspect.o
正删除 libavfilter/vf_atadenoise.d
正删除 libavfilter/vf_atadenoise.o
正删除 libavfilter/vf_bbox.d
正删除 libavfilter/vf_bbox.o
正删除 libavfilter/vf_blackdetect.d
正删除 libavfilter/vf_blackdetect.o
正删除 libavfilter/vf_blend.d
正删除 libavfilter/vf_blend.o
正删除 libavfilter/vf_codecview.d
正删除 libavfilter/vf_codecview.o
正删除 libavfilter/vf_colorbalance.d
正删除 libavfilter/vf_colorbalance.o
正删除 libavfilter/vf_colorchannelmixer.d
正删除 libavfilter/vf_colorchannelmixer.o
正删除 libavfilter/vf_colorkey.d
正删除 libavfilter/vf_colorkey.o
正删除 libavfilter/vf_colorlevels.d
正删除 libavfilter/vf_colorlevels.o
正删除 libavfilter/vf_copy.d
正删除 libavfilter/vf_copy.o
正删除 libavfilter/vf_crop.d
正删除 libavfilter/vf_crop.o
正删除 libavfilter/vf_curves.d
正删除 libavfilter/vf_curves.o
正删除 libavfilter/vf_dctdnoiz.d
正删除 libavfilter/vf_dctdnoiz.o
正删除 libavfilter/vf_deband.d
正删除 libavfilter/vf_deband.o
正删除 libavfilter/vf_decimate.d
正删除 libavfilter/vf_decimate.o
正删除 libavfilter/vf_dejudder.d
正删除 libavfilter/vf_dejudder.o
正删除 libavfilter/vf_deshake.d
正删除 libavfilter/vf_deshake.o
正删除 libavfilter/vf_detelecine.d
正删除 libavfilter/vf_detelecine.o
正删除 libavfilter/vf_drawbox.d
正删除 libavfilter/vf_drawbox.o
正删除 libavfilter/vf_edgedetect.d
正删除 libavfilter/vf_edgedetect.o
正删除 libavfilter/vf_elbg.d
正删除 libavfilter/vf_elbg.o
正删除 libavfilter/vf_extractplanes.d
正删除 libavfilter/vf_extractplanes.o
正删除 libavfilter/vf_fade.d
正删除 libavfilter/vf_fade.o
正删除 libavfilter/vf_fftfilt.d
正删除 libavfilter/vf_fftfilt.o
正删除 libavfilter/vf_field.d
正删除 libavfilter/vf_field.o
正删除 libavfilter/vf_fieldmatch.d
正删除 libavfilter/vf_fieldmatch.o
正删除 libavfilter/vf_fieldorder.d
正删除 libavfilter/vf_fieldorder.o
正删除 libavfilter/vf_format.d
正删除 libavfilter/vf_format.o
正删除 libavfilter/vf_fps.d
正删除 libavfilter/vf_fps.o
正删除 libavfilter/vf_framepack.d
正删除 libavfilter/vf_framepack.o
正删除 libavfilter/vf_framerate.d
正删除 libavfilter/vf_framerate.o
正删除 libavfilter/vf_framestep.d
正删除 libavfilter/vf_framestep.o
正删除 libavfilter/vf_gradfun.d
正删除 libavfilter/vf_gradfun.o
正删除 libavfilter/vf_hflip.d
正删除 libavfilter/vf_hflip.o
正删除 libavfilter/vf_histogram.d
正删除 libavfilter/vf_histogram.o
正删除 libavfilter/vf_hqx.d
正删除 libavfilter/vf_hqx.o
正删除 libavfilter/vf_hue.d
正删除 libavfilter/vf_hue.o
正删除 libavfilter/vf_idet.d
正删除 libavfilter/vf_idet.o
正删除 libavfilter/vf_il.d
正删除 libavfilter/vf_il.o
正删除 libavfilter/vf_lenscorrection.d
正删除 libavfilter/vf_lenscorrection.o
正删除 libavfilter/vf_lut.d
正删除 libavfilter/vf_lut.o
正删除 libavfilter/vf_lut3d.d
正删除 libavfilter/vf_lut3d.o
正删除 libavfilter/vf_mergeplanes.d
正删除 libavfilter/vf_mergeplanes.o
正删除 libavfilter/vf_neighbor.d
正删除 libavfilter/vf_neighbor.o
正删除 libavfilter/vf_noise.d
正删除 libavfilter/vf_noise.o
正删除 libavfilter/vf_null.d
正删除 libavfilter/vf_null.o
正删除 libavfilter/vf_overlay.d
正删除 libavfilter/vf_overlay.o
正删除 libavfilter/vf_pad.d
正删除 libavfilter/vf_pad.o
正删除 libavfilter/vf_palettegen.d
正删除 libavfilter/vf_palettegen.o
正删除 libavfilter/vf_paletteuse.d
正删除 libavfilter/vf_paletteuse.o
正删除 libavfilter/vf_pixdesctest.d
正删除 libavfilter/vf_pixdesctest.o
正删除 libavfilter/vf_psnr.d
正删除 libavfilter/vf_psnr.o
正删除 libavfilter/vf_qp.d
正删除 libavfilter/vf_qp.o
正删除 libavfilter/vf_random.d
正删除 libavfilter/vf_random.o
正删除 libavfilter/vf_removegrain.d
正删除 libavfilter/vf_removegrain.o
正删除 libavfilter/vf_removelogo.d
正删除 libavfilter/vf_removelogo.o
正删除 libavfilter/vf_rotate.d
正删除 libavfilter/vf_rotate.o
正删除 libavfilter/vf_scale.d
正删除 libavfilter/vf_scale.o
正删除 libavfilter/vf_separatefields.d
正删除 libavfilter/vf_separatefields.o
正删除 libavfilter/vf_setfield.d
正删除 libavfilter/vf_setfield.o
正删除 libavfilter/vf_showinfo.d
正删除 libavfilter/vf_showinfo.o
正删除 libavfilter/vf_showpalette.d
正删除 libavfilter/vf_showpalette.o
正删除 libavfilter/vf_shuffleplanes.d
正删除 libavfilter/vf_shuffleplanes.o
正删除 libavfilter/vf_signalstats.d
正删除 libavfilter/vf_signalstats.o
正删除 libavfilter/vf_ssim.d
正删除 libavfilter/vf_ssim.o
正删除 libavfilter/vf_stack.d
正删除 libavfilter/vf_stack.o
正删除 libavfilter/vf_swapuv.d
正删除 libavfilter/vf_swapuv.o
正删除 libavfilter/vf_telecine.d
正删除 libavfilter/vf_telecine.o
正删除 libavfilter/vf_thumbnail.d
正删除 libavfilter/vf_thumbnail.o
正删除 libavfilter/vf_tile.d
正删除 libavfilter/vf_tile.o
正删除 libavfilter/vf_transpose.d
正删除 libavfilter/vf_transpose.o
正删除 libavfilter/vf_unsharp.d
正删除 libavfilter/vf_unsharp.o
正删除 libavfilter/vf_vectorscope.d
正删除 libavfilter/vf_vectorscope.o
正删除 libavfilter/vf_vflip.d
正删除 libavfilter/vf_vflip.o
正删除 libavfilter/vf_vignette.d
正删除 libavfilter/vf_vignette.o
正删除 libavfilter/vf_w3fdif.d
正删除 libavfilter/vf_w3fdif.o
正删除 libavfilter/vf_waveform.d
正删除 libavfilter/vf_waveform.o
正删除 libavfilter/vf_xbr.d
正删除 libavfilter/vf_xbr.o
正删除 libavfilter/vf_yadif.d
正删除 libavfilter/vf_yadif.o
正删除 libavfilter/vf_zoompan.d
正删除 libavfilter/vf_zoompan.o
正删除 libavfilter/video.d
正删除 libavfilter/video.o
正删除 libavfilter/vsink_nullsink.d
正删除 libavfilter/vsink_nullsink.o
正删除 libavfilter/vsrc_cellauto.d
正删除 libavfilter/vsrc_cellauto.o
正删除 libavfilter/vsrc_life.d
正删除 libavfilter/vsrc_life.o
正删除 libavfilter/vsrc_mandelbrot.d
正删除 libavfilter/vsrc_mandelbrot.o
正删除 libavfilter/vsrc_testsrc.d
正删除 libavfilter/vsrc_testsrc.o
正删除 libavformat/aacdec.d
正删除 libavformat/aacdec.o
正删除 libavformat/adtsenc.d
正删除 libavformat/adtsenc.o
正删除 libavformat/allformats.d
正删除 libavformat/allformats.o
正删除 libavformat/apetag.d
正删除 libavformat/apetag.o
正删除 libavformat/avc.d
正删除 libavformat/avc.o
正删除 libavformat/avio.d
正删除 libavformat/avio.o
正删除 libavformat/aviobuf.d
正删除 libavformat/aviobuf.o
正删除 libavformat/cache.d
正删除 libavformat/cache.o
正删除 libavformat/concat.d
正删除 libavformat/concat.o
正删除 libavformat/concatdec.d
正删除 libavformat/concatdec.o
正删除 libavformat/crypto.d
正删除 libavformat/crypto.o
正删除 libavformat/cutils.d
正删除 libavformat/cutils.o
正删除 libavformat/data_uri.d
正删除 libavformat/data_uri.o
正删除 libavformat/dump.d
正删除 libavformat/dump.o
正删除 libavformat/file.d
正删除 libavformat/file.o
正删除 libavformat/flvdec.d
正删除 libavformat/flvdec.o
正删除 libavformat/format.d
正删除 libavformat/format.o
正删除 libavformat/ftp.d
正删除 libavformat/ftp.o
正删除 libavformat/hevc.d
正删除 libavformat/hevc.o
正删除 libavformat/hls.d
正删除 libavformat/hls.o
正删除 libavformat/hlsproto.d
正删除 libavformat/hlsproto.o
正删除 libavformat/http.d
正删除 libavformat/http.o
正删除 libavformat/httpauth.d
正删除 libavformat/httpauth.o
正删除 libavformat/icecast.d
正删除 libavformat/icecast.o
正删除 libavformat/id3v1.d
正删除 libavformat/id3v1.o
正删除 libavformat/id3v2.d
正删除 libavformat/id3v2.o
正删除 libavformat/id3v2enc.d
正删除 libavformat/id3v2enc.o
正删除 libavformat/img2.d
正删除 libavformat/img2.o
正删除 libavformat/isom.d
正删除 libavformat/isom.o
正删除 libavformat/latmenc.d
正删除 libavformat/latmenc.o
正删除 libavformat/libavformat.a
正删除 libavformat/libavformat.pc
正删除 libavformat/loasdec.d
正删除 libavformat/loasdec.o
正删除 libavformat/m4vdec.d
正删除 libavformat/m4vdec.o
正删除 libavformat/md5proto.d
正删除 libavformat/md5proto.o
正删除 libavformat/metadata.d
正删除 libavformat/metadata.o
正删除 libavformat/mov.d
正删除 libavformat/mov.o
正删除 libavformat/mov_chan.d
正删除 libavformat/mov_chan.o
正删除 libavformat/movenc.d
正删除 libavformat/movenc.o
正删除 libavformat/movenchint.d
正删除 libavformat/movenchint.o
正删除 libavformat/mp3dec.d
正删除 libavformat/mp3dec.o
正删除 libavformat/mpeg.d
正删除 libavformat/mpeg.o
正删除 libavformat/mpegts.d
正删除 libavformat/mpegts.o
正删除 libavformat/mpegtsenc.d
正删除 libavformat/mpegtsenc.o
正删除 libavformat/mpegvideodec.d
正删除 libavformat/mpegvideodec.o
正删除 libavformat/mux.d
正删除 libavformat/mux.o
正删除 libavformat/network.d
正删除 libavformat/network.o
正删除 libavformat/options.d
正删除 libavformat/options.o
正删除 libavformat/os_support.d
正删除 libavformat/os_support.o
正删除 libavformat/rawdec.d
正删除 libavformat/rawdec.o
正删除 libavformat/rawenc.d
正删除 libavformat/rawenc.o
正删除 libavformat/replaygain.d
正删除 libavformat/replaygain.o
正删除 libavformat/riff.d
正删除 libavformat/riff.o
正删除 libavformat/riffdec.d
正删除 libavformat/riffdec.o
正删除 libavformat/riffenc.d
正删除 libavformat/riffenc.o
正删除 libavformat/rtmphttp.d
正删除 libavformat/rtmphttp.o
正删除 libavformat/rtmppkt.d
正删除 libavformat/rtmppkt.o
正删除 libavformat/rtmpproto.d
正删除 libavformat/rtmpproto.o
正删除 libavformat/rtp.d
正删除 libavformat/rtp.o
正删除 libavformat/rtpenc_chain.d
正删除 libavformat/rtpenc_chain.o
正删除 libavformat/sdp.d
正删除 libavformat/sdp.o
正删除 libavformat/subfile.d
正删除 libavformat/subfile.o
正删除 libavformat/tcp.d
正删除 libavformat/tcp.o
正删除 libavformat/udp.d
正删除 libavformat/udp.o
正删除 libavformat/url.d
正删除 libavformat/url.o
正删除 libavformat/urldecode.d
正删除 libavformat/urldecode.o
正删除 libavformat/utils.d
正删除 libavformat/utils.o
正删除 libavutil/adler32.d
正删除 libavutil/adler32.o
正删除 libavutil/aes.d
正删除 libavutil/aes.o
正删除 libavutil/arm/cpu.d
正删除 libavutil/arm/cpu.o
正删除 libavutil/arm/float_dsp_init_arm.d
正删除 libavutil/arm/float_dsp_init_arm.o
正删除 libavutil/arm/float_dsp_init_neon.d
正删除 libavutil/arm/float_dsp_init_neon.o
正删除 libavutil/arm/float_dsp_init_vfp.d
正删除 libavutil/arm/float_dsp_init_vfp.o
正删除 libavutil/arm/float_dsp_neon.d
正删除 libavutil/arm/float_dsp_neon.o
正删除 libavutil/arm/float_dsp_vfp.d
正删除 libavutil/arm/float_dsp_vfp.o
正删除 libavutil/audio_fifo.d
正删除 libavutil/audio_fifo.o
正删除 libavutil/avconfig.h
正删除 libavutil/avstring.d
正删除 libavutil/avstring.o
正删除 libavutil/base64.d
正删除 libavutil/base64.o
正删除 libavutil/blowfish.d
正删除 libavutil/blowfish.o
正删除 libavutil/bprint.d
正删除 libavutil/bprint.o
正删除 libavutil/buffer.d
正删除 libavutil/buffer.o
正删除 libavutil/camellia.d
正删除 libavutil/camellia.o
正删除 libavutil/cast5.d
正删除 libavutil/cast5.o
正删除 libavutil/channel_layout.d
正删除 libavutil/channel_layout.o
正删除 libavutil/color_utils.d
正删除 libavutil/color_utils.o
正删除 libavutil/cpu.d
正删除 libavutil/cpu.o
正删除 libavutil/crc.d
正删除 libavutil/crc.o
正删除 libavutil/des.d
正删除 libavutil/des.o
正删除 libavutil/dict.d
正删除 libavutil/dict.o
正删除 libavutil/display.d
正删除 libavutil/display.o
正删除 libavutil/downmix_info.d
正删除 libavutil/downmix_info.o
正删除 libavutil/error.d
正删除 libavutil/error.o
正删除 libavutil/eval.d
正删除 libavutil/eval.o
正删除 libavutil/ffversion.h
正删除 libavutil/fifo.d
正删除 libavutil/fifo.o
正删除 libavutil/file.d
正删除 libavutil/file.o
正删除 libavutil/file_open.d
正删除 libavutil/file_open.o
正删除 libavutil/fixed_dsp.d
正删除 libavutil/fixed_dsp.o
正删除 libavutil/float_dsp.d
正删除 libavutil/float_dsp.o
正删除 libavutil/frame.d
正删除 libavutil/frame.o
正删除 libavutil/hash.d
正删除 libavutil/hash.o
正删除 libavutil/hmac.d
正删除 libavutil/hmac.o
正删除 libavutil/imgutils.d
正删除 libavutil/imgutils.o
正删除 libavutil/intmath.d
正删除 libavutil/intmath.o
正删除 libavutil/lfg.d
正删除 libavutil/lfg.o
正删除 libavutil/libavutil.a
正删除 libavutil/libavutil.pc
正删除 libavutil/lls.d
正删除 libavutil/lls.o
正删除 libavutil/log.d
正删除 libavutil/log.o
正删除 libavutil/log2_tab.d
正删除 libavutil/log2_tab.o
正删除 libavutil/mathematics.d
正删除 libavutil/mathematics.o
正删除 libavutil/md5.d
正删除 libavutil/md5.o
正删除 libavutil/mem.d
正删除 libavutil/mem.o
正删除 libavutil/murmur3.d
正删除 libavutil/murmur3.o
正删除 libavutil/opt.d
正删除 libavutil/opt.o
正删除 libavutil/parseutils.d
正删除 libavutil/parseutils.o
正删除 libavutil/pixdesc.d
正删除 libavutil/pixdesc.o
正删除 libavutil/pixelutils.d
正删除 libavutil/pixelutils.o
正删除 libavutil/random_seed.d
正删除 libavutil/random_seed.o
正删除 libavutil/rational.d
正删除 libavutil/rational.o
正删除 libavutil/rc4.d
正删除 libavutil/rc4.o
正删除 libavutil/reverse.d
正删除 libavutil/reverse.o
正删除 libavutil/ripemd.d
正删除 libavutil/ripemd.o
正删除 libavutil/samplefmt.d
正删除 libavutil/samplefmt.o
正删除 libavutil/sha.d
正删除 libavutil/sha.o
正删除 libavutil/sha512.d
正删除 libavutil/sha512.o
正删除 libavutil/stereo3d.d
正删除 libavutil/stereo3d.o
正删除 libavutil/tea.d
正删除 libavutil/tea.o
正删除 libavutil/threadmessage.d
正删除 libavutil/threadmessage.o
正删除 libavutil/time.d
正删除 libavutil/time.o
正删除 libavutil/timecode.d
正删除 libavutil/timecode.o
正删除 libavutil/tree.d
正删除 libavutil/tree.o
正删除 libavutil/twofish.d
正删除 libavutil/twofish.o
正删除 libavutil/utils.d
正删除 libavutil/utils.o
正删除 libavutil/xga_font_data.d
正删除 libavutil/xga_font_data.o
正删除 libavutil/xtea.d
正删除 libavutil/xtea.o
正删除 libswresample/arm/audio_convert_init.d
正删除 libswresample/arm/audio_convert_init.o
正删除 libswresample/arm/audio_convert_neon.d
正删除 libswresample/arm/audio_convert_neon.o
正删除 libswresample/audioconvert.d
正删除 libswresample/audioconvert.o
正删除 libswresample/dither.d
正删除 libswresample/dither.o
正删除 libswresample/libswresample.a
正删除 libswresample/libswresample.pc
正删除 libswresample/options.d
正删除 libswresample/options.o
正删除 libswresample/rematrix.d
正删除 libswresample/rematrix.o
正删除 libswresample/resample.d
正删除 libswresample/resample.o
正删除 libswresample/resample_dsp.d
正删除 libswresample/resample_dsp.o
正删除 libswresample/swresample.d
正删除 libswresample/swresample.o
正删除 libswresample/swresample_frame.d
正删除 libswresample/swresample_frame.o
正删除 libswscale/alphablend.d
正删除 libswscale/alphablend.o
正删除 libswscale/gamma.d
正删除 libswscale/gamma.o
正删除 libswscale/hscale.d
正删除 libswscale/hscale.o
正删除 libswscale/hscale_fast_bilinear.d
正删除 libswscale/hscale_fast_bilinear.o
正删除 libswscale/input.d
正删除 libswscale/input.o
正删除 libswscale/libswscale.a
正删除 libswscale/libswscale.pc
正删除 libswscale/options.d
正删除 libswscale/options.o
正删除 libswscale/output.d
正删除 libswscale/output.o
正删除 libswscale/rgb2rgb.d
正删除 libswscale/rgb2rgb.o
正删除 libswscale/slice.d
正删除 libswscale/slice.o
正删除 libswscale/swscale.d
正删除 libswscale/swscale.o
正删除 libswscale/swscale_unscaled.d
正删除 libswscale/swscale_unscaled.o
正删除 libswscale/utils.d
正删除 libswscale/utils.o
正删除 libswscale/vscale.d
正删除 libswscale/vscale.o
正删除 libswscale/yuv2rgb.d
正删除 libswscale/yuv2rgb.o
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/contrib
正删除 .config
正删除 .version
正删除 compat/strtod.d
正删除 compat/strtod.o
正删除 config.asm
正删除 config.fate
正删除 config.h
正删除 config.log
正删除 config.mak
正删除 doc/config.texi
正删除 doc/examples/pc-uninstalled/
正删除 libavcodec/aac_ac3_parser.d
正删除 libavcodec/aac_ac3_parser.o
正删除 libavcodec/aac_adtstoasc_bsf.d
正删除 libavcodec/aac_adtstoasc_bsf.o
正删除 libavcodec/aac_parser.d
正删除 libavcodec/aac_parser.o
正删除 libavcodec/aacadtsdec.d
正删除 libavcodec/aacadtsdec.o
正删除 libavcodec/aacdec.d
正删除 libavcodec/aacdec.o
正删除 libavcodec/aacps_float.d
正删除 libavcodec/aacps_float.o
正删除 libavcodec/aacpsdsp_float.d
正删除 libavcodec/aacpsdsp_float.o
正删除 libavcodec/aacsbr.d
正删除 libavcodec/aacsbr.o
正删除 libavcodec/aactab.d
正删除 libavcodec/aactab.o
正删除 libavcodec/ac3tab.d
正删除 libavcodec/ac3tab.o
正删除 libavcodec/allcodecs.d
正删除 libavcodec/allcodecs.o
正删除 libavcodec/audioconvert.d
正删除 libavcodec/audioconvert.o
正删除 libavcodec/avdct.d
正删除 libavcodec/avdct.o
正删除 libavcodec/avfft.d
正删除 libavcodec/avfft.o
正删除 libavcodec/avpacket.d
正删除 libavcodec/avpacket.o
正删除 libavcodec/avpicture.d
正删除 libavcodec/avpicture.o
正删除 libavcodec/bitstream.d
正删除 libavcodec/bitstream.o
正删除 libavcodec/bitstream_filter.d
正删除 libavcodec/bitstream_filter.o
正删除 libavcodec/blockdsp.d
正删除 libavcodec/blockdsp.o
正删除 libavcodec/cabac.d
正删除 libavcodec/cabac.o
正删除 libavcodec/chomp_bsf.d
正删除 libavcodec/chomp_bsf.o
正删除 libavcodec/codec_desc.d
正删除 libavcodec/codec_desc.o
正删除 libavcodec/dct.d
正删除 libavcodec/dct.o
正删除 libavcodec/dct32_fixed.d
正删除 libavcodec/dct32_fixed.o
正删除 libavcodec/dct32_float.d
正删除 libavcodec/dct32_float.o
正删除 libavcodec/dump_extradata_bsf.d
正删除 libavcodec/dump_extradata_bsf.o
正删除 libavcodec/dv_profile.d
正删除 libavcodec/dv_profile.o
正删除 libavcodec/elbg.d
正删除 libavcodec/elbg.o
正删除 libavcodec/error_resilience.d
正删除 libavcodec/error_resilience.o
正删除 libavcodec/faandct.d
正删除 libavcodec/faandct.o
正删除 libavcodec/faanidct.d
正删除 libavcodec/faanidct.o
正删除 libavcodec/fdctdsp.d
正删除 libavcodec/fdctdsp.o
正删除 libavcodec/fft_fixed.d
正删除 libavcodec/fft_fixed.o
正删除 libavcodec/fft_fixed_32.d
正删除 libavcodec/fft_fixed_32.o
正删除 libavcodec/fft_float.d
正删除 libavcodec/fft_float.o
正删除 libavcodec/fft_init_table.d
正删除 libavcodec/fft_init_table.o
正删除 libavcodec/flvdec.d
正删除 libavcodec/flvdec.o
正删除 libavcodec/golomb.d
正删除 libavcodec/golomb.o
正删除 libavcodec/h263.d
正删除 libavcodec/h263.o
正删除 libavcodec/h263_parser.d
正删除 libavcodec/h263_parser.o
正删除 libavcodec/h263data.d
正删除 libavcodec/h263data.o
正删除 libavcodec/h263dec.d
正删除 libavcodec/h263dec.o
正删除 libavcodec/h263dsp.d
正删除 libavcodec/h263dsp.o
正删除 libavcodec/h264.d
正删除 libavcodec/h264.o
正删除 libavcodec/h264_cabac.d
正删除 libavcodec/h264_cabac.o
正删除 libavcodec/h264_cavlc.d
正删除 libavcodec/h264_cavlc.o
正删除 libavcodec/h264_direct.d
正删除 libavcodec/h264_direct.o
正删除 libavcodec/h264_loopfilter.d
正删除 libavcodec/h264_loopfilter.o
正删除 libavcodec/h264_mb.d
正删除 libavcodec/h264_mb.o
正删除 libavcodec/h264_mp4toannexb_bsf.d
正删除 libavcodec/h264_mp4toannexb_bsf.o
正删除 libavcodec/h264_parser.d
正删除 libavcodec/h264_parser.o
正删除 libavcodec/h264_picture.d
正删除 libavcodec/h264_picture.o
正删除 libavcodec/h264_ps.d
正删除 libavcodec/h264_ps.o
正删除 libavcodec/h264_refs.d
正删除 libavcodec/h264_refs.o
正删除 libavcodec/h264_sei.d
正删除 libavcodec/h264_sei.o
正删除 libavcodec/h264_slice.d
正删除 libavcodec/h264_slice.o
正删除 libavcodec/h264chroma.d
正删除 libavcodec/h264chroma.o
正删除 libavcodec/h264dsp.d
正删除 libavcodec/h264dsp.o
正删除 libavcodec/h264idct.d
正删除 libavcodec/h264idct.o
正删除 libavcodec/h264pred.d
正删除 libavcodec/h264pred.o
正删除 libavcodec/h264qpel.d
正删除 libavcodec/h264qpel.o
正删除 libavcodec/hevc_mp4toannexb_bsf.d
正删除 libavcodec/hevc_mp4toannexb_bsf.o
正删除 libavcodec/hpeldsp.d
正删除 libavcodec/hpeldsp.o
正删除 libavcodec/huffman.d
正删除 libavcodec/huffman.o
正删除 libavcodec/idctdsp.d
正删除 libavcodec/idctdsp.o
正删除 libavcodec/imdct15.d
正删除 libavcodec/imdct15.o
正删除 libavcodec/imgconvert.d
正删除 libavcodec/imgconvert.o
正删除 libavcodec/imx_dump_header_bsf.d
正删除 libavcodec/imx_dump_header_bsf.o
正删除 libavcodec/intelh263dec.d
正删除 libavcodec/intelh263dec.o
正删除 libavcodec/ituh263dec.d
正删除 libavcodec/ituh263dec.o
正删除 libavcodec/jfdctfst.d
正删除 libavcodec/jfdctfst.o
正删除 libavcodec/jfdctint.d
正删除 libavcodec/jfdctint.o
正删除 libavcodec/jrevdct.d
正删除 libavcodec/jrevdct.o
正删除 libavcodec/kbdwin.d
正删除 libavcodec/kbdwin.o
正删除 libavcodec/latm_parser.d
正删除 libavcodec/latm_parser.o
正删除 libavcodec/libavcodec.a
正删除 libavcodec/libavcodec.pc
正删除 libavcodec/mathtables.d
正删除 libavcodec/mathtables.o
正删除 libavcodec/mdct_fixed.d
正删除 libavcodec/mdct_fixed.o
正删除 libavcodec/mdct_fixed_32.d
正删除 libavcodec/mdct_fixed_32.o
正删除 libavcodec/mdct_float.d
正删除 libavcodec/mdct_float.o
正删除 libavcodec/me_cmp.d
正删除 libavcodec/me_cmp.o
正删除 libavcodec/mp3_header_decompress_bsf.d
正删除 libavcodec/mp3_header_decompress_bsf.o
正删除 libavcodec/mpeg4_unpack_bframes_bsf.d
正删除 libavcodec/mpeg4_unpack_bframes_bsf.o
正删除 libavcodec/mpeg4audio.d
正删除 libavcodec/mpeg4audio.o
正删除 libavcodec/mpeg4video.d
正删除 libavcodec/mpeg4video.o
正删除 libavcodec/mpeg4videodec.d
正删除 libavcodec/mpeg4videodec.o
正删除 libavcodec/mpeg_er.d
正删除 libavcodec/mpeg_er.o
正删除 libavcodec/mpegaudio.d
正删除 libavcodec/mpegaudio.o
正删除 libavcodec/mpegaudio_parser.d
正删除 libavcodec/mpegaudio_parser.o
正删除 libavcodec/mpegaudiodata.d
正删除 libavcodec/mpegaudiodata.o
正删除 libavcodec/mpegaudiodec_fixed.d
正删除 libavcodec/mpegaudiodec_fixed.o
正删除 libavcodec/mpegaudiodec_float.d
正删除 libavcodec/mpegaudiodec_float.o
正删除 libavcodec/mpegaudiodecheader.d
正删除 libavcodec/mpegaudiodecheader.o
正删除 libavcodec/mpegaudiodsp.d
正删除 libavcodec/mpegaudiodsp.o
正删除 libavcodec/mpegaudiodsp_data.d
正删除 libavcodec/mpegaudiodsp_data.o
正删除 libavcodec/mpegaudiodsp_fixed.d
正删除 libavcodec/mpegaudiodsp_fixed.o
正删除 libavcodec/mpegaudiodsp_float.d
正删除 libavcodec/mpegaudiodsp_float.o
正删除 libavcodec/mpegpicture.d
正删除 libavcodec/mpegpicture.o
正删除 libavcodec/mpegutils.d
正删除 libavcodec/mpegutils.o
正删除 libavcodec/mpegvideo.d
正删除 libavcodec/mpegvideo.o
正删除 libavcodec/mpegvideo_motion.d
正删除 libavcodec/mpegvideo_motion.o
正删除 libavcodec/mpegvideodata.d
正删除 libavcodec/mpegvideodata.o
正删除 libavcodec/mpegvideodsp.d
正删除 libavcodec/mpegvideodsp.o
正删除 libavcodec/noise_bsf.d
正删除 libavcodec/noise_bsf.o
正删除 libavcodec/options.d
正删除 libavcodec/options.o
正删除 libavcodec/parser.d
正删除 libavcodec/parser.o
正删除 libavcodec/pixblockdsp.d
正删除 libavcodec/pixblockdsp.o
正删除 libavcodec/pthread.d
正删除 libavcodec/pthread.o
正删除 libavcodec/pthread_frame.d
正删除 libavcodec/pthread_frame.o
正删除 libavcodec/pthread_slice.d
正删除 libavcodec/pthread_slice.o
正删除 libavcodec/qpeldsp.d
正删除 libavcodec/qpeldsp.o
正删除 libavcodec/qsv_api.d
正删除 libavcodec/qsv_api.o
正删除 libavcodec/raw.d
正删除 libavcodec/raw.o
正删除 libavcodec/rdft.d
正删除 libavcodec/rdft.o
正删除 libavcodec/remove_extradata_bsf.d
正删除 libavcodec/remove_extradata_bsf.o
正删除 libavcodec/resample.d
正删除 libavcodec/resample.o
正删除 libavcodec/resample2.d
正删除 libavcodec/resample2.o
正删除 libavcodec/rl.d
正删除 libavcodec/rl.o
正删除 libavcodec/sbrdsp.d
正删除 libavcodec/sbrdsp.o
正删除 libavcodec/simple_idct.d
正删除 libavcodec/simple_idct.o
正删除 libavcodec/sinewin.d
正删除 libavcodec/sinewin.o
正删除 libavcodec/sinewin_fixed.d
正删除 libavcodec/sinewin_fixed.o
正删除 libavcodec/startcode.d
正删除 libavcodec/startcode.o
正删除 libavcodec/utils.d
正删除 libavcodec/utils.o
正删除 libavcodec/videodsp.d
正删除 libavcodec/videodsp.o
正删除 libavcodec/vorbis_parser.d
正删除 libavcodec/vorbis_parser.o
正删除 libavcodec/vp3dsp.d
正删除 libavcodec/vp3dsp.o
正删除 libavcodec/vp56.d
正删除 libavcodec/vp56.o
正删除 libavcodec/vp56data.d
正删除 libavcodec/vp56data.o
正删除 libavcodec/vp56dsp.d
正删除 libavcodec/vp56dsp.o
正删除 libavcodec/vp56rac.d
正删除 libavcodec/vp56rac.o
正删除 libavcodec/vp6.d
正删除 libavcodec/vp6.o
正删除 libavcodec/vp6dsp.d
正删除 libavcodec/vp6dsp.o
正删除 libavcodec/x86/aacpsdsp.d
正删除 libavcodec/x86/aacpsdsp.o
正删除 libavcodec/x86/aacpsdsp_init.d
正删除 libavcodec/x86/aacpsdsp_init.o
正删除 libavcodec/x86/blockdsp.d
正删除 libavcodec/x86/blockdsp.o
正删除 libavcodec/x86/blockdsp_init.d
正删除 libavcodec/x86/blockdsp_init.o
正删除 libavcodec/x86/constants.d
正删除 libavcodec/x86/constants.o
正删除 libavcodec/x86/dct32.d
正删除 libavcodec/x86/dct32.o
正删除 libavcodec/x86/dct_init.d
正删除 libavcodec/x86/dct_init.o
正删除 libavcodec/x86/deinterlace.d
正删除 libavcodec/x86/deinterlace.o
正删除 libavcodec/x86/fdct.d
正删除 libavcodec/x86/fdct.o
正删除 libavcodec/x86/fdctdsp_init.d
正删除 libavcodec/x86/fdctdsp_init.o
正删除 libavcodec/x86/fft.d
正删除 libavcodec/x86/fft.o
正删除 libavcodec/x86/fft_init.d
正删除 libavcodec/x86/fft_init.o
正删除 libavcodec/x86/fpel.d
正删除 libavcodec/x86/fpel.o
正删除 libavcodec/x86/h263_loopfilter.d
正删除 libavcodec/x86/h263_loopfilter.o
正删除 libavcodec/x86/h263dsp_init.d
正删除 libavcodec/x86/h263dsp_init.o
正删除 libavcodec/x86/h264_chromamc.d
正删除 libavcodec/x86/h264_chromamc.o
正删除 libavcodec/x86/h264_chromamc_10bit.d
正删除 libavcodec/x86/h264_chromamc_10bit.o
正删除 libavcodec/x86/h264_deblock.d
正删除 libavcodec/x86/h264_deblock.o
正删除 libavcodec/x86/h264_deblock_10bit.d
正删除 libavcodec/x86/h264_deblock_10bit.o
正删除 libavcodec/x86/h264_idct.d
正删除 libavcodec/x86/h264_idct.o
正删除 libavcodec/x86/h264_idct_10bit.d
正删除 libavcodec/x86/h264_idct_10bit.o
正删除 libavcodec/x86/h264_intrapred.d
正删除 libavcodec/x86/h264_intrapred.o
正删除 libavcodec/x86/h264_intrapred_10bit.d
正删除 libavcodec/x86/h264_intrapred_10bit.o
正删除 libavcodec/x86/h264_intrapred_init.d
正删除 libavcodec/x86/h264_intrapred_init.o
正删除 libavcodec/x86/h264_qpel.d
正删除 libavcodec/x86/h264_qpel.o
正删除 libavcodec/x86/h264_qpel_10bit.d
正删除 libavcodec/x86/h264_qpel_10bit.o
正删除 libavcodec/x86/h264_qpel_8bit.d
正删除 libavcodec/x86/h264_qpel_8bit.o
正删除 libavcodec/x86/h264_weight.d
正删除 libavcodec/x86/h264_weight.o
正删除 libavcodec/x86/h264_weight_10bit.d
正删除 libavcodec/x86/h264_weight_10bit.o
正删除 libavcodec/x86/h264chroma_init.d
正删除 libavcodec/x86/h264chroma_init.o
正删除 libavcodec/x86/h264dsp_init.d
正删除 libavcodec/x86/h264dsp_init.o
正删除 libavcodec/x86/hpeldsp.d
正删除 libavcodec/x86/hpeldsp.o
正删除 libavcodec/x86/hpeldsp_init.d
正删除 libavcodec/x86/hpeldsp_init.o
正删除 libavcodec/x86/idctdsp.d
正删除 libavcodec/x86/idctdsp.o
正删除 libavcodec/x86/idctdsp_init.d
正删除 libavcodec/x86/idctdsp_init.o
正删除 libavcodec/x86/imdct36.d
正删除 libavcodec/x86/imdct36.o
正删除 libavcodec/x86/me_cmp.d
正删除 libavcodec/x86/me_cmp.o
正删除 libavcodec/x86/me_cmp_init.d
正删除 libavcodec/x86/me_cmp_init.o
正删除 libavcodec/x86/mpegaudiodsp.d
正删除 libavcodec/x86/mpegaudiodsp.o
正删除 libavcodec/x86/mpegvideo.d
正删除 libavcodec/x86/mpegvideo.o
正删除 libavcodec/x86/mpegvideodsp.d
正删除 libavcodec/x86/mpegvideodsp.o
正删除 libavcodec/x86/pixblockdsp.d
正删除 libavcodec/x86/pixblockdsp.o
正删除 libavcodec/x86/pixblockdsp_init.d
正删除 libavcodec/x86/pixblockdsp_init.o
正删除 libavcodec/x86/qpel.d
正删除 libavcodec/x86/qpel.o
正删除 libavcodec/x86/qpeldsp.d
正删除 libavcodec/x86/qpeldsp.o
正删除 libavcodec/x86/qpeldsp_init.d
正删除 libavcodec/x86/qpeldsp_init.o
正删除 libavcodec/x86/sbrdsp.d
正删除 libavcodec/x86/sbrdsp.o
正删除 libavcodec/x86/sbrdsp_init.d
正删除 libavcodec/x86/sbrdsp_init.o
正删除 libavcodec/x86/simple_idct.d
正删除 libavcodec/x86/simple_idct.o
正删除 libavcodec/x86/videodsp.d
正删除 libavcodec/x86/videodsp.o
正删除 libavcodec/x86/videodsp_init.d
正删除 libavcodec/x86/videodsp_init.o
正删除 libavcodec/x86/vp3dsp.d
正删除 libavcodec/x86/vp3dsp.o
正删除 libavcodec/x86/vp3dsp_init.d
正删除 libavcodec/x86/vp3dsp_init.o
正删除 libavcodec/x86/vp6dsp.d
正删除 libavcodec/x86/vp6dsp.o
正删除 libavcodec/x86/vp6dsp_init.d
正删除 libavcodec/x86/vp6dsp_init.o
正删除 libavcodec/xiph.d
正删除 libavcodec/xiph.o
正删除 libavfilter/aeval.d
正删除 libavfilter/aeval.o
正删除 libavfilter/af_adelay.d
正删除 libavfilter/af_adelay.o
正删除 libavfilter/af_aecho.d
正删除 libavfilter/af_aecho.o
正删除 libavfilter/af_afade.d
正删除 libavfilter/af_afade.o
正删除 libavfilter/af_aformat.d
正删除 libavfilter/af_aformat.o
正删除 libavfilter/af_amerge.d
正删除 libavfilter/af_amerge.o
正删除 libavfilter/af_amix.d
正删除 libavfilter/af_amix.o
正删除 libavfilter/af_anull.d
正删除 libavfilter/af_anull.o
正删除 libavfilter/af_apad.d
正删除 libavfilter/af_apad.o
正删除 libavfilter/af_aphaser.d
正删除 libavfilter/af_aphaser.o
正删除 libavfilter/af_aresample.d
正删除 libavfilter/af_aresample.o
正删除 libavfilter/af_asetnsamples.d
正删除 libavfilter/af_asetnsamples.o
正删除 libavfilter/af_asetrate.d
正删除 libavfilter/af_asetrate.o
正删除 libavfilter/af_ashowinfo.d
正删除 libavfilter/af_ashowinfo.o
正删除 libavfilter/af_astats.d
正删除 libavfilter/af_astats.o
正删除 libavfilter/af_astreamsync.d
正删除 libavfilter/af_astreamsync.o
正删除 libavfilter/af_atempo.d
正删除 libavfilter/af_atempo.o
正删除 libavfilter/af_biquads.d
正删除 libavfilter/af_biquads.o
正删除 libavfilter/af_channelmap.d
正删除 libavfilter/af_channelmap.o
正删除 libavfilter/af_channelsplit.d
正删除 libavfilter/af_channelsplit.o
正删除 libavfilter/af_chorus.d
正删除 libavfilter/af_chorus.o
正删除 libavfilter/af_compand.d
正删除 libavfilter/af_compand.o
正删除 libavfilter/af_dcshift.d
正删除 libavfilter/af_dcshift.o
正删除 libavfilter/af_dynaudnorm.d
正删除 libavfilter/af_dynaudnorm.o
正删除 libavfilter/af_earwax.d
正删除 libavfilter/af_earwax.o
正删除 libavfilter/af_flanger.d
正删除 libavfilter/af_flanger.o
正删除 libavfilter/af_join.d
正删除 libavfilter/af_join.o
正删除 libavfilter/af_pan.d
正删除 libavfilter/af_pan.o
正删除 libavfilter/af_replaygain.d
正删除 libavfilter/af_replaygain.o
正删除 libavfilter/af_sidechaincompress.d
正删除 libavfilter/af_sidechaincompress.o
正删除 libavfilter/af_silencedetect.d
正删除 libavfilter/af_silencedetect.o
正删除 libavfilter/af_silenceremove.d
正删除 libavfilter/af_silenceremove.o
正删除 libavfilter/af_volume.d
正删除 libavfilter/af_volume.o
正删除 libavfilter/af_volumedetect.d
正删除 libavfilter/af_volumedetect.o
正删除 libavfilter/allfilters.d
正删除 libavfilter/allfilters.o
正删除 libavfilter/asink_anullsink.d
正删除 libavfilter/asink_anullsink.o
正删除 libavfilter/asrc_anullsrc.d
正删除 libavfilter/asrc_anullsrc.o
正删除 libavfilter/asrc_sine.d
正删除 libavfilter/asrc_sine.o
正删除 libavfilter/audio.d
正删除 libavfilter/audio.o
正删除 libavfilter/avcodec.d
正删除 libavfilter/avcodec.o
正删除 libavfilter/avf_aphasemeter.d
正删除 libavfilter/avf_aphasemeter.o
正删除 libavfilter/avf_avectorscope.d
正删除 libavfilter/avf_avectorscope.o
正删除 libavfilter/avf_concat.d
正删除 libavfilter/avf_concat.o
正删除 libavfilter/avf_showcqt.d
正删除 libavfilter/avf_showcqt.o
正删除 libavfilter/avf_showfreqs.d
正删除 libavfilter/avf_showfreqs.o
正删除 libavfilter/avf_showspectrum.d
正删除 libavfilter/avf_showspectrum.o
正删除 libavfilter/avf_showvolume.d
正删除 libavfilter/avf_showvolume.o
正删除 libavfilter/avf_showwaves.d
正删除 libavfilter/avf_showwaves.o
正删除 libavfilter/avfilter.d
正删除 libavfilter/avfilter.o
正删除 libavfilter/avfiltergraph.d
正删除 libavfilter/avfiltergraph.o
正删除 libavfilter/bbox.d
正删除 libavfilter/bbox.o
正删除 libavfilter/buffer.d
正删除 libavfilter/buffer.o
正删除 libavfilter/buffersink.d
正删除 libavfilter/buffersink.o
正删除 libavfilter/buffersrc.d
正删除 libavfilter/buffersrc.o
正删除 libavfilter/drawutils.d
正删除 libavfilter/drawutils.o
正删除 libavfilter/dualinput.d
正删除 libavfilter/dualinput.o
正删除 libavfilter/f_drawgraph.d
正删除 libavfilter/f_drawgraph.o
正删除 libavfilter/f_interleave.d
正删除 libavfilter/f_interleave.o
正删除 libavfilter/f_perms.d
正删除 libavfilter/f_perms.o
正删除 libavfilter/f_reverse.d
正删除 libavfilter/f_reverse.o
正删除 libavfilter/f_select.d
正删除 libavfilter/f_select.o
正删除 libavfilter/f_sendcmd.d
正删除 libavfilter/f_sendcmd.o
正删除 libavfilter/fifo.d
正删除 libavfilter/fifo.o
正删除 libavfilter/formats.d
正删除 libavfilter/formats.o
正删除 libavfilter/framesync.d
正删除 libavfilter/framesync.o
正删除 libavfilter/generate_wave_table.d
正删除 libavfilter/generate_wave_table.o
正删除 libavfilter/graphdump.d
正删除 libavfilter/graphdump.o
正删除 libavfilter/graphparser.d
正删除 libavfilter/graphparser.o
正删除 libavfilter/lavfutils.d
正删除 libavfilter/lavfutils.o
正删除 libavfilter/libavfilter.a
正删除 libavfilter/libavfilter.pc
正删除 libavfilter/lswsutils.d
正删除 libavfilter/lswsutils.o
正删除 libavfilter/opencl_allkernels.d
正删除 libavfilter/opencl_allkernels.o
正删除 libavfilter/pthread.d
正删除 libavfilter/pthread.o
正删除 libavfilter/setpts.d
正删除 libavfilter/setpts.o
正删除 libavfilter/settb.d
正删除 libavfilter/settb.o
正删除 libavfilter/split.d
正删除 libavfilter/split.o
正删除 libavfilter/src_movie.d
正删除 libavfilter/src_movie.o
正删除 libavfilter/transform.d
正删除 libavfilter/transform.o
正删除 libavfilter/trim.d
正删除 libavfilter/trim.o
正删除 libavfilter/vf_alphamerge.d
正删除 libavfilter/vf_alphamerge.o
正删除 libavfilter/vf_aspect.d
正删除 libavfilter/vf_aspect.o
正删除 libavfilter/vf_atadenoise.d
正删除 libavfilter/vf_atadenoise.o
正删除 libavfilter/vf_bbox.d
正删除 libavfilter/vf_bbox.o
正删除 libavfilter/vf_blackdetect.d
正删除 libavfilter/vf_blackdetect.o
正删除 libavfilter/vf_blend.d
正删除 libavfilter/vf_blend.o
正删除 libavfilter/vf_codecview.d
正删除 libavfilter/vf_codecview.o
正删除 libavfilter/vf_colorbalance.d
正删除 libavfilter/vf_colorbalance.o
正删除 libavfilter/vf_colorchannelmixer.d
正删除 libavfilter/vf_colorchannelmixer.o
正删除 libavfilter/vf_colorkey.d
正删除 libavfilter/vf_colorkey.o
正删除 libavfilter/vf_colorlevels.d
正删除 libavfilter/vf_colorlevels.o
正删除 libavfilter/vf_copy.d
正删除 libavfilter/vf_copy.o
正删除 libavfilter/vf_crop.d
正删除 libavfilter/vf_crop.o
正删除 libavfilter/vf_curves.d
正删除 libavfilter/vf_curves.o
正删除 libavfilter/vf_dctdnoiz.d
正删除 libavfilter/vf_dctdnoiz.o
正删除 libavfilter/vf_deband.d
正删除 libavfilter/vf_deband.o
正删除 libavfilter/vf_decimate.d
正删除 libavfilter/vf_decimate.o
正删除 libavfilter/vf_dejudder.d
正删除 libavfilter/vf_dejudder.o
正删除 libavfilter/vf_deshake.d
正删除 libavfilter/vf_deshake.o
正删除 libavfilter/vf_detelecine.d
正删除 libavfilter/vf_detelecine.o
正删除 libavfilter/vf_drawbox.d
正删除 libavfilter/vf_drawbox.o
正删除 libavfilter/vf_edgedetect.d
正删除 libavfilter/vf_edgedetect.o
正删除 libavfilter/vf_elbg.d
正删除 libavfilter/vf_elbg.o
正删除 libavfilter/vf_extractplanes.d
正删除 libavfilter/vf_extractplanes.o
正删除 libavfilter/vf_fade.d
正删除 libavfilter/vf_fade.o
正删除 libavfilter/vf_fftfilt.d
正删除 libavfilter/vf_fftfilt.o
正删除 libavfilter/vf_field.d
正删除 libavfilter/vf_field.o
正删除 libavfilter/vf_fieldmatch.d
正删除 libavfilter/vf_fieldmatch.o
正删除 libavfilter/vf_fieldorder.d
正删除 libavfilter/vf_fieldorder.o
正删除 libavfilter/vf_format.d
正删除 libavfilter/vf_format.o
正删除 libavfilter/vf_fps.d
正删除 libavfilter/vf_fps.o
正删除 libavfilter/vf_framepack.d
正删除 libavfilter/vf_framepack.o
正删除 libavfilter/vf_framerate.d
正删除 libavfilter/vf_framerate.o
正删除 libavfilter/vf_framestep.d
正删除 libavfilter/vf_framestep.o
正删除 libavfilter/vf_gradfun.d
正删除 libavfilter/vf_gradfun.o
正删除 libavfilter/vf_hflip.d
正删除 libavfilter/vf_hflip.o
正删除 libavfilter/vf_histogram.d
正删除 libavfilter/vf_histogram.o
正删除 libavfilter/vf_hqx.d
正删除 libavfilter/vf_hqx.o
正删除 libavfilter/vf_hue.d
正删除 libavfilter/vf_hue.o
正删除 libavfilter/vf_idet.d
正删除 libavfilter/vf_idet.o
正删除 libavfilter/vf_il.d
正删除 libavfilter/vf_il.o
正删除 libavfilter/vf_lenscorrection.d
正删除 libavfilter/vf_lenscorrection.o
正删除 libavfilter/vf_lut.d
正删除 libavfilter/vf_lut.o
正删除 libavfilter/vf_lut3d.d
正删除 libavfilter/vf_lut3d.o
正删除 libavfilter/vf_mergeplanes.d
正删除 libavfilter/vf_mergeplanes.o
正删除 libavfilter/vf_neighbor.d
正删除 libavfilter/vf_neighbor.o
正删除 libavfilter/vf_noise.d
正删除 libavfilter/vf_noise.o
正删除 libavfilter/vf_null.d
正删除 libavfilter/vf_null.o
正删除 libavfilter/vf_overlay.d
正删除 libavfilter/vf_overlay.o
正删除 libavfilter/vf_pad.d
正删除 libavfilter/vf_pad.o
正删除 libavfilter/vf_palettegen.d
正删除 libavfilter/vf_palettegen.o
正删除 libavfilter/vf_paletteuse.d
正删除 libavfilter/vf_paletteuse.o
正删除 libavfilter/vf_pixdesctest.d
正删除 libavfilter/vf_pixdesctest.o
正删除 libavfilter/vf_psnr.d
正删除 libavfilter/vf_psnr.o
正删除 libavfilter/vf_qp.d
正删除 libavfilter/vf_qp.o
正删除 libavfilter/vf_random.d
正删除 libavfilter/vf_random.o
正删除 libavfilter/vf_removegrain.d
正删除 libavfilter/vf_removegrain.o
正删除 libavfilter/vf_removelogo.d
正删除 libavfilter/vf_removelogo.o
正删除 libavfilter/vf_rotate.d
正删除 libavfilter/vf_rotate.o
正删除 libavfilter/vf_scale.d
正删除 libavfilter/vf_scale.o
正删除 libavfilter/vf_separatefields.d
正删除 libavfilter/vf_separatefields.o
正删除 libavfilter/vf_setfield.d
正删除 libavfilter/vf_setfield.o
正删除 libavfilter/vf_showinfo.d
正删除 libavfilter/vf_showinfo.o
正删除 libavfilter/vf_showpalette.d
正删除 libavfilter/vf_showpalette.o
正删除 libavfilter/vf_shuffleplanes.d
正删除 libavfilter/vf_shuffleplanes.o
正删除 libavfilter/vf_signalstats.d
正删除 libavfilter/vf_signalstats.o
正删除 libavfilter/vf_ssim.d
正删除 libavfilter/vf_ssim.o
正删除 libavfilter/vf_stack.d
正删除 libavfilter/vf_stack.o
正删除 libavfilter/vf_swapuv.d
正删除 libavfilter/vf_swapuv.o
正删除 libavfilter/vf_telecine.d
正删除 libavfilter/vf_telecine.o
正删除 libavfilter/vf_thumbnail.d
正删除 libavfilter/vf_thumbnail.o
正删除 libavfilter/vf_tile.d
正删除 libavfilter/vf_tile.o
正删除 libavfilter/vf_transpose.d
正删除 libavfilter/vf_transpose.o
正删除 libavfilter/vf_unsharp.d
正删除 libavfilter/vf_unsharp.o
正删除 libavfilter/vf_vectorscope.d
正删除 libavfilter/vf_vectorscope.o
正删除 libavfilter/vf_vflip.d
正删除 libavfilter/vf_vflip.o
正删除 libavfilter/vf_vignette.d
正删除 libavfilter/vf_vignette.o
正删除 libavfilter/vf_w3fdif.d
正删除 libavfilter/vf_w3fdif.o
正删除 libavfilter/vf_waveform.d
正删除 libavfilter/vf_waveform.o
正删除 libavfilter/vf_xbr.d
正删除 libavfilter/vf_xbr.o
正删除 libavfilter/vf_yadif.d
正删除 libavfilter/vf_yadif.o
正删除 libavfilter/vf_zoompan.d
正删除 libavfilter/vf_zoompan.o
正删除 libavfilter/video.d
正删除 libavfilter/video.o
正删除 libavfilter/vsink_nullsink.d
正删除 libavfilter/vsink_nullsink.o
正删除 libavfilter/vsrc_cellauto.d
正删除 libavfilter/vsrc_cellauto.o
正删除 libavfilter/vsrc_life.d
正删除 libavfilter/vsrc_life.o
正删除 libavfilter/vsrc_mandelbrot.d
正删除 libavfilter/vsrc_mandelbrot.o
正删除 libavfilter/vsrc_testsrc.d
正删除 libavfilter/vsrc_testsrc.o
正删除 libavfilter/x86/af_volume.d
正删除 libavfilter/x86/af_volume.o
正删除 libavfilter/x86/af_volume_init.d
正删除 libavfilter/x86/af_volume_init.o
正删除 libavfilter/x86/vf_gradfun.d
正删除 libavfilter/x86/vf_gradfun.o
正删除 libavfilter/x86/vf_gradfun_init.d
正删除 libavfilter/x86/vf_gradfun_init.o
正删除 libavfilter/x86/vf_idet.d
正删除 libavfilter/x86/vf_idet.o
正删除 libavfilter/x86/vf_idet_init.d
正删除 libavfilter/x86/vf_idet_init.o
正删除 libavfilter/x86/vf_noise.d
正删除 libavfilter/x86/vf_noise.o
正删除 libavfilter/x86/vf_psnr.d
正删除 libavfilter/x86/vf_psnr.o
正删除 libavfilter/x86/vf_psnr_init.d
正删除 libavfilter/x86/vf_psnr_init.o
正删除 libavfilter/x86/vf_removegrain_init.d
正删除 libavfilter/x86/vf_removegrain_init.o
正删除 libavfilter/x86/vf_ssim.d
正删除 libavfilter/x86/vf_ssim.o
正删除 libavfilter/x86/vf_ssim_init.d
正删除 libavfilter/x86/vf_ssim_init.o
正删除 libavfilter/x86/vf_yadif.d
正删除 libavfilter/x86/vf_yadif.o
正删除 libavfilter/x86/vf_yadif_init.d
正删除 libavfilter/x86/vf_yadif_init.o
正删除 libavfilter/x86/yadif-10.d
正删除 libavfilter/x86/yadif-10.o
正删除 libavfilter/x86/yadif-16.d
正删除 libavfilter/x86/yadif-16.o
正删除 libavformat/aacdec.d
正删除 libavformat/aacdec.o
正删除 libavformat/adtsenc.d
正删除 libavformat/adtsenc.o
正删除 libavformat/allformats.d
正删除 libavformat/allformats.o
正删除 libavformat/apetag.d
正删除 libavformat/apetag.o
正删除 libavformat/avc.d
正删除 libavformat/avc.o
正删除 libavformat/avio.d
正删除 libavformat/avio.o
正删除 libavformat/aviobuf.d
正删除 libavformat/aviobuf.o
正删除 libavformat/cache.d
正删除 libavformat/cache.o
正删除 libavformat/concat.d
正删除 libavformat/concat.o
正删除 libavformat/concatdec.d
正删除 libavformat/concatdec.o
正删除 libavformat/crypto.d
正删除 libavformat/crypto.o
正删除 libavformat/cutils.d
正删除 libavformat/cutils.o
正删除 libavformat/data_uri.d
正删除 libavformat/data_uri.o
正删除 libavformat/dump.d
正删除 libavformat/dump.o
正删除 libavformat/file.d
正删除 libavformat/file.o
正删除 libavformat/flvdec.d
正删除 libavformat/flvdec.o
正删除 libavformat/format.d
正删除 libavformat/format.o
正删除 libavformat/ftp.d
正删除 libavformat/ftp.o
正删除 libavformat/hevc.d
正删除 libavformat/hevc.o
正删除 libavformat/hls.d
正删除 libavformat/hls.o
正删除 libavformat/hlsproto.d
正删除 libavformat/hlsproto.o
正删除 libavformat/http.d
正删除 libavformat/http.o
正删除 libavformat/httpauth.d
正删除 libavformat/httpauth.o
正删除 libavformat/icecast.d
正删除 libavformat/icecast.o
正删除 libavformat/id3v1.d
正删除 libavformat/id3v1.o
正删除 libavformat/id3v2.d
正删除 libavformat/id3v2.o
正删除 libavformat/id3v2enc.d
正删除 libavformat/id3v2enc.o
正删除 libavformat/img2.d
正删除 libavformat/img2.o
正删除 libavformat/isom.d
正删除 libavformat/isom.o
正删除 libavformat/latmenc.d
正删除 libavformat/latmenc.o
正删除 libavformat/libavformat.a
正删除 libavformat/libavformat.pc
正删除 libavformat/loasdec.d
正删除 libavformat/loasdec.o
正删除 libavformat/m4vdec.d
正删除 libavformat/m4vdec.o
正删除 libavformat/md5proto.d
正删除 libavformat/md5proto.o
正删除 libavformat/metadata.d
正删除 libavformat/metadata.o
正删除 libavformat/mov.d
正删除 libavformat/mov.o
正删除 libavformat/mov_chan.d
正删除 libavformat/mov_chan.o
正删除 libavformat/movenc.d
正删除 libavformat/movenc.o
正删除 libavformat/movenchint.d
正删除 libavformat/movenchint.o
正删除 libavformat/mp3dec.d
正删除 libavformat/mp3dec.o
正删除 libavformat/mpeg.d
正删除 libavformat/mpeg.o
正删除 libavformat/mpegts.d
正删除 libavformat/mpegts.o
正删除 libavformat/mpegtsenc.d
正删除 libavformat/mpegtsenc.o
正删除 libavformat/mpegvideodec.d
正删除 libavformat/mpegvideodec.o
正删除 libavformat/mux.d
正删除 libavformat/mux.o
正删除 libavformat/network.d
正删除 libavformat/network.o
正删除 libavformat/options.d
正删除 libavformat/options.o
正删除 libavformat/os_support.d
正删除 libavformat/os_support.o
正删除 libavformat/rawdec.d
正删除 libavformat/rawdec.o
正删除 libavformat/rawenc.d
正删除 libavformat/rawenc.o
正删除 libavformat/replaygain.d
正删除 libavformat/replaygain.o
正删除 libavformat/riff.d
正删除 libavformat/riff.o
正删除 libavformat/riffdec.d
正删除 libavformat/riffdec.o
正删除 libavformat/riffenc.d
正删除 libavformat/riffenc.o
正删除 libavformat/rtmphttp.d
正删除 libavformat/rtmphttp.o
正删除 libavformat/rtmppkt.d
正删除 libavformat/rtmppkt.o
正删除 libavformat/rtmpproto.d
正删除 libavformat/rtmpproto.o
正删除 libavformat/rtp.d
正删除 libavformat/rtp.o
正删除 libavformat/rtpenc_chain.d
正删除 libavformat/rtpenc_chain.o
正删除 libavformat/sdp.d
正删除 libavformat/sdp.o
正删除 libavformat/subfile.d
正删除 libavformat/subfile.o
正删除 libavformat/tcp.d
正删除 libavformat/tcp.o
正删除 libavformat/udp.d
正删除 libavformat/udp.o
正删除 libavformat/url.d
正删除 libavformat/url.o
正删除 libavformat/urldecode.d
正删除 libavformat/urldecode.o
正删除 libavformat/utils.d
正删除 libavformat/utils.o
正删除 libavutil/adler32.d
正删除 libavutil/adler32.o
正删除 libavutil/aes.d
正删除 libavutil/aes.o
正删除 libavutil/audio_fifo.d
正删除 libavutil/audio_fifo.o
正删除 libavutil/avconfig.h
正删除 libavutil/avstring.d
正删除 libavutil/avstring.o
正删除 libavutil/base64.d
正删除 libavutil/base64.o
正删除 libavutil/blowfish.d
正删除 libavutil/blowfish.o
正删除 libavutil/bprint.d
正删除 libavutil/bprint.o
正删除 libavutil/buffer.d
正删除 libavutil/buffer.o
正删除 libavutil/camellia.d
正删除 libavutil/camellia.o
正删除 libavutil/cast5.d
正删除 libavutil/cast5.o
正删除 libavutil/channel_layout.d
正删除 libavutil/channel_layout.o
正删除 libavutil/color_utils.d
正删除 libavutil/color_utils.o
正删除 libavutil/cpu.d
正删除 libavutil/cpu.o
正删除 libavutil/crc.d
正删除 libavutil/crc.o
正删除 libavutil/des.d
正删除 libavutil/des.o
正删除 libavutil/dict.d
正删除 libavutil/dict.o
正删除 libavutil/display.d
正删除 libavutil/display.o
正删除 libavutil/downmix_info.d
正删除 libavutil/downmix_info.o
正删除 libavutil/error.d
正删除 libavutil/error.o
正删除 libavutil/eval.d
正删除 libavutil/eval.o
正删除 libavutil/ffversion.h
正删除 libavutil/fifo.d
正删除 libavutil/fifo.o
正删除 libavutil/file.d
正删除 libavutil/file.o
正删除 libavutil/file_open.d
正删除 libavutil/file_open.o
正删除 libavutil/fixed_dsp.d
正删除 libavutil/fixed_dsp.o
正删除 libavutil/float_dsp.d
正删除 libavutil/float_dsp.o
正删除 libavutil/frame.d
正删除 libavutil/frame.o
正删除 libavutil/hash.d
正删除 libavutil/hash.o
正删除 libavutil/hmac.d
正删除 libavutil/hmac.o
正删除 libavutil/imgutils.d
正删除 libavutil/imgutils.o
正删除 libavutil/intmath.d
正删除 libavutil/intmath.o
正删除 libavutil/lfg.d
正删除 libavutil/lfg.o
正删除 libavutil/libavutil.a
正删除 libavutil/libavutil.pc
正删除 libavutil/lls.d
正删除 libavutil/lls.o
正删除 libavutil/log.d
正删除 libavutil/log.o
正删除 libavutil/log2_tab.d
正删除 libavutil/log2_tab.o
正删除 libavutil/mathematics.d
正删除 libavutil/mathematics.o
正删除 libavutil/md5.d
正删除 libavutil/md5.o
正删除 libavutil/mem.d
正删除 libavutil/mem.o
正删除 libavutil/murmur3.d
正删除 libavutil/murmur3.o
正删除 libavutil/opt.d
正删除 libavutil/opt.o
正删除 libavutil/parseutils.d
正删除 libavutil/parseutils.o
正删除 libavutil/pixdesc.d
正删除 libavutil/pixdesc.o
正删除 libavutil/pixelutils.d
正删除 libavutil/pixelutils.o
正删除 libavutil/random_seed.d
正删除 libavutil/random_seed.o
正删除 libavutil/rational.d
正删除 libavutil/rational.o
正删除 libavutil/rc4.d
正删除 libavutil/rc4.o
正删除 libavutil/reverse.d
正删除 libavutil/reverse.o
正删除 libavutil/ripemd.d
正删除 libavutil/ripemd.o
正删除 libavutil/samplefmt.d
正删除 libavutil/samplefmt.o
正删除 libavutil/sha.d
正删除 libavutil/sha.o
正删除 libavutil/sha512.d
正删除 libavutil/sha512.o
正删除 libavutil/stereo3d.d
正删除 libavutil/stereo3d.o
正删除 libavutil/tea.d
正删除 libavutil/tea.o
正删除 libavutil/threadmessage.d
正删除 libavutil/threadmessage.o
正删除 libavutil/time.d
正删除 libavutil/time.o
正删除 libavutil/timecode.d
正删除 libavutil/timecode.o
正删除 libavutil/tree.d
正删除 libavutil/tree.o
正删除 libavutil/twofish.d
正删除 libavutil/twofish.o
正删除 libavutil/utils.d
正删除 libavutil/utils.o
正删除 libavutil/x86/cpu.d
正删除 libavutil/x86/cpu.o
正删除 libavutil/x86/cpuid.d
正删除 libavutil/x86/cpuid.o
正删除 libavutil/x86/float_dsp.d
正删除 libavutil/x86/float_dsp.o
正删除 libavutil/x86/float_dsp_init.d
正删除 libavutil/x86/float_dsp_init.o
正删除 libavutil/x86/lls.d
正删除 libavutil/x86/lls.o
正删除 libavutil/x86/lls_init.d
正删除 libavutil/x86/lls_init.o
正删除 libavutil/x86/pixelutils.d
正删除 libavutil/x86/pixelutils.o
正删除 libavutil/x86/pixelutils_init.d
正删除 libavutil/x86/pixelutils_init.o
正删除 libavutil/xga_font_data.d
正删除 libavutil/xga_font_data.o
正删除 libavutil/xtea.d
正删除 libavutil/xtea.o
正删除 libswresample/audioconvert.d
正删除 libswresample/audioconvert.o
正删除 libswresample/dither.d
正删除 libswresample/dither.o
正删除 libswresample/libswresample.a
正删除 libswresample/libswresample.pc
正删除 libswresample/options.d
正删除 libswresample/options.o
正删除 libswresample/rematrix.d
正删除 libswresample/rematrix.o
正删除 libswresample/resample.d
正删除 libswresample/resample.o
正删除 libswresample/resample_dsp.d
正删除 libswresample/resample_dsp.o
正删除 libswresample/swresample.d
正删除 libswresample/swresample.o
正删除 libswresample/swresample_frame.d
正删除 libswresample/swresample_frame.o
正删除 libswresample/x86/audio_convert.d
正删除 libswresample/x86/audio_convert.o
正删除 libswresample/x86/audio_convert_init.d
正删除 libswresample/x86/audio_convert_init.o
正删除 libswresample/x86/rematrix.d
正删除 libswresample/x86/rematrix.o
正删除 libswresample/x86/rematrix_init.d
正删除 libswresample/x86/rematrix_init.o
正删除 libswresample/x86/resample.d
正删除 libswresample/x86/resample.o
正删除 libswresample/x86/resample_init.d
正删除 libswresample/x86/resample_init.o
正删除 libswscale/alphablend.d
正删除 libswscale/alphablend.o
正删除 libswscale/gamma.d
正删除 libswscale/gamma.o
正删除 libswscale/hscale.d
正删除 libswscale/hscale.o
正删除 libswscale/hscale_fast_bilinear.d
正删除 libswscale/hscale_fast_bilinear.o
正删除 libswscale/input.d
正删除 libswscale/input.o
正删除 libswscale/libswscale.a
正删除 libswscale/libswscale.pc
正删除 libswscale/options.d
正删除 libswscale/options.o
正删除 libswscale/output.d
正删除 libswscale/output.o
正删除 libswscale/rgb2rgb.d
正删除 libswscale/rgb2rgb.o
正删除 libswscale/slice.d
正删除 libswscale/slice.o
正删除 libswscale/swscale.d
正删除 libswscale/swscale.o
正删除 libswscale/swscale_unscaled.d
正删除 libswscale/swscale_unscaled.o
正删除 libswscale/utils.d
正删除 libswscale/utils.o
正删除 libswscale/vscale.d
正删除 libswscale/vscale.o
正删除 libswscale/x86/hscale_fast_bilinear_simd.d
正删除 libswscale/x86/hscale_fast_bilinear_simd.o
正删除 libswscale/x86/input.d
正删除 libswscale/x86/input.o
正删除 libswscale/x86/output.d
正删除 libswscale/x86/output.o
正删除 libswscale/x86/rgb2rgb.d
正删除 libswscale/x86/rgb2rgb.o
正删除 libswscale/x86/scale.d
正删除 libswscale/x86/scale.o
正删除 libswscale/x86/swscale.d
正删除 libswscale/x86/swscale.o
正删除 libswscale/x86/yuv2rgb.d
正删除 libswscale/x86/yuv2rgb.o
正删除 libswscale/yuv2rgb.d
正删除 libswscale/yuv2rgb.o
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/contrib
正删除 .config
正删除 .version
正删除 compat/strtod.d
正删除 compat/strtod.o
正删除 config.asm
正删除 config.fate
正删除 config.h
正删除 config.log
正删除 config.mak
正删除 doc/config.texi
正删除 doc/examples/pc-uninstalled/
正删除 libavcodec/aac_ac3_parser.d
正删除 libavcodec/aac_ac3_parser.o
正删除 libavcodec/aac_adtstoasc_bsf.d
正删除 libavcodec/aac_adtstoasc_bsf.o
正删除 libavcodec/aac_parser.d
正删除 libavcodec/aac_parser.o
正删除 libavcodec/aacadtsdec.d
正删除 libavcodec/aacadtsdec.o
正删除 libavcodec/aacdec.d
正删除 libavcodec/aacdec.o
正删除 libavcodec/aacps_float.d
正删除 libavcodec/aacps_float.o
正删除 libavcodec/aacpsdsp_float.d
正删除 libavcodec/aacpsdsp_float.o
正删除 libavcodec/aacsbr.d
正删除 libavcodec/aacsbr.o
正删除 libavcodec/aactab.d
正删除 libavcodec/aactab.o
正删除 libavcodec/aarch64/fft_init_aarch64.d
正删除 libavcodec/aarch64/fft_init_aarch64.o
正删除 libavcodec/aarch64/fft_neon.d
正删除 libavcodec/aarch64/fft_neon.o
正删除 libavcodec/aarch64/h264chroma_init_aarch64.d
正删除 libavcodec/aarch64/h264chroma_init_aarch64.o
正删除 libavcodec/aarch64/h264cmc_neon.d
正删除 libavcodec/aarch64/h264cmc_neon.o
正删除 libavcodec/aarch64/h264dsp_init_aarch64.d
正删除 libavcodec/aarch64/h264dsp_init_aarch64.o
正删除 libavcodec/aarch64/h264dsp_neon.d
正删除 libavcodec/aarch64/h264dsp_neon.o
正删除 libavcodec/aarch64/h264idct_neon.d
正删除 libavcodec/aarch64/h264idct_neon.o
正删除 libavcodec/aarch64/h264pred_init.d
正删除 libavcodec/aarch64/h264pred_init.o
正删除 libavcodec/aarch64/h264pred_neon.d
正删除 libavcodec/aarch64/h264pred_neon.o
正删除 libavcodec/aarch64/h264qpel_init_aarch64.d
正删除 libavcodec/aarch64/h264qpel_init_aarch64.o
正删除 libavcodec/aarch64/h264qpel_neon.d
正删除 libavcodec/aarch64/h264qpel_neon.o
正删除 libavcodec/aarch64/hpeldsp_init_aarch64.d
正删除 libavcodec/aarch64/hpeldsp_init_aarch64.o
正删除 libavcodec/aarch64/hpeldsp_neon.d
正删除 libavcodec/aarch64/hpeldsp_neon.o
正删除 libavcodec/aarch64/imdct15_init.d
正删除 libavcodec/aarch64/imdct15_init.o
正删除 libavcodec/aarch64/imdct15_neon.d
正删除 libavcodec/aarch64/imdct15_neon.o
正删除 libavcodec/aarch64/mdct_neon.d
正删除 libavcodec/aarch64/mdct_neon.o
正删除 libavcodec/aarch64/mpegaudiodsp_init.d
正删除 libavcodec/aarch64/mpegaudiodsp_init.o
正删除 libavcodec/aarch64/mpegaudiodsp_neon.d
正删除 libavcodec/aarch64/mpegaudiodsp_neon.o
正删除 libavcodec/aarch64/videodsp.d
正删除 libavcodec/aarch64/videodsp.o
正删除 libavcodec/aarch64/videodsp_init.d
正删除 libavcodec/aarch64/videodsp_init.o
正删除 libavcodec/ac3tab.d
正删除 libavcodec/ac3tab.o
正删除 libavcodec/allcodecs.d
正删除 libavcodec/allcodecs.o
正删除 libavcodec/audioconvert.d
正删除 libavcodec/audioconvert.o
正删除 libavcodec/avdct.d
正删除 libavcodec/avdct.o
正删除 libavcodec/avfft.d
正删除 libavcodec/avfft.o
正删除 libavcodec/avpacket.d
正删除 libavcodec/avpacket.o
正删除 libavcodec/avpicture.d
正删除 libavcodec/avpicture.o
正删除 libavcodec/bitstream.d
正删除 libavcodec/bitstream.o
正删除 libavcodec/bitstream_filter.d
正删除 libavcodec/bitstream_filter.o
正删除 libavcodec/blockdsp.d
正删除 libavcodec/blockdsp.o
正删除 libavcodec/cabac.d
正删除 libavcodec/cabac.o
正删除 libavcodec/chomp_bsf.d
正删除 libavcodec/chomp_bsf.o
正删除 libavcodec/codec_desc.d
正删除 libavcodec/codec_desc.o
正删除 libavcodec/dct.d
正删除 libavcodec/dct.o
正删除 libavcodec/dct32_fixed.d
正删除 libavcodec/dct32_fixed.o
正删除 libavcodec/dct32_float.d
正删除 libavcodec/dct32_float.o
正删除 libavcodec/dump_extradata_bsf.d
正删除 libavcodec/dump_extradata_bsf.o
正删除 libavcodec/dv_profile.d
正删除 libavcodec/dv_profile.o
正删除 libavcodec/elbg.d
正删除 libavcodec/elbg.o
正删除 libavcodec/error_resilience.d
正删除 libavcodec/error_resilience.o
正删除 libavcodec/faandct.d
正删除 libavcodec/faandct.o
正删除 libavcodec/faanidct.d
正删除 libavcodec/faanidct.o
正删除 libavcodec/fdctdsp.d
正删除 libavcodec/fdctdsp.o
正删除 libavcodec/fft_fixed.d
正删除 libavcodec/fft_fixed.o
正删除 libavcodec/fft_fixed_32.d
正删除 libavcodec/fft_fixed_32.o
正删除 libavcodec/fft_float.d
正删除 libavcodec/fft_float.o
正删除 libavcodec/fft_init_table.d
正删除 libavcodec/fft_init_table.o
正删除 libavcodec/flvdec.d
正删除 libavcodec/flvdec.o
正删除 libavcodec/golomb.d
正删除 libavcodec/golomb.o
正删除 libavcodec/h263.d
正删除 libavcodec/h263.o
正删除 libavcodec/h263_parser.d
正删除 libavcodec/h263_parser.o
正删除 libavcodec/h263data.d
正删除 libavcodec/h263data.o
正删除 libavcodec/h263dec.d
正删除 libavcodec/h263dec.o
正删除 libavcodec/h263dsp.d
正删除 libavcodec/h263dsp.o
正删除 libavcodec/h264.d
正删除 libavcodec/h264.o
正删除 libavcodec/h264_cabac.d
正删除 libavcodec/h264_cabac.o
正删除 libavcodec/h264_cavlc.d
正删除 libavcodec/h264_cavlc.o
正删除 libavcodec/h264_direct.d
正删除 libavcodec/h264_direct.o
正删除 libavcodec/h264_loopfilter.d
正删除 libavcodec/h264_loopfilter.o
正删除 libavcodec/h264_mb.d
正删除 libavcodec/h264_mb.o
正删除 libavcodec/h264_mp4toannexb_bsf.d
正删除 libavcodec/h264_mp4toannexb_bsf.o
正删除 libavcodec/h264_parser.d
正删除 libavcodec/h264_parser.o
正删除 libavcodec/h264_picture.d
正删除 libavcodec/h264_picture.o
正删除 libavcodec/h264_ps.d
正删除 libavcodec/h264_ps.o
正删除 libavcodec/h264_refs.d
正删除 libavcodec/h264_refs.o
正删除 libavcodec/h264_sei.d
正删除 libavcodec/h264_sei.o
正删除 libavcodec/h264_slice.d
正删除 libavcodec/h264_slice.o
正删除 libavcodec/h264chroma.d
正删除 libavcodec/h264chroma.o
正删除 libavcodec/h264dsp.d
正删除 libavcodec/h264dsp.o
正删除 libavcodec/h264idct.d
正删除 libavcodec/h264idct.o
正删除 libavcodec/h264pred.d
正删除 libavcodec/h264pred.o
正删除 libavcodec/h264qpel.d
正删除 libavcodec/h264qpel.o
正删除 libavcodec/hevc_mp4toannexb_bsf.d
正删除 libavcodec/hevc_mp4toannexb_bsf.o
正删除 libavcodec/hpeldsp.d
正删除 libavcodec/hpeldsp.o
正删除 libavcodec/huffman.d
正删除 libavcodec/huffman.o
正删除 libavcodec/idctdsp.d
正删除 libavcodec/idctdsp.o
正删除 libavcodec/imdct15.d
正删除 libavcodec/imdct15.o
正删除 libavcodec/imgconvert.d
正删除 libavcodec/imgconvert.o
正删除 libavcodec/imx_dump_header_bsf.d
正删除 libavcodec/imx_dump_header_bsf.o
正删除 libavcodec/intelh263dec.d
正删除 libavcodec/intelh263dec.o
正删除 libavcodec/ituh263dec.d
正删除 libavcodec/ituh263dec.o
正删除 libavcodec/jfdctfst.d
正删除 libavcodec/jfdctfst.o
正删除 libavcodec/jfdctint.d
正删除 libavcodec/jfdctint.o
正删除 libavcodec/jrevdct.d
正删除 libavcodec/jrevdct.o
正删除 libavcodec/kbdwin.d
正删除 libavcodec/kbdwin.o
正删除 libavcodec/latm_parser.d
正删除 libavcodec/latm_parser.o
正删除 libavcodec/libavcodec.a
正删除 libavcodec/libavcodec.pc
正删除 libavcodec/mathtables.d
正删除 libavcodec/mathtables.o
正删除 libavcodec/mdct_fixed.d
正删除 libavcodec/mdct_fixed.o
正删除 libavcodec/mdct_fixed_32.d
正删除 libavcodec/mdct_fixed_32.o
正删除 libavcodec/mdct_float.d
正删除 libavcodec/mdct_float.o
正删除 libavcodec/me_cmp.d
正删除 libavcodec/me_cmp.o
正删除 libavcodec/mp3_header_decompress_bsf.d
正删除 libavcodec/mp3_header_decompress_bsf.o
正删除 libavcodec/mpeg4_unpack_bframes_bsf.d
正删除 libavcodec/mpeg4_unpack_bframes_bsf.o
正删除 libavcodec/mpeg4audio.d
正删除 libavcodec/mpeg4audio.o
正删除 libavcodec/mpeg4video.d
正删除 libavcodec/mpeg4video.o
正删除 libavcodec/mpeg4videodec.d
正删除 libavcodec/mpeg4videodec.o
正删除 libavcodec/mpeg_er.d
正删除 libavcodec/mpeg_er.o
正删除 libavcodec/mpegaudio.d
正删除 libavcodec/mpegaudio.o
正删除 libavcodec/mpegaudio_parser.d
正删除 libavcodec/mpegaudio_parser.o
正删除 libavcodec/mpegaudiodata.d
正删除 libavcodec/mpegaudiodata.o
正删除 libavcodec/mpegaudiodec_fixed.d
正删除 libavcodec/mpegaudiodec_fixed.o
正删除 libavcodec/mpegaudiodec_float.d
正删除 libavcodec/mpegaudiodec_float.o
正删除 libavcodec/mpegaudiodecheader.d
正删除 libavcodec/mpegaudiodecheader.o
正删除 libavcodec/mpegaudiodsp.d
正删除 libavcodec/mpegaudiodsp.o
正删除 libavcodec/mpegaudiodsp_data.d
正删除 libavcodec/mpegaudiodsp_data.o
正删除 libavcodec/mpegaudiodsp_fixed.d
正删除 libavcodec/mpegaudiodsp_fixed.o
正删除 libavcodec/mpegaudiodsp_float.d
正删除 libavcodec/mpegaudiodsp_float.o
正删除 libavcodec/mpegpicture.d
正删除 libavcodec/mpegpicture.o
正删除 libavcodec/mpegutils.d
正删除 libavcodec/mpegutils.o
正删除 libavcodec/mpegvideo.d
正删除 libavcodec/mpegvideo.o
正删除 libavcodec/mpegvideo_motion.d
正删除 libavcodec/mpegvideo_motion.o
正删除 libavcodec/mpegvideodata.d
正删除 libavcodec/mpegvideodata.o
正删除 libavcodec/mpegvideodsp.d
正删除 libavcodec/mpegvideodsp.o
正删除 libavcodec/neon/mpegvideo.d
正删除 libavcodec/neon/mpegvideo.o
正删除 libavcodec/noise_bsf.d
正删除 libavcodec/noise_bsf.o
正删除 libavcodec/options.d
正删除 libavcodec/options.o
正删除 libavcodec/parser.d
正删除 libavcodec/parser.o
正删除 libavcodec/pixblockdsp.d
正删除 libavcodec/pixblockdsp.o
正删除 libavcodec/pthread.d
正删除 libavcodec/pthread.o
正删除 libavcodec/pthread_frame.d
正删除 libavcodec/pthread_frame.o
正删除 libavcodec/pthread_slice.d
正删除 libavcodec/pthread_slice.o
正删除 libavcodec/qpeldsp.d
正删除 libavcodec/qpeldsp.o
正删除 libavcodec/qsv_api.d
正删除 libavcodec/qsv_api.o
正删除 libavcodec/raw.d
正删除 libavcodec/raw.o
正删除 libavcodec/rdft.d
正删除 libavcodec/rdft.o
正删除 libavcodec/remove_extradata_bsf.d
正删除 libavcodec/remove_extradata_bsf.o
正删除 libavcodec/resample.d
正删除 libavcodec/resample.o
正删除 libavcodec/resample2.d
正删除 libavcodec/resample2.o
正删除 libavcodec/rl.d
正删除 libavcodec/rl.o
正删除 libavcodec/sbrdsp.d
正删除 libavcodec/sbrdsp.o
正删除 libavcodec/simple_idct.d
正删除 libavcodec/simple_idct.o
正删除 libavcodec/sinewin.d
正删除 libavcodec/sinewin.o
正删除 libavcodec/sinewin_fixed.d
正删除 libavcodec/sinewin_fixed.o
正删除 libavcodec/startcode.d
正删除 libavcodec/startcode.o
正删除 libavcodec/utils.d
正删除 libavcodec/utils.o
正删除 libavcodec/videodsp.d
正删除 libavcodec/videodsp.o
正删除 libavcodec/vorbis_parser.d
正删除 libavcodec/vorbis_parser.o
正删除 libavcodec/vp3dsp.d
正删除 libavcodec/vp3dsp.o
正删除 libavcodec/vp56.d
正删除 libavcodec/vp56.o
正删除 libavcodec/vp56data.d
正删除 libavcodec/vp56data.o
正删除 libavcodec/vp56dsp.d
正删除 libavcodec/vp56dsp.o
正删除 libavcodec/vp56rac.d
正删除 libavcodec/vp56rac.o
正删除 libavcodec/vp6.d
正删除 libavcodec/vp6.o
正删除 libavcodec/vp6dsp.d
正删除 libavcodec/vp6dsp.o
正删除 libavcodec/xiph.d
正删除 libavcodec/xiph.o
正删除 libavfilter/aeval.d
正删除 libavfilter/aeval.o
正删除 libavfilter/af_adelay.d
正删除 libavfilter/af_adelay.o
正删除 libavfilter/af_aecho.d
正删除 libavfilter/af_aecho.o
正删除 libavfilter/af_afade.d
正删除 libavfilter/af_afade.o
正删除 libavfilter/af_aformat.d
正删除 libavfilter/af_aformat.o
正删除 libavfilter/af_amerge.d
正删除 libavfilter/af_amerge.o
正删除 libavfilter/af_amix.d
正删除 libavfilter/af_amix.o
正删除 libavfilter/af_anull.d
正删除 libavfilter/af_anull.o
正删除 libavfilter/af_apad.d
正删除 libavfilter/af_apad.o
正删除 libavfilter/af_aphaser.d
正删除 libavfilter/af_aphaser.o
正删除 libavfilter/af_aresample.d
正删除 libavfilter/af_aresample.o
正删除 libavfilter/af_asetnsamples.d
正删除 libavfilter/af_asetnsamples.o
正删除 libavfilter/af_asetrate.d
正删除 libavfilter/af_asetrate.o
正删除 libavfilter/af_ashowinfo.d
正删除 libavfilter/af_ashowinfo.o
正删除 libavfilter/af_astats.d
正删除 libavfilter/af_astats.o
正删除 libavfilter/af_astreamsync.d
正删除 libavfilter/af_astreamsync.o
正删除 libavfilter/af_atempo.d
正删除 libavfilter/af_atempo.o
正删除 libavfilter/af_biquads.d
正删除 libavfilter/af_biquads.o
正删除 libavfilter/af_channelmap.d
正删除 libavfilter/af_channelmap.o
正删除 libavfilter/af_channelsplit.d
正删除 libavfilter/af_channelsplit.o
正删除 libavfilter/af_chorus.d
正删除 libavfilter/af_chorus.o
正删除 libavfilter/af_compand.d
正删除 libavfilter/af_compand.o
正删除 libavfilter/af_dcshift.d
正删除 libavfilter/af_dcshift.o
正删除 libavfilter/af_dynaudnorm.d
正删除 libavfilter/af_dynaudnorm.o
正删除 libavfilter/af_earwax.d
正删除 libavfilter/af_earwax.o
正删除 libavfilter/af_flanger.d
正删除 libavfilter/af_flanger.o
正删除 libavfilter/af_join.d
正删除 libavfilter/af_join.o
正删除 libavfilter/af_pan.d
正删除 libavfilter/af_pan.o
正删除 libavfilter/af_replaygain.d
正删除 libavfilter/af_replaygain.o
正删除 libavfilter/af_sidechaincompress.d
正删除 libavfilter/af_sidechaincompress.o
正删除 libavfilter/af_silencedetect.d
正删除 libavfilter/af_silencedetect.o
正删除 libavfilter/af_silenceremove.d
正删除 libavfilter/af_silenceremove.o
正删除 libavfilter/af_volume.d
正删除 libavfilter/af_volume.o
正删除 libavfilter/af_volumedetect.d
正删除 libavfilter/af_volumedetect.o
正删除 libavfilter/allfilters.d
正删除 libavfilter/allfilters.o
正删除 libavfilter/asink_anullsink.d
正删除 libavfilter/asink_anullsink.o
正删除 libavfilter/asrc_anullsrc.d
正删除 libavfilter/asrc_anullsrc.o
正删除 libavfilter/asrc_sine.d
正删除 libavfilter/asrc_sine.o
正删除 libavfilter/audio.d
正删除 libavfilter/audio.o
正删除 libavfilter/avcodec.d
正删除 libavfilter/avcodec.o
正删除 libavfilter/avf_aphasemeter.d
正删除 libavfilter/avf_aphasemeter.o
正删除 libavfilter/avf_avectorscope.d
正删除 libavfilter/avf_avectorscope.o
正删除 libavfilter/avf_concat.d
正删除 libavfilter/avf_concat.o
正删除 libavfilter/avf_showcqt.d
正删除 libavfilter/avf_showcqt.o
正删除 libavfilter/avf_showfreqs.d
正删除 libavfilter/avf_showfreqs.o
正删除 libavfilter/avf_showspectrum.d
正删除 libavfilter/avf_showspectrum.o
正删除 libavfilter/avf_showvolume.d
正删除 libavfilter/avf_showvolume.o
正删除 libavfilter/avf_showwaves.d
正删除 libavfilter/avf_showwaves.o
正删除 libavfilter/avfilter.d
正删除 libavfilter/avfilter.o
正删除 libavfilter/avfiltergraph.d
正删除 libavfilter/avfiltergraph.o
正删除 libavfilter/bbox.d
正删除 libavfilter/bbox.o
正删除 libavfilter/buffer.d
正删除 libavfilter/buffer.o
正删除 libavfilter/buffersink.d
正删除 libavfilter/buffersink.o
正删除 libavfilter/buffersrc.d
正删除 libavfilter/buffersrc.o
正删除 libavfilter/drawutils.d
正删除 libavfilter/drawutils.o
正删除 libavfilter/dualinput.d
正删除 libavfilter/dualinput.o
正删除 libavfilter/f_drawgraph.d
正删除 libavfilter/f_drawgraph.o
正删除 libavfilter/f_interleave.d
正删除 libavfilter/f_interleave.o
正删除 libavfilter/f_perms.d
正删除 libavfilter/f_perms.o
正删除 libavfilter/f_reverse.d
正删除 libavfilter/f_reverse.o
正删除 libavfilter/f_select.d
正删除 libavfilter/f_select.o
正删除 libavfilter/f_sendcmd.d
正删除 libavfilter/f_sendcmd.o
正删除 libavfilter/fifo.d
正删除 libavfilter/fifo.o
正删除 libavfilter/formats.d
正删除 libavfilter/formats.o
正删除 libavfilter/framesync.d
正删除 libavfilter/framesync.o
正删除 libavfilter/generate_wave_table.d
正删除 libavfilter/generate_wave_table.o
正删除 libavfilter/graphdump.d
正删除 libavfilter/graphdump.o
正删除 libavfilter/graphparser.d
正删除 libavfilter/graphparser.o
正删除 libavfilter/lavfutils.d
正删除 libavfilter/lavfutils.o
正删除 libavfilter/libavfilter.a
正删除 libavfilter/libavfilter.pc
正删除 libavfilter/lswsutils.d
正删除 libavfilter/lswsutils.o
正删除 libavfilter/opencl_allkernels.d
正删除 libavfilter/opencl_allkernels.o
正删除 libavfilter/pthread.d
正删除 libavfilter/pthread.o
正删除 libavfilter/setpts.d
正删除 libavfilter/setpts.o
正删除 libavfilter/settb.d
正删除 libavfilter/settb.o
正删除 libavfilter/split.d
正删除 libavfilter/split.o
正删除 libavfilter/src_movie.d
正删除 libavfilter/src_movie.o
正删除 libavfilter/transform.d
正删除 libavfilter/transform.o
正删除 libavfilter/trim.d
正删除 libavfilter/trim.o
正删除 libavfilter/vf_alphamerge.d
正删除 libavfilter/vf_alphamerge.o
正删除 libavfilter/vf_aspect.d
正删除 libavfilter/vf_aspect.o
正删除 libavfilter/vf_atadenoise.d
正删除 libavfilter/vf_atadenoise.o
正删除 libavfilter/vf_bbox.d
正删除 libavfilter/vf_bbox.o
正删除 libavfilter/vf_blackdetect.d
正删除 libavfilter/vf_blackdetect.o
正删除 libavfilter/vf_blend.d
正删除 libavfilter/vf_blend.o
正删除 libavfilter/vf_codecview.d
正删除 libavfilter/vf_codecview.o
正删除 libavfilter/vf_colorbalance.d
正删除 libavfilter/vf_colorbalance.o
正删除 libavfilter/vf_colorchannelmixer.d
正删除 libavfilter/vf_colorchannelmixer.o
正删除 libavfilter/vf_colorkey.d
正删除 libavfilter/vf_colorkey.o
正删除 libavfilter/vf_colorlevels.d
正删除 libavfilter/vf_colorlevels.o
正删除 libavfilter/vf_copy.d
正删除 libavfilter/vf_copy.o
正删除 libavfilter/vf_crop.d
正删除 libavfilter/vf_crop.o
正删除 libavfilter/vf_curves.d
正删除 libavfilter/vf_curves.o
正删除 libavfilter/vf_dctdnoiz.d
正删除 libavfilter/vf_dctdnoiz.o
正删除 libavfilter/vf_deband.d
正删除 libavfilter/vf_deband.o
正删除 libavfilter/vf_decimate.d
正删除 libavfilter/vf_decimate.o
正删除 libavfilter/vf_dejudder.d
正删除 libavfilter/vf_dejudder.o
正删除 libavfilter/vf_deshake.d
正删除 libavfilter/vf_deshake.o
正删除 libavfilter/vf_detelecine.d
正删除 libavfilter/vf_detelecine.o
正删除 libavfilter/vf_drawbox.d
正删除 libavfilter/vf_drawbox.o
正删除 libavfilter/vf_edgedetect.d
正删除 libavfilter/vf_edgedetect.o
正删除 libavfilter/vf_elbg.d
正删除 libavfilter/vf_elbg.o
正删除 libavfilter/vf_extractplanes.d
正删除 libavfilter/vf_extractplanes.o
正删除 libavfilter/vf_fade.d
正删除 libavfilter/vf_fade.o
正删除 libavfilter/vf_fftfilt.d
正删除 libavfilter/vf_fftfilt.o
正删除 libavfilter/vf_field.d
正删除 libavfilter/vf_field.o
正删除 libavfilter/vf_fieldmatch.d
正删除 libavfilter/vf_fieldmatch.o
正删除 libavfilter/vf_fieldorder.d
正删除 libavfilter/vf_fieldorder.o
正删除 libavfilter/vf_format.d
正删除 libavfilter/vf_format.o
正删除 libavfilter/vf_fps.d
正删除 libavfilter/vf_fps.o
正删除 libavfilter/vf_framepack.d
正删除 libavfilter/vf_framepack.o
正删除 libavfilter/vf_framerate.d
正删除 libavfilter/vf_framerate.o
正删除 libavfilter/vf_framestep.d
正删除 libavfilter/vf_framestep.o
正删除 libavfilter/vf_gradfun.d
正删除 libavfilter/vf_gradfun.o
正删除 libavfilter/vf_hflip.d
正删除 libavfilter/vf_hflip.o
正删除 libavfilter/vf_histogram.d
正删除 libavfilter/vf_histogram.o
正删除 libavfilter/vf_hqx.d
正删除 libavfilter/vf_hqx.o
正删除 libavfilter/vf_hue.d
正删除 libavfilter/vf_hue.o
正删除 libavfilter/vf_idet.d
正删除 libavfilter/vf_idet.o
正删除 libavfilter/vf_il.d
正删除 libavfilter/vf_il.o
正删除 libavfilter/vf_lenscorrection.d
正删除 libavfilter/vf_lenscorrection.o
正删除 libavfilter/vf_lut.d
正删除 libavfilter/vf_lut.o
正删除 libavfilter/vf_lut3d.d
正删除 libavfilter/vf_lut3d.o
正删除 libavfilter/vf_mergeplanes.d
正删除 libavfilter/vf_mergeplanes.o
正删除 libavfilter/vf_neighbor.d
正删除 libavfilter/vf_neighbor.o
正删除 libavfilter/vf_noise.d
正删除 libavfilter/vf_noise.o
正删除 libavfilter/vf_null.d
正删除 libavfilter/vf_null.o
正删除 libavfilter/vf_overlay.d
正删除 libavfilter/vf_overlay.o
正删除 libavfilter/vf_pad.d
正删除 libavfilter/vf_pad.o
正删除 libavfilter/vf_palettegen.d
正删除 libavfilter/vf_palettegen.o
正删除 libavfilter/vf_paletteuse.d
正删除 libavfilter/vf_paletteuse.o
正删除 libavfilter/vf_pixdesctest.d
正删除 libavfilter/vf_pixdesctest.o
正删除 libavfilter/vf_psnr.d
正删除 libavfilter/vf_psnr.o
正删除 libavfilter/vf_qp.d
正删除 libavfilter/vf_qp.o
正删除 libavfilter/vf_random.d
正删除 libavfilter/vf_random.o
正删除 libavfilter/vf_removegrain.d
正删除 libavfilter/vf_removegrain.o
正删除 libavfilter/vf_removelogo.d
正删除 libavfilter/vf_removelogo.o
正删除 libavfilter/vf_rotate.d
正删除 libavfilter/vf_rotate.o
正删除 libavfilter/vf_scale.d
正删除 libavfilter/vf_scale.o
正删除 libavfilter/vf_separatefields.d
正删除 libavfilter/vf_separatefields.o
正删除 libavfilter/vf_setfield.d
正删除 libavfilter/vf_setfield.o
正删除 libavfilter/vf_showinfo.d
正删除 libavfilter/vf_showinfo.o
正删除 libavfilter/vf_showpalette.d
正删除 libavfilter/vf_showpalette.o
正删除 libavfilter/vf_shuffleplanes.d
正删除 libavfilter/vf_shuffleplanes.o
正删除 libavfilter/vf_signalstats.d
正删除 libavfilter/vf_signalstats.o
正删除 libavfilter/vf_ssim.d
正删除 libavfilter/vf_ssim.o
正删除 libavfilter/vf_stack.d
正删除 libavfilter/vf_stack.o
正删除 libavfilter/vf_swapuv.d
正删除 libavfilter/vf_swapuv.o
正删除 libavfilter/vf_telecine.d
正删除 libavfilter/vf_telecine.o
正删除 libavfilter/vf_thumbnail.d
正删除 libavfilter/vf_thumbnail.o
正删除 libavfilter/vf_tile.d
正删除 libavfilter/vf_tile.o
正删除 libavfilter/vf_transpose.d
正删除 libavfilter/vf_transpose.o
正删除 libavfilter/vf_unsharp.d
正删除 libavfilter/vf_unsharp.o
正删除 libavfilter/vf_vectorscope.d
正删除 libavfilter/vf_vectorscope.o
正删除 libavfilter/vf_vflip.d
正删除 libavfilter/vf_vflip.o
正删除 libavfilter/vf_vignette.d
正删除 libavfilter/vf_vignette.o
正删除 libavfilter/vf_w3fdif.d
正删除 libavfilter/vf_w3fdif.o
正删除 libavfilter/vf_waveform.d
正删除 libavfilter/vf_waveform.o
正删除 libavfilter/vf_xbr.d
正删除 libavfilter/vf_xbr.o
正删除 libavfilter/vf_yadif.d
正删除 libavfilter/vf_yadif.o
正删除 libavfilter/vf_zoompan.d
正删除 libavfilter/vf_zoompan.o
正删除 libavfilter/video.d
正删除 libavfilter/video.o
正删除 libavfilter/vsink_nullsink.d
正删除 libavfilter/vsink_nullsink.o
正删除 libavfilter/vsrc_cellauto.d
正删除 libavfilter/vsrc_cellauto.o
正删除 libavfilter/vsrc_life.d
正删除 libavfilter/vsrc_life.o
正删除 libavfilter/vsrc_mandelbrot.d
正删除 libavfilter/vsrc_mandelbrot.o
正删除 libavfilter/vsrc_testsrc.d
正删除 libavfilter/vsrc_testsrc.o
正删除 libavformat/aacdec.d
正删除 libavformat/aacdec.o
正删除 libavformat/adtsenc.d
正删除 libavformat/adtsenc.o
正删除 libavformat/allformats.d
正删除 libavformat/allformats.o
正删除 libavformat/apetag.d
正删除 libavformat/apetag.o
正删除 libavformat/avc.d
正删除 libavformat/avc.o
正删除 libavformat/avio.d
正删除 libavformat/avio.o
正删除 libavformat/aviobuf.d
正删除 libavformat/aviobuf.o
正删除 libavformat/cache.d
正删除 libavformat/cache.o
正删除 libavformat/concat.d
正删除 libavformat/concat.o
正删除 libavformat/concatdec.d
正删除 libavformat/concatdec.o
正删除 libavformat/crypto.d
正删除 libavformat/crypto.o
正删除 libavformat/cutils.d
正删除 libavformat/cutils.o
正删除 libavformat/data_uri.d
正删除 libavformat/data_uri.o
正删除 libavformat/dump.d
正删除 libavformat/dump.o
正删除 libavformat/file.d
正删除 libavformat/file.o
正删除 libavformat/flvdec.d
正删除 libavformat/flvdec.o
正删除 libavformat/format.d
正删除 libavformat/format.o
正删除 libavformat/ftp.d
正删除 libavformat/ftp.o
正删除 libavformat/hevc.d
正删除 libavformat/hevc.o
正删除 libavformat/hls.d
正删除 libavformat/hls.o
正删除 libavformat/hlsproto.d
正删除 libavformat/hlsproto.o
正删除 libavformat/http.d
正删除 libavformat/http.o
正删除 libavformat/httpauth.d
正删除 libavformat/httpauth.o
正删除 libavformat/icecast.d
正删除 libavformat/icecast.o
正删除 libavformat/id3v1.d
正删除 libavformat/id3v1.o
正删除 libavformat/id3v2.d
正删除 libavformat/id3v2.o
正删除 libavformat/id3v2enc.d
正删除 libavformat/id3v2enc.o
正删除 libavformat/img2.d
正删除 libavformat/img2.o
正删除 libavformat/isom.d
正删除 libavformat/isom.o
正删除 libavformat/latmenc.d
正删除 libavformat/latmenc.o
正删除 libavformat/libavformat.a
正删除 libavformat/libavformat.pc
正删除 libavformat/loasdec.d
正删除 libavformat/loasdec.o
正删除 libavformat/m4vdec.d
正删除 libavformat/m4vdec.o
正删除 libavformat/md5proto.d
正删除 libavformat/md5proto.o
正删除 libavformat/metadata.d
正删除 libavformat/metadata.o
正删除 libavformat/mov.d
正删除 libavformat/mov.o
正删除 libavformat/mov_chan.d
正删除 libavformat/mov_chan.o
正删除 libavformat/movenc.d
正删除 libavformat/movenc.o
正删除 libavformat/movenchint.d
正删除 libavformat/movenchint.o
正删除 libavformat/mp3dec.d
正删除 libavformat/mp3dec.o
正删除 libavformat/mpeg.d
正删除 libavformat/mpeg.o
正删除 libavformat/mpegts.d
正删除 libavformat/mpegts.o
正删除 libavformat/mpegtsenc.d
正删除 libavformat/mpegtsenc.o
正删除 libavformat/mpegvideodec.d
正删除 libavformat/mpegvideodec.o
正删除 libavformat/mux.d
正删除 libavformat/mux.o
正删除 libavformat/network.d
正删除 libavformat/network.o
正删除 libavformat/options.d
正删除 libavformat/options.o
正删除 libavformat/os_support.d
正删除 libavformat/os_support.o
正删除 libavformat/rawdec.d
正删除 libavformat/rawdec.o
正删除 libavformat/rawenc.d
正删除 libavformat/rawenc.o
正删除 libavformat/replaygain.d
正删除 libavformat/replaygain.o
正删除 libavformat/riff.d
正删除 libavformat/riff.o
正删除 libavformat/riffdec.d
正删除 libavformat/riffdec.o
正删除 libavformat/riffenc.d
正删除 libavformat/riffenc.o
正删除 libavformat/rtmphttp.d
正删除 libavformat/rtmphttp.o
正删除 libavformat/rtmppkt.d
正删除 libavformat/rtmppkt.o
正删除 libavformat/rtmpproto.d
正删除 libavformat/rtmpproto.o
正删除 libavformat/rtp.d
正删除 libavformat/rtp.o
正删除 libavformat/rtpenc_chain.d
正删除 libavformat/rtpenc_chain.o
正删除 libavformat/sdp.d
正删除 libavformat/sdp.o
正删除 libavformat/subfile.d
正删除 libavformat/subfile.o
正删除 libavformat/tcp.d
正删除 libavformat/tcp.o
正删除 libavformat/udp.d
正删除 libavformat/udp.o
正删除 libavformat/url.d
正删除 libavformat/url.o
正删除 libavformat/urldecode.d
正删除 libavformat/urldecode.o
正删除 libavformat/utils.d
正删除 libavformat/utils.o
正删除 libavutil/aarch64/cpu.d
正删除 libavutil/aarch64/cpu.o
正删除 libavutil/aarch64/float_dsp_init.d
正删除 libavutil/aarch64/float_dsp_init.o
正删除 libavutil/aarch64/float_dsp_neon.d
正删除 libavutil/aarch64/float_dsp_neon.o
正删除 libavutil/adler32.d
正删除 libavutil/adler32.o
正删除 libavutil/aes.d
正删除 libavutil/aes.o
正删除 libavutil/audio_fifo.d
正删除 libavutil/audio_fifo.o
正删除 libavutil/avconfig.h
正删除 libavutil/avstring.d
正删除 libavutil/avstring.o
正删除 libavutil/base64.d
正删除 libavutil/base64.o
正删除 libavutil/blowfish.d
正删除 libavutil/blowfish.o
正删除 libavutil/bprint.d
正删除 libavutil/bprint.o
正删除 libavutil/buffer.d
正删除 libavutil/buffer.o
正删除 libavutil/camellia.d
正删除 libavutil/camellia.o
正删除 libavutil/cast5.d
正删除 libavutil/cast5.o
正删除 libavutil/channel_layout.d
正删除 libavutil/channel_layout.o
正删除 libavutil/color_utils.d
正删除 libavutil/color_utils.o
正删除 libavutil/cpu.d
正删除 libavutil/cpu.o
正删除 libavutil/crc.d
正删除 libavutil/crc.o
正删除 libavutil/des.d
正删除 libavutil/des.o
正删除 libavutil/dict.d
正删除 libavutil/dict.o
正删除 libavutil/display.d
正删除 libavutil/display.o
正删除 libavutil/downmix_info.d
正删除 libavutil/downmix_info.o
正删除 libavutil/error.d
正删除 libavutil/error.o
正删除 libavutil/eval.d
正删除 libavutil/eval.o
正删除 libavutil/ffversion.h
正删除 libavutil/fifo.d
正删除 libavutil/fifo.o
正删除 libavutil/file.d
正删除 libavutil/file.o
正删除 libavutil/file_open.d
正删除 libavutil/file_open.o
正删除 libavutil/fixed_dsp.d
正删除 libavutil/fixed_dsp.o
正删除 libavutil/float_dsp.d
正删除 libavutil/float_dsp.o
正删除 libavutil/frame.d
正删除 libavutil/frame.o
正删除 libavutil/hash.d
正删除 libavutil/hash.o
正删除 libavutil/hmac.d
正删除 libavutil/hmac.o
正删除 libavutil/imgutils.d
正删除 libavutil/imgutils.o
正删除 libavutil/intmath.d
正删除 libavutil/intmath.o
正删除 libavutil/lfg.d
正删除 libavutil/lfg.o
正删除 libavutil/libavutil.a
正删除 libavutil/libavutil.pc
正删除 libavutil/lls.d
正删除 libavutil/lls.o
正删除 libavutil/log.d
正删除 libavutil/log.o
正删除 libavutil/log2_tab.d
正删除 libavutil/log2_tab.o
正删除 libavutil/mathematics.d
正删除 libavutil/mathematics.o
正删除 libavutil/md5.d
正删除 libavutil/md5.o
正删除 libavutil/mem.d
正删除 libavutil/mem.o
正删除 libavutil/murmur3.d
正删除 libavutil/murmur3.o
正删除 libavutil/opt.d
正删除 libavutil/opt.o
正删除 libavutil/parseutils.d
正删除 libavutil/parseutils.o
正删除 libavutil/pixdesc.d
正删除 libavutil/pixdesc.o
正删除 libavutil/pixelutils.d
正删除 libavutil/pixelutils.o
正删除 libavutil/random_seed.d
正删除 libavutil/random_seed.o
正删除 libavutil/rational.d
正删除 libavutil/rational.o
正删除 libavutil/rc4.d
正删除 libavutil/rc4.o
正删除 libavutil/reverse.d
正删除 libavutil/reverse.o
正删除 libavutil/ripemd.d
正删除 libavutil/ripemd.o
正删除 libavutil/samplefmt.d
正删除 libavutil/samplefmt.o
正删除 libavutil/sha.d
正删除 libavutil/sha.o
正删除 libavutil/sha512.d
正删除 libavutil/sha512.o
正删除 libavutil/stereo3d.d
正删除 libavutil/stereo3d.o
正删除 libavutil/tea.d
正删除 libavutil/tea.o
正删除 libavutil/threadmessage.d
正删除 libavutil/threadmessage.o
正删除 libavutil/time.d
正删除 libavutil/time.o
正删除 libavutil/timecode.d
正删除 libavutil/timecode.o
正删除 libavutil/tree.d
正删除 libavutil/tree.o
正删除 libavutil/twofish.d
正删除 libavutil/twofish.o
正删除 libavutil/utils.d
正删除 libavutil/utils.o
正删除 libavutil/xga_font_data.d
正删除 libavutil/xga_font_data.o
正删除 libavutil/xtea.d
正删除 libavutil/xtea.o
正删除 libswresample/aarch64/audio_convert_init.d
正删除 libswresample/aarch64/audio_convert_init.o
正删除 libswresample/aarch64/audio_convert_neon.d
正删除 libswresample/aarch64/audio_convert_neon.o
正删除 libswresample/audioconvert.d
正删除 libswresample/audioconvert.o
正删除 libswresample/dither.d
正删除 libswresample/dither.o
正删除 libswresample/libswresample.a
正删除 libswresample/libswresample.pc
正删除 libswresample/options.d
正删除 libswresample/options.o
正删除 libswresample/rematrix.d
正删除 libswresample/rematrix.o
正删除 libswresample/resample.d
正删除 libswresample/resample.o
正删除 libswresample/resample_dsp.d
正删除 libswresample/resample_dsp.o
正删除 libswresample/swresample.d
正删除 libswresample/swresample.o
正删除 libswresample/swresample_frame.d
正删除 libswresample/swresample_frame.o
正删除 libswscale/alphablend.d
正删除 libswscale/alphablend.o
正删除 libswscale/gamma.d
正删除 libswscale/gamma.o
正删除 libswscale/hscale.d
正删除 libswscale/hscale.o
正删除 libswscale/hscale_fast_bilinear.d
正删除 libswscale/hscale_fast_bilinear.o
正删除 libswscale/input.d
正删除 libswscale/input.o
正删除 libswscale/libswscale.a
正删除 libswscale/libswscale.pc
正删除 libswscale/options.d
正删除 libswscale/options.o
正删除 libswscale/output.d
正删除 libswscale/output.o
正删除 libswscale/rgb2rgb.d
正删除 libswscale/rgb2rgb.o
正删除 libswscale/slice.d
正删除 libswscale/slice.o
正删除 libswscale/swscale.d
正删除 libswscale/swscale.o
正删除 libswscale/swscale_unscaled.d
正删除 libswscale/swscale_unscaled.o
正删除 libswscale/utils.d
正删除 libswscale/utils.o
正删除 libswscale/vscale.d
正删除 libswscale/vscale.o
正删除 libswscale/yuv2rgb.d
正删除 libswscale/yuv2rgb.o
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/contrib
[root@c7 contrib]# ./compile-ffmpeg.sh all
====================
[*] check archs
====================
FF_ALL_ARCHS = armv5 armv7a x86 arm64
FF_ACT_ARCHS = armv5 armv7a x86 arm64

====================
[*] check env armv5
====================
build on Linux x86_64
ANDROID_SDK=/home/zhangbin/android/sdk/android-sdk-linux
ANDROID_NDK=/home/zhangbin/android/NDK/android-ndk-r10e
NDKr10e-rc4 (64-bit) detected

--------------------
[*] make NDK standalone toolchain
--------------------
Copying prebuilt binaries...
Copying sysroot headers and libraries...
Copying c++ runtime headers and libraries...
Copying files to: /home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/contrib/build/ffmpeg-armv5/toolchain
Cleaning up...
Done.

--------------------
[*] check ffmpeg env
--------------------

--------------------
[*] configurate ffmpeg
--------------------
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/contrib/build/ffmpeg-armv5/toolchain/bin/arm-linux-androideabi-gcc
install prefix            /home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/contrib/build/ffmpeg-armv5/output
source path               .
C compiler                arm-linux-androideabi-gcc
C library                 bionic
host C compiler           gcc
host C library            glibc
ARCH                      arm (armv5te)
big-endian                no
runtime cpu detection     yes
ARMv5TE enabled           yes
ARMv6 enabled             yes
ARMv6T2 enabled           yes
VFP enabled               yes
NEON enabled              yes
THUMB enabled             no
debug symbols             yes
strip symbols             yes
optimize for size         no
optimizations             yes
static                    yes
shared                    no
postprocessing support    no
new filter support        yes
network support           yes
threading support         pthreads
safe bitstream reader     yes
SDL support               no
opencl enabled            no
texi2html enabled         no
perl enabled              yes
pod2man enabled           yes
makeinfo enabled          yes
makeinfo supports HTML    yes

Enabled programs:

External libraries:
zlib

Enabled decoders:
aac			h264			mp3on4
aac_latm		mp3			mp3on4float
flv			mp3adu			vp6
h263			mp3adufloat		vp6a
h263i			mp3float		vp6f
h263p

Enabled encoders:

Enabled hwaccels:

Enabled parsers:
aac			h263			mpegaudio
aac_latm		h264

Enabled demuxers:
aac			latm			mp3
concat			live_flv		mpegps
data			loas			mpegts
flv			m4v			mpegvideo
hls			mov

Enabled muxers:
adts			mov			mpegts
latm			mp4

Enabled protocols:
cache			hls			rtmp
concat			http			rtmpt
crypto			httpproxy		subfile
data			icecast			tcp
ffrtmphttp		md5			udp
file			pipe			udplite
ftp

Enabled filters:
acrossfade		dctdnoiz		paletteuse
adelay			deband			pan
adrawgraph		decimate		perms
aecho			deflate			pixdesctest
aeval			dejudder		psnr
aevalsrc		deshake			qp
afade			detelecine		random
aformat			dilation		removegrain
ainterleave		drawbox			removelogo
allpass			drawgraph		replaygain
allrgb			drawgrid		reverse
allyuv			dynaudnorm		rgbtestsrc
alphaextract		earwax			rotate
alphamerge		edgedetect		scale
amerge			elbg			scale2ref
amix			equalizer		select
amovie			erosion			sendcmd
anull			extractplanes		separatefields
anullsink		fade			setdar
anullsrc		fftfilt			setfield
apad			field			setpts
aperms			fieldmatch		setsar
aphasemeter		fieldorder		settb
aphaser			flanger			showcqt
aresample		format			showfreqs
areverse		fps			showinfo
aselect			framepack		showpalette
asendcmd		framerate		showspectrum
asetnsamples		framestep		showvolume
asetpts			gradfun			showwaves
asetrate		haldclut		showwavespic
asettb			haldclutsrc		shuffleplanes
ashowinfo		hflip			sidechaincompress
asplit			highpass		signalstats
astats			histogram		silencedetect
astreamsync		hqx			silenceremove
atadenoise		hstack			sine
atempo			hue			smptebars
atrim			idet			smptehdbars
avectorscope		il			split
bandpass		inflate			ssim
bandreject		interleave		swapuv
bass			join			tblend
bbox			lenscorrection		telecine
biquad			life			testsrc
blackdetect		lowpass			thumbnail
blend			lut			tile
cellauto		lut3d			transpose
channelmap		lutrgb			treble
channelsplit		lutyuv			trim
chorus			mandelbrot		unsharp
codecview		mergeplanes		vectorscope
color			movie			vflip
colorbalance		negate			vignette
colorchannelmixer	noformat		volume
colorkey		noise			volumedetect
colorlevels		null			vstack
compand			nullsink		w3fdif
concat			nullsrc			waveform
copy			overlay			xbr
crop			pad			yadif
curves			palettegen		zoompan
dcshift

Enabled bsfs:
aac_adtstoasc		hevc_mp4toannexb	mpeg4_unpack_bframes
chomp			imx_dump_header		noise
dump_extradata		mp3_header_decompress	remove_extradata
h264_mp4toannexb

Enabled indevs:

Enabled outdevs:

License: LGPL version 2.1 or later
Creating config.mak, config.h, and doc/config.texi...

WARNING: arm-linux-androideabi-pkg-config not found, library detection may fail.

--------------------
[*] compile ffmpeg
--------------------
CC	libavfilter/aeval.o
CC	libavfilter/af_adelay.o
CC	libavfilter/af_aecho.o
CC	libavfilter/af_afade.o
CC	libavfilter/af_aformat.o
CC	libavfilter/af_amerge.o
CC	libavfilter/af_amix.o
CC	libavfilter/af_anull.o
CC	libavfilter/af_apad.o
CC	libavfilter/af_aphaser.o
CC	libavfilter/af_aresample.o
CC	libavfilter/af_asetnsamples.o
CC	libavfilter/af_asetrate.o
CC	libavfilter/af_ashowinfo.o
CC	libavfilter/af_astats.o
CC	libavfilter/af_astreamsync.o
CC	libavfilter/af_atempo.o
CC	libavfilter/af_biquads.o
CC	libavfilter/af_channelmap.o
CC	libavfilter/af_channelsplit.o
CC	libavfilter/af_chorus.o
CC	libavfilter/af_compand.o
CC	libavfilter/af_dcshift.o
CC	libavfilter/af_dynaudnorm.o
CC	libavfilter/af_earwax.o
CC	libavfilter/af_flanger.o
CC	libavfilter/af_join.o
CC	libavfilter/af_pan.o
CC	libavfilter/af_replaygain.o
CC	libavfilter/af_sidechaincompress.o
CC	libavfilter/af_silencedetect.o
CC	libavfilter/af_silenceremove.o
CC	libavfilter/af_volume.o
CC	libavfilter/af_volumedetect.o
CC	libavfilter/allfilters.o
CC	libavfilter/asink_anullsink.o
CC	libavfilter/asrc_anullsrc.o
CC	libavfilter/asrc_sine.o
CC	libavfilter/audio.o
CC	libavfilter/avcodec.o
CC	libavfilter/avf_aphasemeter.o
CC	libavfilter/avf_avectorscope.o
CC	libavfilter/avf_concat.o
CC	libavfilter/avf_showcqt.o
CC	libavfilter/avf_showfreqs.o
CC	libavfilter/avf_showspectrum.o
CC	libavfilter/avf_showvolume.o
CC	libavfilter/avf_showwaves.o
CC	libavfilter/avfilter.o
CC	libavfilter/avfiltergraph.o
CC	libavfilter/bbox.o
CC	libavfilter/buffer.o
CC	libavfilter/buffersink.o
CC	libavfilter/buffersrc.o
libavfilter/buffersrc.c: In function 'av_buffersrc_buffer':
libavfilter/buffersrc.c:304:5: warning: 'av_buffersrc_add_ref' is deprecated (declared at libavfilter/buffersrc.c:205) [-Wdeprecated-declarations]
     return av_buffersrc_add_ref(ctx, buf, 0);
     ^
CC	libavfilter/drawutils.o
CC	libavfilter/dualinput.o
CC	libavfilter/f_drawgraph.o
CC	libavfilter/f_interleave.o
CC	libavfilter/f_perms.o
CC	libavfilter/f_reverse.o
CC	libavfilter/f_select.o
CC	libavfilter/f_sendcmd.o
CC	libavfilter/fifo.o
CC	libavfilter/formats.o
CC	libavfilter/framesync.o
CC	libavfilter/generate_wave_table.o
CC	libavfilter/graphdump.o
CC	libavfilter/graphparser.o
CC	libavfilter/lavfutils.o
CC	libavfilter/lswsutils.o
CC	libavfilter/opencl_allkernels.o
CC	libavfilter/pthread.o
CC	libavfilter/setpts.o
CC	libavfilter/settb.o
CC	libavfilter/split.o
CC	libavfilter/src_movie.o
CC	libavfilter/transform.o
CC	libavfilter/trim.o
CC	libavfilter/vf_alphamerge.o
CC	libavfilter/vf_aspect.o
CC	libavfilter/vf_atadenoise.o
CC	libavfilter/vf_bbox.o
CC	libavfilter/vf_blackdetect.o
CC	libavfilter/vf_blend.o
CC	libavfilter/vf_codecview.o
CC	libavfilter/vf_colorbalance.o
CC	libavfilter/vf_colorchannelmixer.o
CC	libavfilter/vf_colorkey.o
CC	libavfilter/vf_colorlevels.o
CC	libavfilter/vf_copy.o
CC	libavfilter/vf_crop.o
CC	libavfilter/vf_curves.o
CC	libavfilter/vf_dctdnoiz.o
CC	libavfilter/vf_deband.o
CC	libavfilter/vf_decimate.o
CC	libavfilter/vf_dejudder.o
CC	libavfilter/vf_deshake.o
CC	libavfilter/vf_detelecine.o
CC	libavfilter/vf_drawbox.o
CC	libavfilter/vf_edgedetect.o
CC	libavfilter/vf_elbg.o
CC	libavfilter/vf_extractplanes.o
CC	libavfilter/vf_fade.o
CC	libavfilter/vf_fftfilt.o
CC	libavfilter/vf_field.o
CC	libavfilter/vf_fieldmatch.o
CC	libavfilter/vf_fieldorder.o
CC	libavfilter/vf_format.o
CC	libavfilter/vf_fps.o
CC	libavfilter/vf_framepack.o
CC	libavfilter/vf_framerate.o
CC	libavfilter/vf_framestep.o
CC	libavfilter/vf_gradfun.o
CC	libavfilter/vf_hflip.o
CC	libavfilter/vf_hqx.o
CC	libavfilter/vf_histogram.o
CC	libavfilter/vf_hue.o
CC	libavfilter/vf_idet.o
CC	libavfilter/vf_il.o
CC	libavfilter/vf_lenscorrection.o
CC	libavfilter/vf_lut.o
CC	libavfilter/vf_lut3d.o
CC	libavfilter/vf_mergeplanes.o
CC	libavfilter/vf_neighbor.o
CC	libavfilter/vf_noise.o
CC	libavfilter/vf_null.o
CC	libavfilter/vf_overlay.o
CC	libavfilter/vf_pad.o
CC	libavfilter/vf_palettegen.o
CC	libavfilter/vf_paletteuse.o
CC	libavfilter/vf_pixdesctest.o
CC	libavfilter/vf_psnr.o
CC	libavfilter/vf_qp.o
CC	libavfilter/vf_random.o
CC	libavfilter/vf_removegrain.o
CC	libavfilter/vf_removelogo.o
CC	libavfilter/vf_rotate.o
CC	libavfilter/vf_scale.o
CC	libavfilter/vf_separatefields.o
CC	libavfilter/vf_setfield.o
CC	libavfilter/vf_showinfo.o
CC	libavfilter/vf_showpalette.o
CC	libavfilter/vf_shuffleplanes.o
CC	libavfilter/vf_signalstats.o
CC	libavfilter/vf_ssim.o
CC	libavfilter/vf_stack.o
CC	libavfilter/vf_swapuv.o
CC	libavfilter/vf_telecine.o
CC	libavfilter/vf_thumbnail.o
CC	libavfilter/vf_tile.o
CC	libavfilter/vf_transpose.o
CC	libavfilter/vf_unsharp.o
CC	libavfilter/vf_vectorscope.o
CC	libavfilter/vf_vflip.o
CC	libavfilter/vf_vignette.o
CC	libavfilter/vf_w3fdif.o
CC	libavfilter/vf_waveform.o
CC	libavfilter/vf_xbr.o
CC	libavfilter/vf_yadif.o
CC	libavfilter/vf_zoompan.o
CC	libavfilter/video.o
CC	libavfilter/vsink_nullsink.o
CC	libavfilter/vsrc_cellauto.o
CC	libavfilter/vsrc_life.o
CC	libavfilter/vsrc_mandelbrot.o
CC	libavfilter/vsrc_testsrc.o
CC	libavformat/aacdec.o
CC	libavformat/allformats.o
CC	libavformat/adtsenc.o
CC	libavformat/apetag.o
CC	libavformat/avc.o
CC	libavformat/avio.o
CC	libavformat/aviobuf.o
CC	libavformat/cache.o
CC	libavformat/concat.o
CC	libavformat/concatdec.o
CC	libavformat/crypto.o
CC	libavformat/data_uri.o
CC	libavformat/cutils.o
CC	libavformat/dump.o
CC	libavformat/file.o
CC	libavformat/flvdec.o
CC	libavformat/format.o
libavformat/format.c: In function 'av_probe_input_format3':
libavformat/format.c:178:17: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
         lpd.buf = zerobuffer;
                 ^
CC	libavformat/ftp.o
CC	libavformat/hevc.o
CC	libavformat/hls.o
libavformat/hls.c:501:12: warning: 'open_in' defined but not used [-Wunused-function]
 static int open_in(HLSContext *c, AVIOContext **in, const char *url)
            ^
CC	libavformat/hlsproto.o
CC	libavformat/http.o
CC	libavformat/httpauth.o
CC	libavformat/icecast.o
CC	libavformat/id3v1.o
CC	libavformat/id3v2.o
CC	libavformat/id3v2enc.o
CC	libavformat/img2.o
CC	libavformat/isom.o
CC	libavformat/latmenc.o
CC	libavformat/loasdec.o
CC	libavformat/md5proto.o
CC	libavformat/m4vdec.o
CC	libavformat/metadata.o
CC	libavformat/mov_chan.o
CC	libavformat/mov.o
CC	libavformat/movenc.o
libavformat/movenc.c: In function 'ff_mov_write_packet':
libavformat/movenc.c:4544:1: warning: label 'end' defined but not used [-Wunused-label]
 end:
 ^
libavformat/movenc.c: In function 'mov_flush_fragment':
libavformat/movenc.c:857:8: warning: assuming signed overflow does not occur when assuming that (X - c) > X is always false [-Wstrict-overflow]
     if (cluster_idx >= track->entry)
        ^
CC	libavformat/movenchint.o
CC	libavformat/mp3dec.o
CC	libavformat/mpeg.o
CC	libavformat/mpegtsenc.o
CC	libavformat/mpegts.o
CC	libavformat/mpegvideodec.o
CC	libavformat/mux.o
CC	libavformat/network.o
CC	libavformat/options.o
CC	libavformat/os_support.o
CC	libavformat/rawdec.o
CC	libavformat/rawenc.o
libavformat/rawenc.c:32:12: warning: 'force_one_stream' defined but not used [-Wunused-function]
 static int force_one_stream(AVFormatContext *s)
            ^
CC	libavformat/replaygain.o
CC	libavformat/riff.o
CC	libavformat/riffdec.o
CC	libavformat/riffenc.o
CC	libavformat/rtmppkt.o
CC	libavformat/rtmphttp.o
CC	libavformat/rtmpproto.o
CC	libavformat/rtp.o
CC	libavformat/rtpenc_chain.o
CC	libavformat/sdp.o
CC	libavformat/subfile.o
CC	libavformat/tcp.o
CC	libavformat/udp.o
CC	libavformat/url.o
CC	libavformat/urldecode.o
CC	libavcodec/aac_ac3_parser.o
CC	libavformat/utils.o
libavformat/utils.c: In function 'avformat_find_stream_info':
libavformat/utils.c:3118:9: warning: 'max_analyze_duration' is deprecated (declared at libavformat/avformat.h:1414) [-Wdeprecated-declarations]
         max_analyze_duration = ic->max_analyze_duration;
         ^
CC	libavcodec/aac_adtstoasc_bsf.o
CC	libavcodec/aac_parser.o
CC	libavcodec/aacadtsdec.o
CC	libavcodec/aacdec.o
CC	libavcodec/aacps_float.o
CC	libavcodec/aacpsdsp_float.o
CC	libavcodec/aacsbr.o
CC	libavcodec/aactab.o
CC	libavcodec/ac3tab.o
CC	libavcodec/allcodecs.o
CC	libavcodec/arm/aacpsdsp_init_arm.o
AS	libavcodec/arm/aacpsdsp_neon.o
CC	libavcodec/arm/blockdsp_init_arm.o
CC	libavcodec/arm/blockdsp_init_neon.o
AS	libavcodec/arm/blockdsp_neon.o
CC	libavcodec/arm/fft_fixed_init_arm.o
AS	libavcodec/arm/fft_fixed_neon.o
CC	libavcodec/arm/fft_init_arm.o
AS	libavcodec/arm/fft_neon.o
AS	libavcodec/arm/fft_vfp.o
CC	libavcodec/arm/h264chroma_init_arm.o
AS	libavcodec/arm/h264cmc_neon.o
CC	libavcodec/arm/h264dsp_init_arm.o
AS	libavcodec/arm/h264idct_neon.o
AS	libavcodec/arm/h264dsp_neon.o
CC	libavcodec/arm/h264pred_init_arm.o
AS	libavcodec/arm/h264pred_neon.o
AS	libavcodec/arm/h264qpel_neon.o
CC	libavcodec/arm/h264qpel_init_arm.o
AS	libavcodec/arm/hpeldsp_arm.o
AS	libavcodec/arm/hpeldsp_armv6.o
CC	libavcodec/arm/hpeldsp_init_arm.o
CC	libavcodec/arm/hpeldsp_init_armv6.o
CC	libavcodec/arm/hpeldsp_init_neon.o
AS	libavcodec/arm/hpeldsp_neon.o
AS	libavcodec/arm/idctdsp_armv6.o
AS	libavcodec/arm/idctdsp_arm.o
CC	libavcodec/arm/idctdsp_init_armv5te.o
CC	libavcodec/arm/idctdsp_init_arm.o
CC	libavcodec/arm/idctdsp_init_armv6.o
CC	libavcodec/arm/idctdsp_init_neon.o
AS	libavcodec/arm/idctdsp_neon.o
AS	libavcodec/arm/jrevdct_arm.o
AS	libavcodec/arm/mdct_fixed_neon.o
AS	libavcodec/arm/mdct_neon.o
AS	libavcodec/arm/me_cmp_armv6.o
AS	libavcodec/arm/mdct_vfp.o
AS	libavcodec/arm/mpegaudiodsp_fixed_armv6.o
CC	libavcodec/arm/mpegaudiodsp_init_arm.o
CC	libavcodec/arm/me_cmp_init_arm.o
CC	libavcodec/arm/mpegvideo_arm.o
CC	libavcodec/arm/mpegvideo_armv5te.o
AS	libavcodec/arm/mpegvideo_armv5te_s.o
AS	libavcodec/arm/pixblockdsp_armv6.o
AS	libavcodec/arm/mpegvideo_neon.o
CC	libavcodec/arm/pixblockdsp_init_arm.o
AS	libavcodec/arm/rdft_neon.o
CC	libavcodec/arm/sbrdsp_init_arm.o
AS	libavcodec/arm/sbrdsp_neon.o
AS	libavcodec/arm/simple_idct_arm.o
AS	libavcodec/arm/simple_idct_armv6.o
AS	libavcodec/arm/simple_idct_armv5te.o
AS	libavcodec/arm/simple_idct_neon.o
AS	libavcodec/arm/startcode_armv6.o
AS	libavcodec/arm/videodsp_armv5te.o
CC	libavcodec/arm/videodsp_init_arm.o
CC	libavcodec/arm/videodsp_init_armv5te.o
CC	libavcodec/arm/vp3dsp_init_arm.o
AS	libavcodec/arm/vp3dsp_neon.o
CC	libavcodec/arm/vp6dsp_init_arm.o
AS	libavcodec/arm/vp6dsp_neon.o
CC	libavcodec/audioconvert.o
CC	libavcodec/avdct.o
CC	libavcodec/avfft.o
CC	libavcodec/avpacket.o
CC	libavcodec/avpicture.o
CC	libavcodec/bitstream.o
CC	libavcodec/bitstream_filter.o
CC	libavcodec/blockdsp.o
CC	libavcodec/cabac.o
CC	libavcodec/chomp_bsf.o
CC	libavcodec/codec_desc.o
CC	libavcodec/dct.o
CC	libavcodec/dct32_fixed.o
CC	libavcodec/dct32_float.o
CC	libavcodec/dump_extradata_bsf.o
CC	libavcodec/elbg.o
CC	libavcodec/dv_profile.o
CC	libavcodec/error_resilience.o
CC	libavcodec/faandct.o
CC	libavcodec/faanidct.o
CC	libavcodec/fdctdsp.o
CC	libavcodec/fft_fixed.o
CC	libavcodec/fft_fixed_32.o
CC	libavcodec/fft_float.o
CC	libavcodec/fft_init_table.o
CC	libavcodec/flvdec.o
CC	libavcodec/golomb.o
CC	libavcodec/h263.o
CC	libavcodec/h263_parser.o
CC	libavcodec/h263data.o
CC	libavcodec/h263dec.o
CC	libavcodec/h263dsp.o
CC	libavcodec/h264.o
CC	libavcodec/h264_cabac.o
CC	libavcodec/h264_cavlc.o
libavcodec/h264_cavlc.c: In function 'decode_residual.isra.18':
libavcodec/h264_cavlc.c:605:46: warning: array subscript is above array bounds [-Warray-bounds]
             ((type*)block)[*scantable]= level[i]; \
                                              ^
libavcodec/h264_cavlc.c:625:9: note: in expansion of macro 'STORE_BLOCK'
         STORE_BLOCK(int32_t)
         ^
libavcodec/h264_cavlc.c:605:46: warning: array subscript is above array bounds [-Warray-bounds]
             ((type*)block)[*scantable]= level[i]; \
                                              ^
libavcodec/h264_cavlc.c:627:9: note: in expansion of macro 'STORE_BLOCK'
         STORE_BLOCK(int16_t)
         ^
CC	libavcodec/h264_direct.o
CC	libavcodec/h264_loopfilter.o
CC	libavcodec/h264_mb.o
CC	libavcodec/h264_mp4toannexb_bsf.o
CC	libavcodec/h264_parser.o
CC	libavcodec/h264_picture.o
CC	libavcodec/h264_ps.o
CC	libavcodec/h264_refs.o
CC	libavcodec/h264_sei.o
CC	libavcodec/h264_slice.o
CC	libavcodec/h264chroma.o
CC	libavcodec/h264dsp.o
CC	libavcodec/h264idct.o
CC	libavcodec/h264pred.o
CC	libavcodec/h264qpel.o
CC	libavcodec/hevc_mp4toannexb_bsf.o
libavcodec/hevc_mp4toannexb_bsf.c: In function 'hevc_mp4toannexb_filter':
libavcodec/hevc_mp4toannexb_bsf.c:137:27: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
             *poutbuf      = buf;
                           ^
CC	libavcodec/hpeldsp.o
CC	libavcodec/huffman.o
CC	libavcodec/idctdsp.o
CC	libavcodec/imdct15.o
CC	libavcodec/imgconvert.o
CC	libavcodec/imx_dump_header_bsf.o
CC	libavcodec/intelh263dec.o
CC	libavcodec/ituh263dec.o
CC	libavcodec/jfdctfst.o
CC	libavcodec/jfdctint.o
CC	libavcodec/jrevdct.o
CC	libavcodec/kbdwin.o
CC	libavcodec/latm_parser.o
CC	libavcodec/mathtables.o
CC	libavcodec/mdct_fixed.o
CC	libavcodec/mdct_fixed_32.o
CC	libavcodec/mdct_float.o
CC	libavcodec/me_cmp.o
CC	libavcodec/mp3_header_decompress_bsf.o
CC	libavcodec/mpeg4_unpack_bframes_bsf.o
CC	libavcodec/mpeg4audio.o
CC	libavcodec/mpeg4video.o
CC	libavcodec/mpeg4videodec.o
CC	libavcodec/mpeg_er.o
CC	libavcodec/mpegaudio.o
CC	libavcodec/mpegaudio_parser.o
CC	libavcodec/mpegaudiodata.o
CC	libavcodec/mpegaudiodec_float.o
CC	libavcodec/mpegaudiodec_fixed.o
CC	libavcodec/mpegaudiodecheader.o
CC	libavcodec/mpegaudiodsp.o
CC	libavcodec/mpegaudiodsp_fixed.o
CC	libavcodec/mpegaudiodsp_data.o
CC	libavcodec/mpegaudiodsp_float.o
CC	libavcodec/mpegpicture.o
CC	libavcodec/mpegutils.o
CC	libavcodec/mpegvideo.o
CC	libavcodec/mpegvideo_motion.o
CC	libavcodec/mpegvideodata.o
CC	libavcodec/mpegvideodsp.o
CC	libavcodec/noise_bsf.o
CC	libavcodec/options.o
libavcodec/options.c: In function 'avcodec_copy_context':
libavcodec/options.c:202:5: warning: passing argument 2 of 'av_opt_copy' discards 'const' qualifier from pointer target type [enabled by default]
     av_opt_copy(dest, src);
     ^
In file included from libavcodec/options.c:32:0:
./libavutil/opt.h:838:5: note: expected 'void *' but argument is of type 'const struct AVCodecContext *'
 int av_opt_copy(void *dest, FF_CONST_AVUTIL55 void *src);
     ^
CC	libavcodec/parser.o
CC	libavcodec/pixblockdsp.o
CC	libavcodec/pthread.o
CC	libavcodec/pthread_frame.o
CC	libavcodec/pthread_slice.o
CC	libavcodec/qsv_api.o
CC	libavcodec/qpeldsp.o
CC	libavcodec/raw.o
CC	libavcodec/rdft.o
CC	libavcodec/remove_extradata_bsf.o
CC	libavcodec/resample.o
CC	libavcodec/resample2.o
CC	libavcodec/rl.o
CC	libavcodec/sbrdsp.o
CC	libavcodec/simple_idct.o
CC	libavcodec/sinewin.o
CC	libavcodec/sinewin_fixed.o
CC	libavcodec/startcode.o
CC	libavcodec/utils.o
CC	libavcodec/videodsp.o
CC	libavcodec/vp3dsp.o
CC	libavcodec/vorbis_parser.o
CC	libavcodec/vp56data.o
CC	libavcodec/vp56.o
CC	libavcodec/vp56dsp.o
CC	libavcodec/vp56rac.o
CC	libavcodec/vp6.o
CC	libavcodec/vp6dsp.o
CC	libavcodec/xiph.o
CC	libswresample/arm/audio_convert_init.o
AS	libswresample/arm/audio_convert_neon.o
CC	libswresample/audioconvert.o
CC	libswresample/dither.o
CC	libswresample/options.o
CC	libswresample/rematrix.o
CC	libswresample/resample.o
CC	libswresample/resample_dsp.o
CC	libswresample/swresample.o
CC	libswresample/swresample_frame.o
CC	libswscale/alphablend.o
CC	libswscale/gamma.o
CC	libswscale/hscale.o
CC	libswscale/hscale_fast_bilinear.o
CC	libswscale/input.o
CC	libswscale/options.o
CC	libswscale/output.o
libswscale/output.c:1172:21: warning: 'yuv2rgba64be_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, rgba64be, AV_PIX_FMT_RGBA64BE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1172:21: warning: 'yuv2rgba64be_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, rgba64be, AV_PIX_FMT_RGBA64BE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1172:21: warning: 'yuv2rgba64be_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, rgba64be, AV_PIX_FMT_RGBA64BE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1173:21: warning: 'yuv2rgba64le_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, rgba64le, AV_PIX_FMT_RGBA64LE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1173:21: warning: 'yuv2rgba64le_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, rgba64le, AV_PIX_FMT_RGBA64LE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1173:21: warning: 'yuv2rgba64le_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, rgba64le, AV_PIX_FMT_RGBA64LE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1176:21: warning: 'yuv2bgra64be_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, bgra64be, AV_PIX_FMT_BGRA64BE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1176:21: warning: 'yuv2bgra64be_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, bgra64be, AV_PIX_FMT_BGRA64BE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1176:21: warning: 'yuv2bgra64be_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, bgra64be, AV_PIX_FMT_BGRA64BE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1177:21: warning: 'yuv2bgra64le_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, bgra64le, AV_PIX_FMT_BGRA64LE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1177:21: warning: 'yuv2bgra64le_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, bgra64le, AV_PIX_FMT_BGRA64LE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1177:21: warning: 'yuv2bgra64le_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, bgra64le, AV_PIX_FMT_BGRA64LE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1185:21: warning: 'yuv2rgba64be_full_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, rgba64be_full, AV_PIX_FMT_RGBA64BE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1185:21: warning: 'yuv2rgba64be_full_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, rgba64be_full, AV_PIX_FMT_RGBA64BE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1185:21: warning: 'yuv2rgba64be_full_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, rgba64be_full, AV_PIX_FMT_RGBA64BE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1186:21: warning: 'yuv2rgba64le_full_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, rgba64le_full, AV_PIX_FMT_RGBA64LE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1186:21: warning: 'yuv2rgba64le_full_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, rgba64le_full, AV_PIX_FMT_RGBA64LE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1186:21: warning: 'yuv2rgba64le_full_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, rgba64le_full, AV_PIX_FMT_RGBA64LE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1189:21: warning: 'yuv2bgra64be_full_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, bgra64be_full, AV_PIX_FMT_BGRA64BE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1189:21: warning: 'yuv2bgra64be_full_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, bgra64be_full, AV_PIX_FMT_BGRA64BE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1189:21: warning: 'yuv2bgra64be_full_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, bgra64be_full, AV_PIX_FMT_BGRA64BE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1190:21: warning: 'yuv2bgra64le_full_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, bgra64le_full, AV_PIX_FMT_BGRA64LE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1190:21: warning: 'yuv2bgra64le_full_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, bgra64le_full, AV_PIX_FMT_BGRA64LE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1190:21: warning: 'yuv2bgra64le_full_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, bgra64le_full, AV_PIX_FMT_BGRA64LE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
CC	libswscale/rgb2rgb.o
CC	libswscale/slice.o
CC	libswscale/swscale.o
libswscale/swscale.c: In function 'swscale':
libswscale/swscale.c:382:9: warning: unused variable 'perform_gamma' [-Wunused-variable]
     int perform_gamma = c->is_internal_gamma;
         ^
libswscale/swscale.c: At top level:
libswscale/swscale.c:55:13: warning: 'gamma_convert' defined but not used [-Wunused-function]
 static void gamma_convert(uint8_t * src[], int width, uint16_t *gamma)
             ^
CC	libswscale/swscale_unscaled.o
CC	libswscale/vscale.o
CC	libswscale/utils.o
CC	libswscale/yuv2rgb.o
CC	libavutil/../compat/strtod.o
libavutil/../compat/strtod.c: In function 'avpriv_strtod':
libavutil/../compat/strtod.c:55:13: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
         end = nptr + 8;
             ^
libavutil/../compat/strtod.c:58:13: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
         end = nptr + 3;
             ^
libavutil/../compat/strtod.c:61:13: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
         end = nptr + 9;
             ^
libavutil/../compat/strtod.c:64:13: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
         end = nptr + 4;
             ^
libavutil/../compat/strtod.c:67:13: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
         end = nptr + 9;
             ^
libavutil/../compat/strtod.c:70:13: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
         end = nptr + 4;
             ^
libavutil/../compat/strtod.c:73:9: warning: passing argument 1 of 'check_nan_suffix' discards 'const' qualifier from pointer target type [enabled by default]
         end = check_nan_suffix(nptr + 3);
         ^
libavutil/../compat/strtod.c:28:14: note: expected 'char *' but argument is of type 'const char *'
 static char *check_nan_suffix(char *s)
              ^
libavutil/../compat/strtod.c:77:9: warning: passing argument 1 of 'check_nan_suffix' discards 'const' qualifier from pointer target type [enabled by default]
         end = check_nan_suffix(nptr + 4);
         ^
libavutil/../compat/strtod.c:28:14: note: expected 'char *' but argument is of type 'const char *'
 static char *check_nan_suffix(char *s)
              ^
CC	libavutil/adler32.o
CC	libavutil/arm/cpu.o
CC	libavutil/aes.o
CC	libavutil/arm/float_dsp_init_arm.o
CC	libavutil/arm/float_dsp_init_neon.o
CC	libavutil/arm/float_dsp_init_vfp.o
AS	libavutil/arm/float_dsp_neon.o
AS	libavutil/arm/float_dsp_vfp.o
CC	libavutil/audio_fifo.o
CC	libavutil/avstring.o
CC	libavutil/base64.o
CC	libavutil/blowfish.o
CC	libavutil/bprint.o
CC	libavutil/buffer.o
CC	libavutil/camellia.o
CC	libavutil/cast5.o
CC	libavutil/channel_layout.o
CC	libavutil/color_utils.o
CC	libavutil/cpu.o
CC	libavutil/crc.o
CC	libavutil/des.o
CC	libavutil/dict.o
CC	libavutil/display.o
CC	libavutil/downmix_info.o
CC	libavutil/error.o
CC	libavutil/eval.o
CC	libavutil/fifo.o
CC	libavutil/file.o
CC	libavutil/file_open.o
CC	libavutil/fixed_dsp.o
CC	libavutil/float_dsp.o
CC	libavutil/frame.o
libavutil/frame.c: In function 'av_frame_set_qp_table':
libavutil/frame.c:55:5: warning: 'qscale_table' is deprecated (declared at libavutil/frame.h:293) [-Wdeprecated-declarations]
     f->qscale_table = buf->data;
     ^
libavutil/frame.c:56:5: warning: 'qstride' is deprecated (declared at libavutil/frame.h:298) [-Wdeprecated-declarations]
     f->qstride      = stride;
     ^
libavutil/frame.c:57:5: warning: 'qscale_type' is deprecated (declared at libavutil/frame.h:301) [-Wdeprecated-declarations]
     f->qscale_type  = qp_type;
     ^
libavutil/frame.c: In function 'av_frame_get_qp_table':
libavutil/frame.c:64:5: warning: 'qstride' is deprecated (declared at libavutil/frame.h:298) [-Wdeprecated-declarations]
     *stride = f->qstride;
     ^
libavutil/frame.c:65:5: warning: 'qscale_type' is deprecated (declared at libavutil/frame.h:301) [-Wdeprecated-declarations]
     *type   = f->qscale_type;
     ^
libavutil/frame.c: In function 'frame_copy_props':
libavutil/frame.c:350:5: warning: 'qscale_table' is deprecated (declared at libavutil/frame.h:293) [-Wdeprecated-declarations]
     dst->qscale_table = NULL;
     ^
libavutil/frame.c:351:5: warning: 'qstride' is deprecated (declared at libavutil/frame.h:298) [-Wdeprecated-declarations]
     dst->qstride      = 0;
     ^
libavutil/frame.c:352:5: warning: 'qscale_type' is deprecated (declared at libavutil/frame.h:301) [-Wdeprecated-declarations]
     dst->qscale_type  = 0;
     ^
libavutil/frame.c:356:13: warning: 'qscale_table' is deprecated (declared at libavutil/frame.h:293) [-Wdeprecated-declarations]
             dst->qscale_table = dst->qp_table_buf->data;
             ^
libavutil/frame.c:357:13: warning: 'qstride' is deprecated (declared at libavutil/frame.h:298) [-Wdeprecated-declarations]
             dst->qstride      = src->qstride;
             ^
libavutil/frame.c:357:13: warning: 'qstride' is deprecated (declared at libavutil/frame.h:298) [-Wdeprecated-declarations]
libavutil/frame.c:358:13: warning: 'qscale_type' is deprecated (declared at libavutil/frame.h:301) [-Wdeprecated-declarations]
             dst->qscale_type  = src->qscale_type;
             ^
libavutil/frame.c:358:13: warning: 'qscale_type' is deprecated (declared at libavutil/frame.h:301) [-Wdeprecated-declarations]
CC	libavutil/hash.o
CC	libavutil/hmac.o
CC	libavutil/imgutils.o
CC	libavutil/intmath.o
CC	libavutil/lfg.o
CC	libavutil/lls.o
CC	libavutil/log.o
CC	libavutil/log2_tab.o
CC	libavutil/mathematics.o
CC	libavutil/md5.o
CC	libavutil/mem.o
CC	libavutil/murmur3.o
CC	libavutil/opt.o
CC	libavutil/parseutils.o
CC	libavutil/pixdesc.o
CC	libavutil/pixelutils.o
CC	libavutil/random_seed.o
CC	libavutil/rational.o
CC	libavutil/rc4.o
CC	libavutil/reverse.o
CC	libavutil/ripemd.o
CC	libavutil/samplefmt.o
CC	libavutil/sha.o
CC	libavutil/sha512.o
CC	libavutil/stereo3d.o
CC	libavutil/tea.o
CC	libavutil/threadmessage.o
CC	libavutil/time.o
CC	libavutil/timecode.o
CC	libavutil/tree.o
CC	libavutil/twofish.o
CC	libavutil/utils.o
CC	libavutil/xga_font_data.o
CC	libavutil/xtea.o
AR	libavfilter/libavfilter.a
AR	libavformat/libavformat.a
AR	libavcodec/libavcodec.a
AR	libswresample/libswresample.a
AR	libswscale/libswscale.a
AR	libavutil/libavutil.a
INSTALL	libavfilter/libavfilter.a
INSTALL	libavformat/libavformat.a
INSTALL	libavcodec/libavcodec.a
INSTALL	libswresample/libswresample.a
INSTALL	libswscale/libswscale.a
INSTALL	libavutil/libavutil.a
INSTALL	libavfilter/asrc_abuffer.h
INSTALL	libavfilter/avcodec.h
INSTALL	libavfilter/avfilter.h
INSTALL	libavfilter/avfiltergraph.h
INSTALL	libavfilter/buffersink.h
INSTALL	libavfilter/buffersrc.h
INSTALL	libavfilter/version.h
INSTALL	libavfilter/libavfilter.pc
INSTALL	libavformat/avformat.h
INSTALL	libavformat/avio.h
INSTALL	libavformat/version.h
INSTALL	libavformat/avc.h
INSTALL	libavformat/url.h
INSTALL	libavformat/internal.h
INSTALL	libavformat/libavformat.pc
INSTALL	libavcodec/avcodec.h
INSTALL	libavcodec/avfft.h
INSTALL	libavcodec/dv_profile.h
INSTALL	libavcodec/d3d11va.h
INSTALL	libavcodec/dxva2.h
INSTALL	libavcodec/old_codec_ids.h
INSTALL	libavcodec/qsv.h
INSTALL	libavcodec/vaapi.h
INSTALL	libavcodec/vda.h
INSTALL	libavcodec/vdpau.h
INSTALL	libavcodec/version.h
INSTALL	libavcodec/videotoolbox.h
INSTALL	libavcodec/vorbis_parser.h
INSTALL	libavcodec/xvmc.h
INSTALL	libavcodec/libavcodec.pc
INSTALL	libswresample/swresample.h
INSTALL	libswresample/version.h
INSTALL	libswresample/libswresample.pc
INSTALL	libswscale/swscale.h
INSTALL	libswscale/version.h
INSTALL	libswscale/libswscale.pc
INSTALL	libavutil/adler32.h
INSTALL	libavutil/aes.h
INSTALL	libavutil/attributes.h
INSTALL	libavutil/audio_fifo.h
INSTALL	libavutil/audioconvert.h
INSTALL	libavutil/avassert.h
INSTALL	libavutil/avstring.h
INSTALL	libavutil/avutil.h
INSTALL	libavutil/base64.h
INSTALL	libavutil/blowfish.h
INSTALL	libavutil/bprint.h
INSTALL	libavutil/bswap.h
INSTALL	libavutil/buffer.h
INSTALL	libavutil/cast5.h
INSTALL	libavutil/camellia.h
INSTALL	libavutil/channel_layout.h
INSTALL	libavutil/common.h
INSTALL	libavutil/cpu.h
INSTALL	libavutil/crc.h
INSTALL	libavutil/display.h
INSTALL	libavutil/downmix_info.h
INSTALL	libavutil/error.h
INSTALL	libavutil/eval.h
INSTALL	libavutil/fifo.h
INSTALL	libavutil/file.h
INSTALL	libavutil/frame.h
INSTALL	libavutil/hash.h
INSTALL	libavutil/hmac.h
INSTALL	libavutil/imgutils.h
INSTALL	libavutil/intfloat.h
INSTALL	libavutil/intreadwrite.h
INSTALL	libavutil/lfg.h
INSTALL	libavutil/log.h
INSTALL	libavutil/macros.h
INSTALL	libavutil/mathematics.h
INSTALL	libavutil/md5.h
INSTALL	libavutil/mem.h
INSTALL	libavutil/motion_vector.h
INSTALL	libavutil/murmur3.h
INSTALL	libavutil/dict.h
INSTALL	libavutil/old_pix_fmts.h
INSTALL	libavutil/opt.h
INSTALL	libavutil/parseutils.h
INSTALL	libavutil/pixdesc.h
INSTALL	libavutil/pixelutils.h
INSTALL	libavutil/pixfmt.h
INSTALL	libavutil/random_seed.h
INSTALL	libavutil/replaygain.h
INSTALL	libavutil/rational.h
INSTALL	libavutil/ripemd.h
INSTALL	libavutil/samplefmt.h
INSTALL	libavutil/sha.h
INSTALL	libavutil/sha512.h
INSTALL	libavutil/stereo3d.h
INSTALL	libavutil/threadmessage.h
INSTALL	libavutil/time.h
INSTALL	libavutil/timecode.h
INSTALL	libavutil/timestamp.h
INSTALL	libavutil/twofish.h
INSTALL	libavutil/version.h
INSTALL	libavutil/xtea.h
INSTALL	libavutil/tea.h
INSTALL	libavutil/thread.h
INSTALL	libavutil/avconfig.h
INSTALL	libavutil/ffversion.h
INSTALL	libavutil/libavutil.pc

--------------------
[*] link ffmpeg
--------------------


--------------------
[*] create files for shared ffmpeg
--------------------
====================
[*] check env armv7a
====================
build on Linux x86_64
ANDROID_SDK=/home/zhangbin/android/sdk/android-sdk-linux
ANDROID_NDK=/home/zhangbin/android/NDK/android-ndk-r10e
NDKr10e-rc4 (64-bit) detected

--------------------
[*] make NDK standalone toolchain
--------------------
Copying prebuilt binaries...
Copying sysroot headers and libraries...
Copying c++ runtime headers and libraries...
Copying files to: /home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/contrib/build/ffmpeg-armv7a/toolchain
Cleaning up...
Done.

--------------------
[*] check ffmpeg env
--------------------

--------------------
[*] configurate ffmpeg
--------------------
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/contrib/build/ffmpeg-armv7a/toolchain/bin/arm-linux-androideabi-gcc
install prefix            /home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/contrib/build/ffmpeg-armv7a/output
source path               .
C compiler                arm-linux-androideabi-gcc
C library                 bionic
host C compiler           gcc
host C library            glibc
ARCH                      arm (cortex-a8)
big-endian                no
runtime cpu detection     yes
ARMv5TE enabled           yes
ARMv6 enabled             yes
ARMv6T2 enabled           yes
VFP enabled               yes
NEON enabled              yes
THUMB enabled             yes
debug symbols             yes
strip symbols             yes
optimize for size         no
optimizations             yes
static                    yes
shared                    no
postprocessing support    no
new filter support        yes
network support           yes
threading support         pthreads
safe bitstream reader     yes
SDL support               no
opencl enabled            no
texi2html enabled         no
perl enabled              yes
pod2man enabled           yes
makeinfo enabled          yes
makeinfo supports HTML    yes

Enabled programs:

External libraries:
zlib

Enabled decoders:
aac			h264			mp3on4
aac_latm		mp3			mp3on4float
flv			mp3adu			vp6
h263			mp3adufloat		vp6a
h263i			mp3float		vp6f
h263p

Enabled encoders:

Enabled hwaccels:

Enabled parsers:
aac			h263			mpegaudio
aac_latm		h264

Enabled demuxers:
aac			latm			mp3
concat			live_flv		mpegps
data			loas			mpegts
flv			m4v			mpegvideo
hls			mov

Enabled muxers:
adts			mov			mpegts
latm			mp4

Enabled protocols:
cache			hls			rtmp
concat			http			rtmpt
crypto			httpproxy		subfile
data			icecast			tcp
ffrtmphttp		md5			udp
file			pipe			udplite
ftp

Enabled filters:
acrossfade		dctdnoiz		paletteuse
adelay			deband			pan
adrawgraph		decimate		perms
aecho			deflate			pixdesctest
aeval			dejudder		psnr
aevalsrc		deshake			qp
afade			detelecine		random
aformat			dilation		removegrain
ainterleave		drawbox			removelogo
allpass			drawgraph		replaygain
allrgb			drawgrid		reverse
allyuv			dynaudnorm		rgbtestsrc
alphaextract		earwax			rotate
alphamerge		edgedetect		scale
amerge			elbg			scale2ref
amix			equalizer		select
amovie			erosion			sendcmd
anull			extractplanes		separatefields
anullsink		fade			setdar
anullsrc		fftfilt			setfield
apad			field			setpts
aperms			fieldmatch		setsar
aphasemeter		fieldorder		settb
aphaser			flanger			showcqt
aresample		format			showfreqs
areverse		fps			showinfo
aselect			framepack		showpalette
asendcmd		framerate		showspectrum
asetnsamples		framestep		showvolume
asetpts			gradfun			showwaves
asetrate		haldclut		showwavespic
asettb			haldclutsrc		shuffleplanes
ashowinfo		hflip			sidechaincompress
asplit			highpass		signalstats
astats			histogram		silencedetect
astreamsync		hqx			silenceremove
atadenoise		hstack			sine
atempo			hue			smptebars
atrim			idet			smptehdbars
avectorscope		il			split
bandpass		inflate			ssim
bandreject		interleave		swapuv
bass			join			tblend
bbox			lenscorrection		telecine
biquad			life			testsrc
blackdetect		lowpass			thumbnail
blend			lut			tile
cellauto		lut3d			transpose
channelmap		lutrgb			treble
channelsplit		lutyuv			trim
chorus			mandelbrot		unsharp
codecview		mergeplanes		vectorscope
color			movie			vflip
colorbalance		negate			vignette
colorchannelmixer	noformat		volume
colorkey		noise			volumedetect
colorlevels		null			vstack
compand			nullsink		w3fdif
concat			nullsrc			waveform
copy			overlay			xbr
crop			pad			yadif
curves			palettegen		zoompan
dcshift

Enabled bsfs:
aac_adtstoasc		hevc_mp4toannexb	mpeg4_unpack_bframes
chomp			imx_dump_header		noise
dump_extradata		mp3_header_decompress	remove_extradata
h264_mp4toannexb

Enabled indevs:

Enabled outdevs:

License: LGPL version 2.1 or later
Creating config.mak, config.h, and doc/config.texi...

WARNING: arm-linux-androideabi-pkg-config not found, library detection may fail.

--------------------
[*] compile ffmpeg
--------------------
CC	libavfilter/aeval.o
CC	libavfilter/af_adelay.o
CC	libavfilter/af_aecho.o
CC	libavfilter/af_afade.o
CC	libavfilter/af_aformat.o
CC	libavfilter/af_amerge.o
CC	libavfilter/af_amix.o
CC	libavfilter/af_anull.o
CC	libavfilter/af_apad.o
CC	libavfilter/af_aphaser.o
CC	libavfilter/af_aresample.o
CC	libavfilter/af_asetnsamples.o
CC	libavfilter/af_asetrate.o
CC	libavfilter/af_ashowinfo.o
CC	libavfilter/af_astats.o
CC	libavfilter/af_astreamsync.o
CC	libavfilter/af_atempo.o
CC	libavfilter/af_biquads.o
CC	libavfilter/af_channelmap.o
CC	libavfilter/af_channelsplit.o
CC	libavfilter/af_chorus.o
CC	libavfilter/af_compand.o
CC	libavfilter/af_dcshift.o
CC	libavfilter/af_dynaudnorm.o
CC	libavfilter/af_earwax.o
CC	libavfilter/af_flanger.o
CC	libavfilter/af_join.o
CC	libavfilter/af_pan.o
CC	libavfilter/af_replaygain.o
CC	libavfilter/af_sidechaincompress.o
CC	libavfilter/af_silencedetect.o
CC	libavfilter/af_silenceremove.o
CC	libavfilter/af_volumedetect.o
CC	libavfilter/af_volume.o
CC	libavfilter/allfilters.o
CC	libavfilter/asink_anullsink.o
CC	libavfilter/asrc_anullsrc.o
CC	libavfilter/asrc_sine.o
CC	libavfilter/audio.o
CC	libavfilter/avcodec.o
CC	libavfilter/avf_aphasemeter.o
CC	libavfilter/avf_avectorscope.o
CC	libavfilter/avf_concat.o
CC	libavfilter/avf_showcqt.o
CC	libavfilter/avf_showfreqs.o
CC	libavfilter/avf_showvolume.o
CC	libavfilter/avf_showspectrum.o
CC	libavfilter/avf_showwaves.o
CC	libavfilter/avfilter.o
CC	libavfilter/avfiltergraph.o
CC	libavfilter/bbox.o
CC	libavfilter/buffer.o
CC	libavfilter/buffersink.o
CC	libavfilter/buffersrc.o
libavfilter/buffersrc.c: In function 'av_buffersrc_buffer':
libavfilter/buffersrc.c:304:5: warning: 'av_buffersrc_add_ref' is deprecated (declared at libavfilter/buffersrc.c:205) [-Wdeprecated-declarations]
     return av_buffersrc_add_ref(ctx, buf, 0);
     ^
CC	libavfilter/drawutils.o
CC	libavfilter/dualinput.o
CC	libavfilter/f_drawgraph.o
CC	libavfilter/f_interleave.o
CC	libavfilter/f_perms.o
CC	libavfilter/f_reverse.o
CC	libavfilter/f_select.o
CC	libavfilter/f_sendcmd.o
CC	libavfilter/fifo.o
CC	libavfilter/formats.o
CC	libavfilter/framesync.o
CC	libavfilter/generate_wave_table.o
CC	libavfilter/graphdump.o
CC	libavfilter/graphparser.o
CC	libavfilter/lavfutils.o
CC	libavfilter/lswsutils.o
CC	libavfilter/opencl_allkernels.o
CC	libavfilter/pthread.o
CC	libavfilter/setpts.o
CC	libavfilter/settb.o
CC	libavfilter/split.o
CC	libavfilter/src_movie.o
CC	libavfilter/transform.o
CC	libavfilter/trim.o
CC	libavfilter/vf_alphamerge.o
CC	libavfilter/vf_aspect.o
CC	libavfilter/vf_atadenoise.o
CC	libavfilter/vf_bbox.o
CC	libavfilter/vf_blackdetect.o
CC	libavfilter/vf_blend.o
CC	libavfilter/vf_codecview.o
CC	libavfilter/vf_colorbalance.o
CC	libavfilter/vf_colorchannelmixer.o
CC	libavfilter/vf_colorkey.o
CC	libavfilter/vf_colorlevels.o
CC	libavfilter/vf_copy.o
CC	libavfilter/vf_crop.o
CC	libavfilter/vf_curves.o
CC	libavfilter/vf_dctdnoiz.o
CC	libavfilter/vf_deband.o
CC	libavfilter/vf_decimate.o
CC	libavfilter/vf_dejudder.o
CC	libavfilter/vf_deshake.o
CC	libavfilter/vf_detelecine.o
CC	libavfilter/vf_drawbox.o
CC	libavfilter/vf_edgedetect.o
CC	libavfilter/vf_elbg.o
CC	libavfilter/vf_extractplanes.o
CC	libavfilter/vf_fade.o
CC	libavfilter/vf_fftfilt.o
CC	libavfilter/vf_field.o
CC	libavfilter/vf_fieldmatch.o
CC	libavfilter/vf_fieldorder.o
CC	libavfilter/vf_format.o
CC	libavfilter/vf_fps.o
CC	libavfilter/vf_framepack.o
CC	libavfilter/vf_framerate.o
CC	libavfilter/vf_framestep.o
CC	libavfilter/vf_gradfun.o
CC	libavfilter/vf_hflip.o
CC	libavfilter/vf_histogram.o
CC	libavfilter/vf_hqx.o
CC	libavfilter/vf_hue.o
CC	libavfilter/vf_idet.o
CC	libavfilter/vf_il.o
CC	libavfilter/vf_lenscorrection.o
CC	libavfilter/vf_lut.o
CC	libavfilter/vf_lut3d.o
CC	libavfilter/vf_mergeplanes.o
CC	libavfilter/vf_neighbor.o
CC	libavfilter/vf_noise.o
CC	libavfilter/vf_null.o
CC	libavfilter/vf_overlay.o
CC	libavfilter/vf_pad.o
CC	libavfilter/vf_palettegen.o
CC	libavfilter/vf_paletteuse.o
CC	libavfilter/vf_pixdesctest.o
CC	libavfilter/vf_psnr.o
CC	libavfilter/vf_qp.o
CC	libavfilter/vf_random.o
CC	libavfilter/vf_removegrain.o
CC	libavfilter/vf_removelogo.o
CC	libavfilter/vf_rotate.o
CC	libavfilter/vf_scale.o
CC	libavfilter/vf_separatefields.o
CC	libavfilter/vf_setfield.o
CC	libavfilter/vf_showinfo.o
CC	libavfilter/vf_showpalette.o
CC	libavfilter/vf_shuffleplanes.o
CC	libavfilter/vf_signalstats.o
CC	libavfilter/vf_ssim.o
CC	libavfilter/vf_stack.o
CC	libavfilter/vf_swapuv.o
CC	libavfilter/vf_thumbnail.o
CC	libavfilter/vf_telecine.o
CC	libavfilter/vf_tile.o
CC	libavfilter/vf_transpose.o
CC	libavfilter/vf_unsharp.o
CC	libavfilter/vf_vectorscope.o
CC	libavfilter/vf_vflip.o
CC	libavfilter/vf_vignette.o
CC	libavfilter/vf_w3fdif.o
CC	libavfilter/vf_waveform.o
CC	libavfilter/vf_xbr.o
CC	libavfilter/vf_yadif.o
CC	libavfilter/vf_zoompan.o
CC	libavfilter/video.o
CC	libavfilter/vsink_nullsink.o
CC	libavfilter/vsrc_cellauto.o
CC	libavfilter/vsrc_life.o
CC	libavfilter/vsrc_mandelbrot.o
CC	libavfilter/vsrc_testsrc.o
CC	libavformat/aacdec.o
CC	libavformat/adtsenc.o
CC	libavformat/allformats.o
CC	libavformat/apetag.o
CC	libavformat/avc.o
CC	libavformat/avio.o
CC	libavformat/aviobuf.o
CC	libavformat/cache.o
CC	libavformat/concat.o
CC	libavformat/concatdec.o
CC	libavformat/crypto.o
CC	libavformat/cutils.o
CC	libavformat/data_uri.o
CC	libavformat/dump.o
CC	libavformat/file.o
CC	libavformat/flvdec.o
CC	libavformat/format.o
libavformat/format.c: In function 'av_probe_input_format3':
libavformat/format.c:178:17: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
         lpd.buf = zerobuffer;
                 ^
CC	libavformat/ftp.o
CC	libavformat/hevc.o
CC	libavformat/hls.o
libavformat/hls.c:501:12: warning: 'open_in' defined but not used [-Wunused-function]
 static int open_in(HLSContext *c, AVIOContext **in, const char *url)
            ^
CC	libavformat/hlsproto.o
CC	libavformat/http.o
CC	libavformat/httpauth.o
CC	libavformat/icecast.o
CC	libavformat/id3v1.o
CC	libavformat/id3v2.o
CC	libavformat/id3v2enc.o
CC	libavformat/img2.o
CC	libavformat/isom.o
CC	libavformat/latmenc.o
CC	libavformat/loasdec.o
CC	libavformat/m4vdec.o
CC	libavformat/md5proto.o
CC	libavformat/metadata.o
CC	libavformat/mov.o
CC	libavformat/mov_chan.o
CC	libavformat/movenc.o
libavformat/movenc.c: In function 'ff_mov_write_packet':
libavformat/movenc.c:4544:1: warning: label 'end' defined but not used [-Wunused-label]
 end:
 ^
libavformat/movenc.c: In function 'mov_flush_fragment':
libavformat/movenc.c:857:8: warning: assuming signed overflow does not occur when assuming that (X - c) > X is always false [-Wstrict-overflow]
     if (cluster_idx >= track->entry)
        ^
CC	libavformat/movenchint.o
CC	libavformat/mp3dec.o
CC	libavformat/mpeg.o
CC	libavformat/mpegts.o
CC	libavformat/mpegtsenc.o
CC	libavformat/mpegvideodec.o
CC	libavformat/mux.o
CC	libavformat/network.o
CC	libavformat/options.o
CC	libavformat/os_support.o
CC	libavformat/rawdec.o
CC	libavformat/rawenc.o
CC	libavformat/replaygain.o
libavformat/rawenc.c:32:12: warning: 'force_one_stream' defined but not used [-Wunused-function]
 static int force_one_stream(AVFormatContext *s)
            ^
CC	libavformat/riffdec.o
CC	libavformat/riff.o
CC	libavformat/riffenc.o
CC	libavformat/rtmphttp.o
CC	libavformat/rtmppkt.o
CC	libavformat/rtmpproto.o
CC	libavformat/rtp.o
CC	libavformat/rtpenc_chain.o
CC	libavformat/sdp.o
CC	libavformat/subfile.o
CC	libavformat/tcp.o
CC	libavformat/udp.o
CC	libavformat/url.o
CC	libavformat/urldecode.o
CC	libavformat/utils.o
libavformat/utils.c: In function 'avformat_find_stream_info':
libavformat/utils.c:3118:9: warning: 'max_analyze_duration' is deprecated (declared at libavformat/avformat.h:1414) [-Wdeprecated-declarations]
         max_analyze_duration = ic->max_analyze_duration;
         ^
CC	libavcodec/aac_ac3_parser.o
CC	libavcodec/aac_adtstoasc_bsf.o
CC	libavcodec/aac_parser.o
CC	libavcodec/aacadtsdec.o
CC	libavcodec/aacdec.o
CC	libavcodec/aacps_float.o
CC	libavcodec/aacpsdsp_float.o
CC	libavcodec/aacsbr.o
CC	libavcodec/aactab.o
CC	libavcodec/ac3tab.o
CC	libavcodec/allcodecs.o
CC	libavcodec/arm/aacpsdsp_init_arm.o
AS	libavcodec/arm/aacpsdsp_neon.o
CC	libavcodec/arm/blockdsp_init_arm.o
CC	libavcodec/arm/blockdsp_init_neon.o
AS	libavcodec/arm/blockdsp_neon.o
CC	libavcodec/arm/fft_fixed_init_arm.o
AS	libavcodec/arm/fft_fixed_neon.o
CC	libavcodec/arm/fft_init_arm.o
AS	libavcodec/arm/fft_neon.o
AS	libavcodec/arm/fft_vfp.o
CC	libavcodec/arm/h264chroma_init_arm.o
AS	libavcodec/arm/h264cmc_neon.o
AS	libavcodec/arm/h264dsp_neon.o
CC	libavcodec/arm/h264dsp_init_arm.o
AS	libavcodec/arm/h264idct_neon.o
CC	libavcodec/arm/h264pred_init_arm.o
AS	libavcodec/arm/h264pred_neon.o
CC	libavcodec/arm/h264qpel_init_arm.o
AS	libavcodec/arm/h264qpel_neon.o
AS	libavcodec/arm/hpeldsp_arm.o
AS	libavcodec/arm/hpeldsp_armv6.o
CC	libavcodec/arm/hpeldsp_init_arm.o
CC	libavcodec/arm/hpeldsp_init_armv6.o
CC	libavcodec/arm/hpeldsp_init_neon.o
AS	libavcodec/arm/hpeldsp_neon.o
AS	libavcodec/arm/idctdsp_arm.o
AS	libavcodec/arm/idctdsp_armv6.o
CC	libavcodec/arm/idctdsp_init_arm.o
CC	libavcodec/arm/idctdsp_init_armv5te.o
CC	libavcodec/arm/idctdsp_init_armv6.o
CC	libavcodec/arm/idctdsp_init_neon.o
AS	libavcodec/arm/idctdsp_neon.o
AS	libavcodec/arm/jrevdct_arm.o
AS	libavcodec/arm/mdct_fixed_neon.o
AS	libavcodec/arm/mdct_neon.o
AS	libavcodec/arm/mdct_vfp.o
AS	libavcodec/arm/me_cmp_armv6.o
AS	libavcodec/arm/mpegaudiodsp_fixed_armv6.o
CC	libavcodec/arm/mpegaudiodsp_init_arm.o
CC	libavcodec/arm/me_cmp_init_arm.o
CC	libavcodec/arm/mpegvideo_arm.o
CC	libavcodec/arm/mpegvideo_armv5te.o
AS	libavcodec/arm/mpegvideo_armv5te_s.o
AS	libavcodec/arm/mpegvideo_neon.o
AS	libavcodec/arm/pixblockdsp_armv6.o
CC	libavcodec/arm/pixblockdsp_init_arm.o
AS	libavcodec/arm/rdft_neon.o
CC	libavcodec/arm/sbrdsp_init_arm.o
AS	libavcodec/arm/sbrdsp_neon.o
AS	libavcodec/arm/simple_idct_arm.o
AS	libavcodec/arm/simple_idct_armv6.o
AS	libavcodec/arm/simple_idct_armv5te.o
AS	libavcodec/arm/simple_idct_neon.o
AS	libavcodec/arm/startcode_armv6.o
AS	libavcodec/arm/videodsp_armv5te.o
CC	libavcodec/arm/videodsp_init_arm.o
CC	libavcodec/arm/videodsp_init_armv5te.o
CC	libavcodec/arm/vp3dsp_init_arm.o
AS	libavcodec/arm/vp3dsp_neon.o
CC	libavcodec/arm/vp6dsp_init_arm.o
AS	libavcodec/arm/vp6dsp_neon.o
CC	libavcodec/audioconvert.o
CC	libavcodec/avdct.o
CC	libavcodec/avfft.o
CC	libavcodec/avpacket.o
CC	libavcodec/avpicture.o
CC	libavcodec/bitstream.o
CC	libavcodec/bitstream_filter.o
CC	libavcodec/blockdsp.o
CC	libavcodec/cabac.o
CC	libavcodec/chomp_bsf.o
CC	libavcodec/codec_desc.o
CC	libavcodec/dct.o
CC	libavcodec/dct32_fixed.o
CC	libavcodec/dct32_float.o
CC	libavcodec/dump_extradata_bsf.o
CC	libavcodec/dv_profile.o
CC	libavcodec/elbg.o
CC	libavcodec/error_resilience.o
CC	libavcodec/faandct.o
CC	libavcodec/faanidct.o
CC	libavcodec/fdctdsp.o
CC	libavcodec/fft_fixed.o
CC	libavcodec/fft_fixed_32.o
CC	libavcodec/fft_float.o
CC	libavcodec/fft_init_table.o
CC	libavcodec/flvdec.o
CC	libavcodec/golomb.o
CC	libavcodec/h263.o
CC	libavcodec/h263_parser.o
CC	libavcodec/h263data.o
CC	libavcodec/h263dsp.o
CC	libavcodec/h263dec.o
CC	libavcodec/h264.o
CC	libavcodec/h264_cabac.o
CC	libavcodec/h264_cavlc.o
libavcodec/h264_cavlc.c: In function 'decode_residual.isra.18':
libavcodec/h264_cavlc.c:605:46: warning: array subscript is above array bounds [-Warray-bounds]
             ((type*)block)[*scantable]= level[i]; \
                                              ^
libavcodec/h264_cavlc.c:625:9: note: in expansion of macro 'STORE_BLOCK'
         STORE_BLOCK(int32_t)
         ^
libavcodec/h264_cavlc.c:605:46: warning: array subscript is above array bounds [-Warray-bounds]
             ((type*)block)[*scantable]= level[i]; \
                                              ^
libavcodec/h264_cavlc.c:627:9: note: in expansion of macro 'STORE_BLOCK'
         STORE_BLOCK(int16_t)
         ^
CC	libavcodec/h264_direct.o
CC	libavcodec/h264_loopfilter.o
CC	libavcodec/h264_mb.o
CC	libavcodec/h264_mp4toannexb_bsf.o
CC	libavcodec/h264_parser.o
CC	libavcodec/h264_picture.o
CC	libavcodec/h264_ps.o
CC	libavcodec/h264_refs.o
CC	libavcodec/h264_sei.o
CC	libavcodec/h264_slice.o
CC	libavcodec/h264chroma.o
CC	libavcodec/h264dsp.o
CC	libavcodec/h264idct.o
CC	libavcodec/h264pred.o
CC	libavcodec/h264qpel.o
CC	libavcodec/hevc_mp4toannexb_bsf.o
libavcodec/hevc_mp4toannexb_bsf.c: In function 'hevc_mp4toannexb_filter':
libavcodec/hevc_mp4toannexb_bsf.c:137:27: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
             *poutbuf      = buf;
                           ^
CC	libavcodec/hpeldsp.o
CC	libavcodec/huffman.o
CC	libavcodec/idctdsp.o
CC	libavcodec/imdct15.o
CC	libavcodec/imgconvert.o
CC	libavcodec/imx_dump_header_bsf.o
CC	libavcodec/intelh263dec.o
CC	libavcodec/ituh263dec.o
CC	libavcodec/jfdctfst.o
CC	libavcodec/jfdctint.o
CC	libavcodec/jrevdct.o
CC	libavcodec/kbdwin.o
CC	libavcodec/latm_parser.o
CC	libavcodec/mathtables.o
CC	libavcodec/mdct_fixed.o
CC	libavcodec/mdct_fixed_32.o
CC	libavcodec/mdct_float.o
CC	libavcodec/me_cmp.o
CC	libavcodec/mp3_header_decompress_bsf.o
CC	libavcodec/mpeg4_unpack_bframes_bsf.o
CC	libavcodec/mpeg4audio.o
CC	libavcodec/mpeg4video.o
CC	libavcodec/mpeg4videodec.o
CC	libavcodec/mpeg_er.o
CC	libavcodec/mpegaudio.o
CC	libavcodec/mpegaudio_parser.o
CC	libavcodec/mpegaudiodata.o
CC	libavcodec/mpegaudiodec_fixed.o
CC	libavcodec/mpegaudiodec_float.o
CC	libavcodec/mpegaudiodecheader.o
CC	libavcodec/mpegaudiodsp.o
CC	libavcodec/mpegaudiodsp_data.o
CC	libavcodec/mpegaudiodsp_fixed.o
CC	libavcodec/mpegaudiodsp_float.o
CC	libavcodec/mpegpicture.o
CC	libavcodec/mpegutils.o
CC	libavcodec/mpegvideo.o
CC	libavcodec/mpegvideo_motion.o
CC	libavcodec/mpegvideodata.o
CC	libavcodec/mpegvideodsp.o
CC	libavcodec/noise_bsf.o
CC	libavcodec/options.o
libavcodec/options.c: In function 'avcodec_copy_context':
libavcodec/options.c:202:5: warning: passing argument 2 of 'av_opt_copy' discards 'const' qualifier from pointer target type [enabled by default]
     av_opt_copy(dest, src);
     ^
In file included from libavcodec/options.c:32:0:
./libavutil/opt.h:838:5: note: expected 'void *' but argument is of type 'const struct AVCodecContext *'
 int av_opt_copy(void *dest, FF_CONST_AVUTIL55 void *src);
     ^
CC	libavcodec/parser.o
CC	libavcodec/pixblockdsp.o
CC	libavcodec/pthread.o
CC	libavcodec/pthread_frame.o
CC	libavcodec/pthread_slice.o
CC	libavcodec/qpeldsp.o
CC	libavcodec/qsv_api.o
CC	libavcodec/raw.o
CC	libavcodec/rdft.o
CC	libavcodec/remove_extradata_bsf.o
CC	libavcodec/resample.o
CC	libavcodec/resample2.o
CC	libavcodec/rl.o
CC	libavcodec/sbrdsp.o
CC	libavcodec/simple_idct.o
CC	libavcodec/sinewin.o
CC	libavcodec/sinewin_fixed.o
CC	libavcodec/startcode.o
CC	libavcodec/utils.o
CC	libavcodec/videodsp.o
CC	libavcodec/vorbis_parser.o
CC	libavcodec/vp3dsp.o
CC	libavcodec/vp56.o
CC	libavcodec/vp56data.o
CC	libavcodec/vp56dsp.o
CC	libavcodec/vp56rac.o
CC	libavcodec/vp6.o
CC	libavcodec/vp6dsp.o
CC	libavcodec/xiph.o
CC	libswresample/arm/audio_convert_init.o
AS	libswresample/arm/audio_convert_neon.o
CC	libswresample/audioconvert.o
CC	libswresample/dither.o
CC	libswresample/options.o
CC	libswresample/rematrix.o
CC	libswresample/resample.o
CC	libswresample/swresample.o
CC	libswresample/resample_dsp.o
CC	libswresample/swresample_frame.o
CC	libswscale/alphablend.o
CC	libswscale/gamma.o
CC	libswscale/hscale.o
CC	libswscale/hscale_fast_bilinear.o
CC	libswscale/options.o
CC	libswscale/input.o
CC	libswscale/output.o
libswscale/output.c:1172:21: warning: 'yuv2rgba64be_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, rgba64be, AV_PIX_FMT_RGBA64BE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1172:21: warning: 'yuv2rgba64be_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, rgba64be, AV_PIX_FMT_RGBA64BE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1172:21: warning: 'yuv2rgba64be_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, rgba64be, AV_PIX_FMT_RGBA64BE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1173:21: warning: 'yuv2rgba64le_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, rgba64le, AV_PIX_FMT_RGBA64LE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1173:21: warning: 'yuv2rgba64le_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, rgba64le, AV_PIX_FMT_RGBA64LE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1173:21: warning: 'yuv2rgba64le_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, rgba64le, AV_PIX_FMT_RGBA64LE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1176:21: warning: 'yuv2bgra64be_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, bgra64be, AV_PIX_FMT_BGRA64BE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1176:21: warning: 'yuv2bgra64be_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, bgra64be, AV_PIX_FMT_BGRA64BE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1176:21: warning: 'yuv2bgra64be_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, bgra64be, AV_PIX_FMT_BGRA64BE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1177:21: warning: 'yuv2bgra64le_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, bgra64le, AV_PIX_FMT_BGRA64LE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1177:21: warning: 'yuv2bgra64le_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, bgra64le, AV_PIX_FMT_BGRA64LE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1177:21: warning: 'yuv2bgra64le_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, bgra64le, AV_PIX_FMT_BGRA64LE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1185:21: warning: 'yuv2rgba64be_full_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, rgba64be_full, AV_PIX_FMT_RGBA64BE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1185:21: warning: 'yuv2rgba64be_full_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, rgba64be_full, AV_PIX_FMT_RGBA64BE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1185:21: warning: 'yuv2rgba64be_full_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, rgba64be_full, AV_PIX_FMT_RGBA64BE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1186:21: warning: 'yuv2rgba64le_full_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, rgba64le_full, AV_PIX_FMT_RGBA64LE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1186:21: warning: 'yuv2rgba64le_full_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, rgba64le_full, AV_PIX_FMT_RGBA64LE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1186:21: warning: 'yuv2rgba64le_full_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, rgba64le_full, AV_PIX_FMT_RGBA64LE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1189:21: warning: 'yuv2bgra64be_full_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, bgra64be_full, AV_PIX_FMT_BGRA64BE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1189:21: warning: 'yuv2bgra64be_full_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, bgra64be_full, AV_PIX_FMT_BGRA64BE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1189:21: warning: 'yuv2bgra64be_full_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, bgra64be_full, AV_PIX_FMT_BGRA64BE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1190:21: warning: 'yuv2bgra64le_full_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, bgra64le_full, AV_PIX_FMT_BGRA64LE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1190:21: warning: 'yuv2bgra64le_full_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, bgra64le_full, AV_PIX_FMT_BGRA64LE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1190:21: warning: 'yuv2bgra64le_full_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, bgra64le_full, AV_PIX_FMT_BGRA64LE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
CC	libswscale/rgb2rgb.o
CC	libswscale/slice.o
CC	libswscale/swscale.o
libswscale/swscale.c: In function 'swscale':
libswscale/swscale.c:382:9: warning: unused variable 'perform_gamma' [-Wunused-variable]
     int perform_gamma = c->is_internal_gamma;
         ^
libswscale/swscale.c: At top level:
libswscale/swscale.c:55:13: warning: 'gamma_convert' defined but not used [-Wunused-function]
 static void gamma_convert(uint8_t * src[], int width, uint16_t *gamma)
             ^
CC	libswscale/swscale_unscaled.o
CC	libswscale/utils.o
CC	libswscale/vscale.o
CC	libswscale/yuv2rgb.o
CC	libavutil/../compat/strtod.o
libavutil/../compat/strtod.c: In function 'avpriv_strtod':
libavutil/../compat/strtod.c:55:13: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
         end = nptr + 8;
             ^
libavutil/../compat/strtod.c:58:13: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
         end = nptr + 3;
             ^
libavutil/../compat/strtod.c:61:13: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
         end = nptr + 9;
             ^
libavutil/../compat/strtod.c:64:13: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
         end = nptr + 4;
             ^
libavutil/../compat/strtod.c:67:13: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
         end = nptr + 9;
             ^
libavutil/../compat/strtod.c:70:13: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
         end = nptr + 4;
             ^
libavutil/../compat/strtod.c:73:9: warning: passing argument 1 of 'check_nan_suffix' discards 'const' qualifier from pointer target type [enabled by default]
         end = check_nan_suffix(nptr + 3);
         ^
libavutil/../compat/strtod.c:28:14: note: expected 'char *' but argument is of type 'const char *'
 static char *check_nan_suffix(char *s)
              ^
libavutil/../compat/strtod.c:77:9: warning: passing argument 1 of 'check_nan_suffix' discards 'const' qualifier from pointer target type [enabled by default]
         end = check_nan_suffix(nptr + 4);
         ^
libavutil/../compat/strtod.c:28:14: note: expected 'char *' but argument is of type 'const char *'
 static char *check_nan_suffix(char *s)
              ^
CC	libavutil/adler32.o
CC	libavutil/aes.o
CC	libavutil/arm/cpu.o
CC	libavutil/arm/float_dsp_init_arm.o
CC	libavutil/arm/float_dsp_init_neon.o
CC	libavutil/arm/float_dsp_init_vfp.o
AS	libavutil/arm/float_dsp_neon.o
CC	libavutil/audio_fifo.o
AS	libavutil/arm/float_dsp_vfp.o
CC	libavutil/avstring.o
CC	libavutil/base64.o
CC	libavutil/blowfish.o
CC	libavutil/bprint.o
CC	libavutil/buffer.o
CC	libavutil/camellia.o
CC	libavutil/cast5.o
CC	libavutil/channel_layout.o
CC	libavutil/color_utils.o
CC	libavutil/cpu.o
CC	libavutil/crc.o
CC	libavutil/des.o
CC	libavutil/dict.o
CC	libavutil/display.o
CC	libavutil/downmix_info.o
CC	libavutil/error.o
CC	libavutil/eval.o
CC	libavutil/fifo.o
CC	libavutil/file.o
CC	libavutil/file_open.o
CC	libavutil/fixed_dsp.o
CC	libavutil/float_dsp.o
CC	libavutil/frame.o
libavutil/frame.c: In function 'av_frame_set_qp_table':
libavutil/frame.c:55:5: warning: 'qscale_table' is deprecated (declared at libavutil/frame.h:293) [-Wdeprecated-declarations]
     f->qscale_table = buf->data;
     ^
libavutil/frame.c:56:5: warning: 'qstride' is deprecated (declared at libavutil/frame.h:298) [-Wdeprecated-declarations]
     f->qstride      = stride;
     ^
libavutil/frame.c:57:5: warning: 'qscale_type' is deprecated (declared at libavutil/frame.h:301) [-Wdeprecated-declarations]
     f->qscale_type  = qp_type;
     ^
libavutil/frame.c: In function 'av_frame_get_qp_table':
libavutil/frame.c:64:5: warning: 'qstride' is deprecated (declared at libavutil/frame.h:298) [-Wdeprecated-declarations]
     *stride = f->qstride;
     ^
libavutil/frame.c:65:5: warning: 'qscale_type' is deprecated (declared at libavutil/frame.h:301) [-Wdeprecated-declarations]
     *type   = f->qscale_type;
     ^
libavutil/frame.c: In function 'frame_copy_props':
libavutil/frame.c:350:5: warning: 'qscale_table' is deprecated (declared at libavutil/frame.h:293) [-Wdeprecated-declarations]
     dst->qscale_table = NULL;
     ^
libavutil/frame.c:351:5: warning: 'qstride' is deprecated (declared at libavutil/frame.h:298) [-Wdeprecated-declarations]
     dst->qstride      = 0;
     ^
libavutil/frame.c:352:5: warning: 'qscale_type' is deprecated (declared at libavutil/frame.h:301) [-Wdeprecated-declarations]
     dst->qscale_type  = 0;
     ^
libavutil/frame.c:356:13: warning: 'qscale_table' is deprecated (declared at libavutil/frame.h:293) [-Wdeprecated-declarations]
             dst->qscale_table = dst->qp_table_buf->data;
             ^
libavutil/frame.c:357:13: warning: 'qstride' is deprecated (declared at libavutil/frame.h:298) [-Wdeprecated-declarations]
             dst->qstride      = src->qstride;
             ^
libavutil/frame.c:357:13: warning: 'qstride' is deprecated (declared at libavutil/frame.h:298) [-Wdeprecated-declarations]
libavutil/frame.c:358:13: warning: 'qscale_type' is deprecated (declared at libavutil/frame.h:301) [-Wdeprecated-declarations]
             dst->qscale_type  = src->qscale_type;
             ^
libavutil/frame.c:358:13: warning: 'qscale_type' is deprecated (declared at libavutil/frame.h:301) [-Wdeprecated-declarations]
CC	libavutil/hash.o
CC	libavutil/hmac.o
CC	libavutil/imgutils.o
CC	libavutil/intmath.o
CC	libavutil/lfg.o
CC	libavutil/lls.o
CC	libavutil/log.o
CC	libavutil/log2_tab.o
CC	libavutil/mathematics.o
CC	libavutil/md5.o
CC	libavutil/mem.o
CC	libavutil/murmur3.o
CC	libavutil/opt.o
CC	libavutil/parseutils.o
CC	libavutil/pixdesc.o
CC	libavutil/pixelutils.o
CC	libavutil/random_seed.o
CC	libavutil/rational.o
CC	libavutil/rc4.o
CC	libavutil/reverse.o
CC	libavutil/ripemd.o
CC	libavutil/samplefmt.o
CC	libavutil/sha.o
CC	libavutil/sha512.o
CC	libavutil/stereo3d.o
CC	libavutil/tea.o
CC	libavutil/threadmessage.o
CC	libavutil/time.o
CC	libavutil/timecode.o
CC	libavutil/tree.o
CC	libavutil/twofish.o
CC	libavutil/utils.o
CC	libavutil/xga_font_data.o
CC	libavutil/xtea.o
AR	libavfilter/libavfilter.a
AR	libavformat/libavformat.a
AR	libavcodec/libavcodec.a
AR	libswresample/libswresample.a
AR	libswscale/libswscale.a
AR	libavutil/libavutil.a
INSTALL	libavfilter/libavfilter.a
INSTALL	libavformat/libavformat.a
INSTALL	libavcodec/libavcodec.a
INSTALL	libswresample/libswresample.a
INSTALL	libswscale/libswscale.a
INSTALL	libavutil/libavutil.a
INSTALL	libavfilter/asrc_abuffer.h
INSTALL	libavfilter/avcodec.h
INSTALL	libavfilter/avfilter.h
INSTALL	libavfilter/avfiltergraph.h
INSTALL	libavfilter/buffersink.h
INSTALL	libavfilter/buffersrc.h
INSTALL	libavfilter/version.h
INSTALL	libavfilter/libavfilter.pc
INSTALL	libavformat/avformat.h
INSTALL	libavformat/avio.h
INSTALL	libavformat/version.h
INSTALL	libavformat/avc.h
INSTALL	libavformat/url.h
INSTALL	libavformat/internal.h
INSTALL	libavformat/libavformat.pc
INSTALL	libavcodec/avcodec.h
INSTALL	libavcodec/avfft.h
INSTALL	libavcodec/dv_profile.h
INSTALL	libavcodec/d3d11va.h
INSTALL	libavcodec/dxva2.h
INSTALL	libavcodec/old_codec_ids.h
INSTALL	libavcodec/qsv.h
INSTALL	libavcodec/vaapi.h
INSTALL	libavcodec/vda.h
INSTALL	libavcodec/vdpau.h
INSTALL	libavcodec/version.h
INSTALL	libavcodec/videotoolbox.h
INSTALL	libavcodec/vorbis_parser.h
INSTALL	libavcodec/xvmc.h
INSTALL	libavcodec/libavcodec.pc
INSTALL	libswresample/swresample.h
INSTALL	libswresample/version.h
INSTALL	libswresample/libswresample.pc
INSTALL	libswscale/swscale.h
INSTALL	libswscale/version.h
INSTALL	libswscale/libswscale.pc
INSTALL	libavutil/adler32.h
INSTALL	libavutil/aes.h
INSTALL	libavutil/attributes.h
INSTALL	libavutil/audio_fifo.h
INSTALL	libavutil/audioconvert.h
INSTALL	libavutil/avassert.h
INSTALL	libavutil/avstring.h
INSTALL	libavutil/avutil.h
INSTALL	libavutil/base64.h
INSTALL	libavutil/blowfish.h
INSTALL	libavutil/bprint.h
INSTALL	libavutil/bswap.h
INSTALL	libavutil/buffer.h
INSTALL	libavutil/cast5.h
INSTALL	libavutil/camellia.h
INSTALL	libavutil/channel_layout.h
INSTALL	libavutil/common.h
INSTALL	libavutil/cpu.h
INSTALL	libavutil/crc.h
INSTALL	libavutil/display.h
INSTALL	libavutil/downmix_info.h
INSTALL	libavutil/error.h
INSTALL	libavutil/eval.h
INSTALL	libavutil/fifo.h
INSTALL	libavutil/file.h
INSTALL	libavutil/frame.h
INSTALL	libavutil/hash.h
INSTALL	libavutil/hmac.h
INSTALL	libavutil/imgutils.h
INSTALL	libavutil/intfloat.h
INSTALL	libavutil/intreadwrite.h
INSTALL	libavutil/lfg.h
INSTALL	libavutil/log.h
INSTALL	libavutil/macros.h
INSTALL	libavutil/mathematics.h
INSTALL	libavutil/md5.h
INSTALL	libavutil/mem.h
INSTALL	libavutil/motion_vector.h
INSTALL	libavutil/murmur3.h
INSTALL	libavutil/dict.h
INSTALL	libavutil/old_pix_fmts.h
INSTALL	libavutil/opt.h
INSTALL	libavutil/parseutils.h
INSTALL	libavutil/pixdesc.h
INSTALL	libavutil/pixelutils.h
INSTALL	libavutil/pixfmt.h
INSTALL	libavutil/random_seed.h
INSTALL	libavutil/replaygain.h
INSTALL	libavutil/rational.h
INSTALL	libavutil/ripemd.h
INSTALL	libavutil/samplefmt.h
INSTALL	libavutil/sha.h
INSTALL	libavutil/sha512.h
INSTALL	libavutil/stereo3d.h
INSTALL	libavutil/threadmessage.h
INSTALL	libavutil/time.h
INSTALL	libavutil/timecode.h
INSTALL	libavutil/timestamp.h
INSTALL	libavutil/twofish.h
INSTALL	libavutil/version.h
INSTALL	libavutil/xtea.h
INSTALL	libavutil/tea.h
INSTALL	libavutil/thread.h
INSTALL	libavutil/avconfig.h
INSTALL	libavutil/ffversion.h
INSTALL	libavutil/libavutil.pc

--------------------
[*] link ffmpeg
--------------------
-Wl,--fix-cortex-a8

--------------------
[*] create files for shared ffmpeg
--------------------
====================
[*] check env x86
====================
build on Linux x86_64
ANDROID_SDK=/home/zhangbin/android/sdk/android-sdk-linux
ANDROID_NDK=/home/zhangbin/android/NDK/android-ndk-r10e
NDKr10e-rc4 (64-bit) detected

--------------------
[*] make NDK standalone toolchain
--------------------
Copying prebuilt binaries...
Copying sysroot headers and libraries...
Copying c++ runtime headers and libraries...
Copying files to: /home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/contrib/build/ffmpeg-x86/toolchain
Cleaning up...
Done.

--------------------
[*] check ffmpeg env
--------------------

--------------------
[*] configurate ffmpeg
--------------------
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/contrib/build/ffmpeg-x86/toolchain/bin/i686-linux-android-gcc
install prefix            /home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/contrib/build/ffmpeg-x86/output
source path               .
C compiler                i686-linux-android-gcc
C library                 bionic
host C compiler           gcc
host C library            glibc
ARCH                      x86 (i686)
big-endian                no
runtime cpu detection     yes
yasm                      yes
MMX enabled               yes
MMXEXT enabled            yes
3DNow! enabled            yes
3DNow! extended enabled   yes
SSE enabled               yes
SSSE3 enabled             yes
AVX enabled               yes
XOP enabled               yes
FMA3 enabled              yes
FMA4 enabled              yes
i686 features enabled     yes
CMOV is fast              yes
EBX available             no
EBP available             yes
debug symbols             yes
strip symbols             yes
optimize for size         no
optimizations             yes
static                    yes
shared                    no
postprocessing support    no
new filter support        yes
network support           yes
threading support         pthreads
safe bitstream reader     yes
SDL support               no
opencl enabled            no
texi2html enabled         no
perl enabled              yes
pod2man enabled           yes
makeinfo enabled          yes
makeinfo supports HTML    yes

Enabled programs:

External libraries:
zlib

Enabled decoders:
aac			h264			mp3on4
aac_latm		mp3			mp3on4float
flv			mp3adu			vp6
h263			mp3adufloat		vp6a
h263i			mp3float		vp6f
h263p

Enabled encoders:

Enabled hwaccels:

Enabled parsers:
aac			h263			mpegaudio
aac_latm		h264

Enabled demuxers:
aac			latm			mp3
concat			live_flv		mpegps
data			loas			mpegts
flv			m4v			mpegvideo
hls			mov

Enabled muxers:
adts			mov			mpegts
latm			mp4

Enabled protocols:
cache			hls			rtmp
concat			http			rtmpt
crypto			httpproxy		subfile
data			icecast			tcp
ffrtmphttp		md5			udp
file			pipe			udplite
ftp

Enabled filters:
acrossfade		dctdnoiz		paletteuse
adelay			deband			pan
adrawgraph		decimate		perms
aecho			deflate			pixdesctest
aeval			dejudder		psnr
aevalsrc		deshake			qp
afade			detelecine		random
aformat			dilation		removegrain
ainterleave		drawbox			removelogo
allpass			drawgraph		replaygain
allrgb			drawgrid		reverse
allyuv			dynaudnorm		rgbtestsrc
alphaextract		earwax			rotate
alphamerge		edgedetect		scale
amerge			elbg			scale2ref
amix			equalizer		select
amovie			erosion			sendcmd
anull			extractplanes		separatefields
anullsink		fade			setdar
anullsrc		fftfilt			setfield
apad			field			setpts
aperms			fieldmatch		setsar
aphasemeter		fieldorder		settb
aphaser			flanger			showcqt
aresample		format			showfreqs
areverse		fps			showinfo
aselect			framepack		showpalette
asendcmd		framerate		showspectrum
asetnsamples		framestep		showvolume
asetpts			gradfun			showwaves
asetrate		haldclut		showwavespic
asettb			haldclutsrc		shuffleplanes
ashowinfo		hflip			sidechaincompress
asplit			highpass		signalstats
astats			histogram		silencedetect
astreamsync		hqx			silenceremove
atadenoise		hstack			sine
atempo			hue			smptebars
atrim			idet			smptehdbars
avectorscope		il			split
bandpass		inflate			ssim
bandreject		interleave		swapuv
bass			join			tblend
bbox			lenscorrection		telecine
biquad			life			testsrc
blackdetect		lowpass			thumbnail
blend			lut			tile
cellauto		lut3d			transpose
channelmap		lutrgb			treble
channelsplit		lutyuv			trim
chorus			mandelbrot		unsharp
codecview		mergeplanes		vectorscope
color			movie			vflip
colorbalance		negate			vignette
colorchannelmixer	noformat		volume
colorkey		noise			volumedetect
colorlevels		null			vstack
compand			nullsink		w3fdif
concat			nullsrc			waveform
copy			overlay			xbr
crop			pad			yadif
curves			palettegen		zoompan
dcshift

Enabled bsfs:
aac_adtstoasc		hevc_mp4toannexb	mpeg4_unpack_bframes
chomp			imx_dump_header		noise
dump_extradata		mp3_header_decompress	remove_extradata
h264_mp4toannexb

Enabled indevs:

Enabled outdevs:

License: LGPL version 2.1 or later
Creating config.mak, config.h, and doc/config.texi...

WARNING: i686-linux-android-pkg-config not found, library detection may fail.

--------------------
[*] compile ffmpeg
--------------------
CC	libavfilter/aeval.o
CC	libavfilter/af_adelay.o
CC	libavfilter/af_aecho.o
CC	libavfilter/af_afade.o
CC	libavfilter/af_aformat.o
CC	libavfilter/af_amerge.o
CC	libavfilter/af_amix.o
CC	libavfilter/af_anull.o
CC	libavfilter/af_apad.o
CC	libavfilter/af_aphaser.o
CC	libavfilter/af_aresample.o
CC	libavfilter/af_asetnsamples.o
CC	libavfilter/af_asetrate.o
CC	libavfilter/af_ashowinfo.o
CC	libavfilter/af_astats.o
CC	libavfilter/af_astreamsync.o
CC	libavfilter/af_atempo.o
CC	libavfilter/af_biquads.o
CC	libavfilter/af_channelmap.o
CC	libavfilter/af_channelsplit.o
CC	libavfilter/af_chorus.o
CC	libavfilter/af_compand.o
CC	libavfilter/af_dcshift.o
CC	libavfilter/af_dynaudnorm.o
CC	libavfilter/af_earwax.o
CC	libavfilter/af_flanger.o
CC	libavfilter/af_join.o
CC	libavfilter/af_pan.o
CC	libavfilter/af_replaygain.o
CC	libavfilter/af_sidechaincompress.o
CC	libavfilter/af_silencedetect.o
CC	libavfilter/af_silenceremove.o
CC	libavfilter/af_volume.o
CC	libavfilter/af_volumedetect.o
CC	libavfilter/allfilters.o
CC	libavfilter/asink_anullsink.o
CC	libavfilter/asrc_anullsrc.o
CC	libavfilter/asrc_sine.o
CC	libavfilter/audio.o
CC	libavfilter/avcodec.o
CC	libavfilter/avf_aphasemeter.o
CC	libavfilter/avf_avectorscope.o
CC	libavfilter/avf_concat.o
CC	libavfilter/avf_showcqt.o
CC	libavfilter/avf_showfreqs.o
CC	libavfilter/avf_showspectrum.o
CC	libavfilter/avf_showvolume.o
CC	libavfilter/avf_showwaves.o
CC	libavfilter/avfilter.o
CC	libavfilter/avfiltergraph.o
CC	libavfilter/bbox.o
CC	libavfilter/buffer.o
CC	libavfilter/buffersink.o
CC	libavfilter/buffersrc.o
CC	libavfilter/drawutils.o
libavfilter/buffersrc.c: In function 'av_buffersrc_buffer':
libavfilter/buffersrc.c:304:5: warning: 'av_buffersrc_add_ref' is deprecated (declared at libavfilter/buffersrc.c:205) [-Wdeprecated-declarations]
     return av_buffersrc_add_ref(ctx, buf, 0);
     ^
CC	libavfilter/dualinput.o
CC	libavfilter/f_drawgraph.o
CC	libavfilter/f_interleave.o
CC	libavfilter/f_perms.o
CC	libavfilter/f_reverse.o
CC	libavfilter/f_select.o
CC	libavfilter/f_sendcmd.o
CC	libavfilter/fifo.o
CC	libavfilter/framesync.o
CC	libavfilter/formats.o
CC	libavfilter/generate_wave_table.o
CC	libavfilter/graphdump.o
CC	libavfilter/graphparser.o
CC	libavfilter/lavfutils.o
CC	libavfilter/lswsutils.o
CC	libavfilter/opencl_allkernels.o
CC	libavfilter/pthread.o
CC	libavfilter/setpts.o
CC	libavfilter/settb.o
CC	libavfilter/split.o
CC	libavfilter/src_movie.o
CC	libavfilter/transform.o
CC	libavfilter/trim.o
CC	libavfilter/vf_alphamerge.o
CC	libavfilter/vf_aspect.o
CC	libavfilter/vf_atadenoise.o
CC	libavfilter/vf_bbox.o
CC	libavfilter/vf_blackdetect.o
CC	libavfilter/vf_blend.o
CC	libavfilter/vf_codecview.o
CC	libavfilter/vf_colorbalance.o
CC	libavfilter/vf_colorchannelmixer.o
CC	libavfilter/vf_colorkey.o
CC	libavfilter/vf_colorlevels.o
CC	libavfilter/vf_copy.o
CC	libavfilter/vf_crop.o
CC	libavfilter/vf_curves.o
CC	libavfilter/vf_dctdnoiz.o
CC	libavfilter/vf_deband.o
CC	libavfilter/vf_decimate.o
CC	libavfilter/vf_dejudder.o
CC	libavfilter/vf_deshake.o
CC	libavfilter/vf_detelecine.o
CC	libavfilter/vf_drawbox.o
CC	libavfilter/vf_edgedetect.o
CC	libavfilter/vf_elbg.o
CC	libavfilter/vf_extractplanes.o
CC	libavfilter/vf_fade.o
CC	libavfilter/vf_field.o
CC	libavfilter/vf_fftfilt.o
CC	libavfilter/vf_fieldmatch.o
CC	libavfilter/vf_fieldorder.o
CC	libavfilter/vf_format.o
CC	libavfilter/vf_fps.o
CC	libavfilter/vf_framepack.o
CC	libavfilter/vf_framerate.o
CC	libavfilter/vf_framestep.o
CC	libavfilter/vf_gradfun.o
CC	libavfilter/vf_hflip.o
CC	libavfilter/vf_histogram.o
CC	libavfilter/vf_hqx.o
CC	libavfilter/vf_hue.o
CC	libavfilter/vf_idet.o
CC	libavfilter/vf_il.o
CC	libavfilter/vf_lenscorrection.o
CC	libavfilter/vf_lut.o
CC	libavfilter/vf_lut3d.o
CC	libavfilter/vf_mergeplanes.o
CC	libavfilter/vf_neighbor.o
CC	libavfilter/vf_noise.o
CC	libavfilter/vf_null.o
CC	libavfilter/vf_overlay.o
CC	libavfilter/vf_pad.o
CC	libavfilter/vf_palettegen.o
CC	libavfilter/vf_paletteuse.o
CC	libavfilter/vf_pixdesctest.o
CC	libavfilter/vf_psnr.o
CC	libavfilter/vf_qp.o
CC	libavfilter/vf_random.o
CC	libavfilter/vf_removegrain.o
CC	libavfilter/vf_removelogo.o
CC	libavfilter/vf_rotate.o
CC	libavfilter/vf_scale.o
CC	libavfilter/vf_separatefields.o
CC	libavfilter/vf_setfield.o
CC	libavfilter/vf_showinfo.o
CC	libavfilter/vf_showpalette.o
CC	libavfilter/vf_shuffleplanes.o
CC	libavfilter/vf_signalstats.o
CC	libavfilter/vf_ssim.o
CC	libavfilter/vf_stack.o
CC	libavfilter/vf_swapuv.o
CC	libavfilter/vf_telecine.o
CC	libavfilter/vf_thumbnail.o
CC	libavfilter/vf_tile.o
CC	libavfilter/vf_transpose.o
CC	libavfilter/vf_unsharp.o
CC	libavfilter/vf_vectorscope.o
CC	libavfilter/vf_vflip.o
CC	libavfilter/vf_vignette.o
CC	libavfilter/vf_w3fdif.o
CC	libavfilter/vf_waveform.o
CC	libavfilter/vf_xbr.o
CC	libavfilter/vf_yadif.o
CC	libavfilter/vf_zoompan.o
CC	libavfilter/video.o
CC	libavfilter/vsink_nullsink.o
CC	libavfilter/vsrc_cellauto.o
CC	libavfilter/vsrc_life.o
CC	libavfilter/vsrc_mandelbrot.o
CC	libavfilter/vsrc_testsrc.o
YASM	libavfilter/x86/af_volume.o
STRIP	libavfilter/x86/af_volume.o
CC	libavfilter/x86/af_volume_init.o
YASM	libavfilter/x86/vf_gradfun.o
STRIP	libavfilter/x86/vf_gradfun.o
CC	libavfilter/x86/vf_gradfun_init.o
CC	libavfilter/x86/vf_idet_init.o
CC	libavfilter/x86/vf_noise.o
YASM	libavfilter/x86/vf_idet.o
STRIP	libavfilter/x86/vf_idet.o
CC	libavfilter/x86/vf_psnr_init.o
YASM	libavfilter/x86/vf_psnr.o
STRIP	libavfilter/x86/vf_psnr.o
CC	libavfilter/x86/vf_removegrain_init.o
CC	libavfilter/x86/vf_ssim_init.o
YASM	libavfilter/x86/vf_ssim.o
STRIP	libavfilter/x86/vf_ssim.o
CC	libavfilter/x86/vf_yadif_init.o
YASM	libavfilter/x86/vf_yadif.o
YASM	libavfilter/x86/yadif-10.o
STRIP	libavfilter/x86/vf_yadif.o
STRIP	libavfilter/x86/yadif-10.o
CC	libavformat/aacdec.o
CC	libavformat/adtsenc.o
CC	libavformat/allformats.o
YASM	libavfilter/x86/yadif-16.o
CC	libavformat/apetag.o
CC	libavformat/avc.o
CC	libavformat/avio.o
STRIP	libavfilter/x86/yadif-16.o
CC	libavformat/aviobuf.o
CC	libavformat/cache.o
CC	libavformat/concat.o
CC	libavformat/concatdec.o
CC	libavformat/crypto.o
CC	libavformat/cutils.o
CC	libavformat/data_uri.o
CC	libavformat/dump.o
CC	libavformat/file.o
CC	libavformat/flvdec.o
CC	libavformat/format.o
libavformat/format.c: In function 'av_probe_input_format3':
libavformat/format.c:178:17: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
         lpd.buf = zerobuffer;
                 ^
CC	libavformat/ftp.o
CC	libavformat/hevc.o
CC	libavformat/hls.o
libavformat/hls.c:501:12: warning: 'open_in' defined but not used [-Wunused-function]
 static int open_in(HLSContext *c, AVIOContext **in, const char *url)
            ^
CC	libavformat/hlsproto.o
CC	libavformat/http.o
CC	libavformat/httpauth.o
CC	libavformat/icecast.o
CC	libavformat/id3v1.o
CC	libavformat/id3v2.o
CC	libavformat/id3v2enc.o
CC	libavformat/img2.o
CC	libavformat/isom.o
CC	libavformat/latmenc.o
CC	libavformat/loasdec.o
CC	libavformat/m4vdec.o
CC	libavformat/md5proto.o
CC	libavformat/metadata.o
CC	libavformat/mov.o
CC	libavformat/mov_chan.o
CC	libavformat/movenc.o
libavformat/movenc.c: In function 'ff_mov_write_packet':
libavformat/movenc.c:4544:1: warning: label 'end' defined but not used [-Wunused-label]
 end:
 ^
CC	libavformat/movenchint.o
libavformat/movenc.c: In function 'mov_flush_fragment':
libavformat/movenc.c:857:8: warning: assuming signed overflow does not occur when assuming that (X - c) > X is always false [-Wstrict-overflow]
     if (cluster_idx >= track->entry)
        ^
CC	libavformat/mp3dec.o
CC	libavformat/mpeg.o
CC	libavformat/mpegts.o
CC	libavformat/mpegtsenc.o
CC	libavformat/mpegvideodec.o
CC	libavformat/mux.o
CC	libavformat/network.o
CC	libavformat/options.o
CC	libavformat/os_support.o
CC	libavformat/rawdec.o
CC	libavformat/rawenc.o
libavformat/rawenc.c:32:12: warning: 'force_one_stream' defined but not used [-Wunused-function]
 static int force_one_stream(AVFormatContext *s)
            ^
CC	libavformat/replaygain.o
CC	libavformat/riff.o
CC	libavformat/riffdec.o
CC	libavformat/riffenc.o
CC	libavformat/rtmphttp.o
CC	libavformat/rtmppkt.o
CC	libavformat/rtmpproto.o
CC	libavformat/rtp.o
CC	libavformat/rtpenc_chain.o
CC	libavformat/sdp.o
CC	libavformat/subfile.o
CC	libavformat/tcp.o
CC	libavformat/udp.o
CC	libavformat/url.o
CC	libavformat/urldecode.o
CC	libavformat/utils.o
CC	libavcodec/aac_ac3_parser.o
libavformat/utils.c: In function 'avformat_find_stream_info':
libavformat/utils.c:3118:9: warning: 'max_analyze_duration' is deprecated (declared at libavformat/avformat.h:1414) [-Wdeprecated-declarations]
         max_analyze_duration = ic->max_analyze_duration;
         ^
CC	libavcodec/aac_adtstoasc_bsf.o
CC	libavcodec/aac_parser.o
CC	libavcodec/aacadtsdec.o
CC	libavcodec/aacdec.o
CC	libavcodec/aacps_float.o
CC	libavcodec/aacpsdsp_float.o
CC	libavcodec/aacsbr.o
CC	libavcodec/aactab.o
CC	libavcodec/ac3tab.o
CC	libavcodec/allcodecs.o
CC	libavcodec/audioconvert.o
CC	libavcodec/avdct.o
CC	libavcodec/avfft.o
CC	libavcodec/avpacket.o
CC	libavcodec/avpicture.o
CC	libavcodec/bitstream.o
CC	libavcodec/bitstream_filter.o
CC	libavcodec/blockdsp.o
CC	libavcodec/cabac.o
CC	libavcodec/chomp_bsf.o
CC	libavcodec/codec_desc.o
CC	libavcodec/dct.o
CC	libavcodec/dct32_fixed.o
CC	libavcodec/dct32_float.o
CC	libavcodec/dump_extradata_bsf.o
CC	libavcodec/elbg.o
CC	libavcodec/dv_profile.o
CC	libavcodec/faandct.o
CC	libavcodec/faanidct.o
CC	libavcodec/fdctdsp.o
CC	libavcodec/error_resilience.o
CC	libavcodec/fft_fixed.o
CC	libavcodec/fft_fixed_32.o
CC	libavcodec/fft_float.o
CC	libavcodec/fft_init_table.o
CC	libavcodec/flvdec.o
CC	libavcodec/golomb.o
CC	libavcodec/h263.o
CC	libavcodec/h263_parser.o
CC	libavcodec/h263data.o
CC	libavcodec/h263dsp.o
CC	libavcodec/h264.o
CC	libavcodec/h263dec.o
CC	libavcodec/h264_cabac.o
CC	libavcodec/h264_cavlc.o
libavcodec/h264_cavlc.c: In function 'decode_residual.isra.18':
libavcodec/h264_cavlc.c:605:46: warning: array subscript is above array bounds [-Warray-bounds]
             ((type*)block)[*scantable]= level[i]; \
                                              ^
libavcodec/h264_cavlc.c:625:9: note: in expansion of macro 'STORE_BLOCK'
         STORE_BLOCK(int32_t)
         ^
libavcodec/h264_cavlc.c:605:46: warning: array subscript is above array bounds [-Warray-bounds]
             ((type*)block)[*scantable]= level[i]; \
                                              ^
libavcodec/h264_cavlc.c:627:9: note: in expansion of macro 'STORE_BLOCK'
         STORE_BLOCK(int16_t)
         ^
CC	libavcodec/h264_direct.o
CC	libavcodec/h264_loopfilter.o
CC	libavcodec/h264_mb.o
CC	libavcodec/h264_mp4toannexb_bsf.o
CC	libavcodec/h264_parser.o
CC	libavcodec/h264_picture.o
CC	libavcodec/h264_ps.o
CC	libavcodec/h264_refs.o
CC	libavcodec/h264_sei.o
CC	libavcodec/h264_slice.o
CC	libavcodec/h264chroma.o
CC	libavcodec/h264dsp.o
CC	libavcodec/h264idct.o
CC	libavcodec/h264pred.o
CC	libavcodec/h264qpel.o
CC	libavcodec/hevc_mp4toannexb_bsf.o
libavcodec/hevc_mp4toannexb_bsf.c: In function 'hevc_mp4toannexb_filter':
libavcodec/hevc_mp4toannexb_bsf.c:137:27: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
             *poutbuf      = buf;
                           ^
CC	libavcodec/hpeldsp.o
CC	libavcodec/huffman.o
CC	libavcodec/idctdsp.o
CC	libavcodec/imdct15.o
CC	libavcodec/imgconvert.o
CC	libavcodec/imx_dump_header_bsf.o
CC	libavcodec/intelh263dec.o
CC	libavcodec/ituh263dec.o
CC	libavcodec/jfdctfst.o
CC	libavcodec/jfdctint.o
CC	libavcodec/jrevdct.o
CC	libavcodec/kbdwin.o
CC	libavcodec/latm_parser.o
CC	libavcodec/mathtables.o
CC	libavcodec/mdct_fixed.o
CC	libavcodec/mdct_fixed_32.o
CC	libavcodec/mdct_float.o
CC	libavcodec/me_cmp.o
CC	libavcodec/mp3_header_decompress_bsf.o
CC	libavcodec/mpeg4_unpack_bframes_bsf.o
CC	libavcodec/mpeg4audio.o
CC	libavcodec/mpeg4video.o
CC	libavcodec/mpeg4videodec.o
CC	libavcodec/mpeg_er.o
CC	libavcodec/mpegaudio.o
CC	libavcodec/mpegaudio_parser.o
CC	libavcodec/mpegaudiodata.o
CC	libavcodec/mpegaudiodec_fixed.o
CC	libavcodec/mpegaudiodec_float.o
CC	libavcodec/mpegaudiodecheader.o
CC	libavcodec/mpegaudiodsp.o
CC	libavcodec/mpegaudiodsp_data.o
CC	libavcodec/mpegaudiodsp_fixed.o
CC	libavcodec/mpegaudiodsp_float.o
CC	libavcodec/mpegpicture.o
CC	libavcodec/mpegutils.o
CC	libavcodec/mpegvideo.o
CC	libavcodec/mpegvideo_motion.o
CC	libavcodec/mpegvideodata.o
CC	libavcodec/mpegvideodsp.o
CC	libavcodec/noise_bsf.o
CC	libavcodec/options.o
libavcodec/options.c: In function 'avcodec_copy_context':
libavcodec/options.c:202:5: warning: passing argument 2 of 'av_opt_copy' discards 'const' qualifier from pointer target type [enabled by default]
     av_opt_copy(dest, src);
     ^
In file included from libavcodec/options.c:32:0:
./libavutil/opt.h:838:5: note: expected 'void *' but argument is of type 'const struct AVCodecContext *'
 int av_opt_copy(void *dest, FF_CONST_AVUTIL55 void *src);
     ^
CC	libavcodec/parser.o
CC	libavcodec/pixblockdsp.o
CC	libavcodec/pthread.o
CC	libavcodec/pthread_frame.o
CC	libavcodec/pthread_slice.o
CC	libavcodec/qsv_api.o
CC	libavcodec/raw.o
CC	libavcodec/qpeldsp.o
CC	libavcodec/rdft.o
CC	libavcodec/remove_extradata_bsf.o
CC	libavcodec/resample.o
CC	libavcodec/resample2.o
CC	libavcodec/rl.o
CC	libavcodec/sbrdsp.o
CC	libavcodec/simple_idct.o
CC	libavcodec/sinewin.o
CC	libavcodec/sinewin_fixed.o
CC	libavcodec/startcode.o
CC	libavcodec/utils.o
CC	libavcodec/videodsp.o
CC	libavcodec/vorbis_parser.o
CC	libavcodec/vp3dsp.o
CC	libavcodec/vp56data.o
CC	libavcodec/vp56.o
CC	libavcodec/vp56dsp.o
CC	libavcodec/vp56rac.o
CC	libavcodec/vp6.o
CC	libavcodec/vp6dsp.o
YASM	libavcodec/x86/aacpsdsp.o
STRIP	libavcodec/x86/aacpsdsp.o
CC	libavcodec/x86/aacpsdsp_init.o
CC	libavcodec/x86/blockdsp_init.o
YASM	libavcodec/x86/blockdsp.o
STRIP	libavcodec/x86/blockdsp.o
CC	libavcodec/x86/constants.o
CC	libavcodec/x86/dct_init.o
YASM	libavcodec/x86/dct32.o
YASM	libavcodec/x86/deinterlace.o
STRIP	libavcodec/x86/deinterlace.o
STRIP	libavcodec/x86/dct32.o
CC	libavcodec/x86/fdctdsp_init.o
CC	libavcodec/x86/fdct.o
CC	libavcodec/x86/fft_init.o
YASM	libavcodec/x86/fpel.o
YASM	libavcodec/x86/fft.o
STRIP	libavcodec/x86/fpel.o
YASM	libavcodec/x86/h263_loopfilter.o
STRIP	libavcodec/x86/h263_loopfilter.o
CC	libavcodec/x86/h263dsp_init.o
STRIP	libavcodec/x86/fft.o
YASM	libavcodec/x86/h264_chromamc_10bit.o
STRIP	libavcodec/x86/h264_chromamc_10bit.o
YASM	libavcodec/x86/h264_chromamc.o
STRIP	libavcodec/x86/h264_chromamc.o
YASM	libavcodec/x86/h264_deblock.o
YASM	libavcodec/x86/h264_deblock_10bit.o
STRIP	libavcodec/x86/h264_deblock.o
STRIP	libavcodec/x86/h264_deblock_10bit.o
YASM	libavcodec/x86/h264_idct.o
YASM	libavcodec/x86/h264_idct_10bit.o
STRIP	libavcodec/x86/h264_idct_10bit.o
STRIP	libavcodec/x86/h264_idct.o
YASM	libavcodec/x86/h264_intrapred_10bit.o
YASM	libavcodec/x86/h264_intrapred.o
STRIP	libavcodec/x86/h264_intrapred_10bit.o
CC	libavcodec/x86/h264_intrapred_init.o
CC	libavcodec/x86/h264_qpel.o
STRIP	libavcodec/x86/h264_intrapred.o
YASM	libavcodec/x86/h264_qpel_10bit.o
YASM	libavcodec/x86/h264_qpel_8bit.o
STRIP	libavcodec/x86/h264_qpel_10bit.o
YASM	libavcodec/x86/h264_weight.o
STRIP	libavcodec/x86/h264_weight.o
STRIP	libavcodec/x86/h264_qpel_8bit.o
YASM	libavcodec/x86/h264_weight_10bit.o
CC	libavcodec/x86/h264chroma_init.o
STRIP	libavcodec/x86/h264_weight_10bit.o
CC	libavcodec/x86/h264dsp_init.o
CC	libavcodec/x86/hpeldsp_init.o
YASM	libavcodec/x86/hpeldsp.o
STRIP	libavcodec/x86/hpeldsp.o
YASM	libavcodec/x86/idctdsp.o
CC	libavcodec/x86/idctdsp_init.o
STRIP	libavcodec/x86/idctdsp.o
YASM	libavcodec/x86/imdct36.o
YASM	libavcodec/x86/me_cmp.o
STRIP	libavcodec/x86/imdct36.o
CC	libavcodec/x86/me_cmp_init.o
CC	libavcodec/x86/mpegaudiodsp.o
STRIP	libavcodec/x86/me_cmp.o
CC	libavcodec/x86/mpegvideo.o
CC	libavcodec/x86/mpegvideodsp.o
CC	libavcodec/x86/pixblockdsp_init.o
YASM	libavcodec/x86/pixblockdsp.o
STRIP	libavcodec/x86/pixblockdsp.o
YASM	libavcodec/x86/qpel.o
STRIP	libavcodec/x86/qpel.o
CC	libavcodec/x86/qpeldsp_init.o
YASM	libavcodec/x86/qpeldsp.o
YASM	libavcodec/x86/sbrdsp.o
STRIP	libavcodec/x86/sbrdsp.o
STRIP	libavcodec/x86/qpeldsp.o
CC	libavcodec/x86/sbrdsp_init.o
CC	libavcodec/x86/simple_idct.o
CC	libavcodec/x86/videodsp_init.o
YASM	libavcodec/x86/videodsp.o
YASM	libavcodec/x86/vp3dsp.o
STRIP	libavcodec/x86/videodsp.o
CC	libavcodec/x86/vp3dsp_init.o
STRIP	libavcodec/x86/vp3dsp.o
CC	libavcodec/x86/vp6dsp_init.o
YASM	libavcodec/x86/vp6dsp.o
STRIP	libavcodec/x86/vp6dsp.o
CC	libavcodec/xiph.o
CC	libswresample/audioconvert.o
CC	libswresample/dither.o
CC	libswresample/options.o
CC	libswresample/rematrix.o
CC	libswresample/resample.o
CC	libswresample/resample_dsp.o
CC	libswresample/swresample.o
CC	libswresample/swresample_frame.o
CC	libswresample/x86/audio_convert_init.o
YASM	libswresample/x86/rematrix.o
STRIP	libswresample/x86/rematrix.o
CC	libswresample/x86/rematrix_init.o
YASM	libswresample/x86/audio_convert.o
YASM	libswresample/x86/resample.o
STRIP	libswresample/x86/resample.o
CC	libswresample/x86/resample_init.o
CC	libswscale/alphablend.o
CC	libswscale/gamma.o
CC	libswscale/hscale.o
CC	libswscale/hscale_fast_bilinear.o
CC	libswscale/input.o
STRIP	libswresample/x86/audio_convert.o
CC	libswscale/options.o
CC	libswscale/output.o
libswscale/output.c:1172:21: warning: 'yuv2rgba64be_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, rgba64be, AV_PIX_FMT_RGBA64BE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1172:21: warning: 'yuv2rgba64be_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, rgba64be, AV_PIX_FMT_RGBA64BE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1172:21: warning: 'yuv2rgba64be_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, rgba64be, AV_PIX_FMT_RGBA64BE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1173:21: warning: 'yuv2rgba64le_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, rgba64le, AV_PIX_FMT_RGBA64LE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1173:21: warning: 'yuv2rgba64le_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, rgba64le, AV_PIX_FMT_RGBA64LE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1173:21: warning: 'yuv2rgba64le_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, rgba64le, AV_PIX_FMT_RGBA64LE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1176:21: warning: 'yuv2bgra64be_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, bgra64be, AV_PIX_FMT_BGRA64BE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1176:21: warning: 'yuv2bgra64be_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, bgra64be, AV_PIX_FMT_BGRA64BE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1176:21: warning: 'yuv2bgra64be_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, bgra64be, AV_PIX_FMT_BGRA64BE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1177:21: warning: 'yuv2bgra64le_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, bgra64le, AV_PIX_FMT_BGRA64LE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1177:21: warning: 'yuv2bgra64le_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, bgra64le, AV_PIX_FMT_BGRA64LE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1177:21: warning: 'yuv2bgra64le_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, bgra64le, AV_PIX_FMT_BGRA64LE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1185:21: warning: 'yuv2rgba64be_full_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, rgba64be_full, AV_PIX_FMT_RGBA64BE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1185:21: warning: 'yuv2rgba64be_full_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, rgba64be_full, AV_PIX_FMT_RGBA64BE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1185:21: warning: 'yuv2rgba64be_full_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, rgba64be_full, AV_PIX_FMT_RGBA64BE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1186:21: warning: 'yuv2rgba64le_full_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, rgba64le_full, AV_PIX_FMT_RGBA64LE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1186:21: warning: 'yuv2rgba64le_full_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, rgba64le_full, AV_PIX_FMT_RGBA64LE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1186:21: warning: 'yuv2rgba64le_full_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, rgba64le_full, AV_PIX_FMT_RGBA64LE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1189:21: warning: 'yuv2bgra64be_full_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, bgra64be_full, AV_PIX_FMT_BGRA64BE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1189:21: warning: 'yuv2bgra64be_full_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, bgra64be_full, AV_PIX_FMT_BGRA64BE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1189:21: warning: 'yuv2bgra64be_full_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, bgra64be_full, AV_PIX_FMT_BGRA64BE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1190:21: warning: 'yuv2bgra64le_full_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, bgra64le_full, AV_PIX_FMT_BGRA64LE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1190:21: warning: 'yuv2bgra64le_full_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, bgra64le_full, AV_PIX_FMT_BGRA64LE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1190:21: warning: 'yuv2bgra64le_full_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, bgra64le_full, AV_PIX_FMT_BGRA64LE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
CC	libswscale/rgb2rgb.o
CC	libswscale/slice.o
CC	libswscale/swscale.o
libswscale/swscale.c: In function 'swscale':
libswscale/swscale.c:382:9: warning: unused variable 'perform_gamma' [-Wunused-variable]
     int perform_gamma = c->is_internal_gamma;
         ^
libswscale/swscale.c: At top level:
libswscale/swscale.c:55:13: warning: 'gamma_convert' defined but not used [-Wunused-function]
 static void gamma_convert(uint8_t * src[], int width, uint16_t *gamma)
             ^
CC	libswscale/swscale_unscaled.o
CC	libswscale/utils.o
CC	libswscale/vscale.o
CC	libswscale/x86/hscale_fast_bilinear_simd.o
YASM	libswscale/x86/output.o
YASM	libswscale/x86/input.o
STRIP	libswscale/x86/output.o
CC	libswscale/x86/rgb2rgb.o
STRIP	libswscale/x86/input.o
CC	libswscale/x86/swscale.o
YASM	libswscale/x86/scale.o
CC	libswscale/x86/yuv2rgb.o
CC	libswscale/yuv2rgb.o
STRIP	libswscale/x86/scale.o
CC	libavutil/../compat/strtod.o
libavutil/../compat/strtod.c: In function 'avpriv_strtod':
libavutil/../compat/strtod.c:55:13: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
         end = nptr + 8;
             ^
libavutil/../compat/strtod.c:58:13: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
         end = nptr + 3;
             ^
libavutil/../compat/strtod.c:61:13: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
         end = nptr + 9;
             ^
libavutil/../compat/strtod.c:64:13: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
         end = nptr + 4;
             ^
libavutil/../compat/strtod.c:67:13: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
         end = nptr + 9;
             ^
libavutil/../compat/strtod.c:70:13: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
         end = nptr + 4;
             ^
libavutil/../compat/strtod.c:73:9: warning: passing argument 1 of 'check_nan_suffix' discards 'const' qualifier from pointer target type [enabled by default]
         end = check_nan_suffix(nptr + 3);
         ^
libavutil/../compat/strtod.c:28:14: note: expected 'char *' but argument is of type 'const char *'
 static char *check_nan_suffix(char *s)
              ^
libavutil/../compat/strtod.c:77:9: warning: passing argument 1 of 'check_nan_suffix' discards 'const' qualifier from pointer target type [enabled by default]
         end = check_nan_suffix(nptr + 4);
         ^
libavutil/../compat/strtod.c:28:14: note: expected 'char *' but argument is of type 'const char *'
 static char *check_nan_suffix(char *s)
              ^
CC	libavutil/adler32.o
CC	libavutil/aes.o
CC	libavutil/audio_fifo.o
CC	libavutil/avstring.o
CC	libavutil/base64.o
CC	libavutil/blowfish.o
CC	libavutil/bprint.o
CC	libavutil/buffer.o
CC	libavutil/camellia.o
CC	libavutil/cast5.o
CC	libavutil/channel_layout.o
CC	libavutil/color_utils.o
CC	libavutil/cpu.o
CC	libavutil/crc.o
CC	libavutil/des.o
CC	libavutil/dict.o
CC	libavutil/display.o
CC	libavutil/downmix_info.o
CC	libavutil/error.o
CC	libavutil/eval.o
CC	libavutil/fifo.o
CC	libavutil/file.o
CC	libavutil/file_open.o
CC	libavutil/fixed_dsp.o
CC	libavutil/float_dsp.o
CC	libavutil/frame.o
libavutil/frame.c: In function 'av_frame_set_qp_table':
libavutil/frame.c:55:5: warning: 'qscale_table' is deprecated (declared at libavutil/frame.h:293) [-Wdeprecated-declarations]
     f->qscale_table = buf->data;
     ^
libavutil/frame.c:56:5: warning: 'qstride' is deprecated (declared at libavutil/frame.h:298) [-Wdeprecated-declarations]
     f->qstride      = stride;
     ^
libavutil/frame.c:57:5: warning: 'qscale_type' is deprecated (declared at libavutil/frame.h:301) [-Wdeprecated-declarations]
     f->qscale_type  = qp_type;
     ^
libavutil/frame.c: In function 'av_frame_get_qp_table':
libavutil/frame.c:64:5: warning: 'qstride' is deprecated (declared at libavutil/frame.h:298) [-Wdeprecated-declarations]
     *stride = f->qstride;
     ^
libavutil/frame.c:65:5: warning: 'qscale_type' is deprecated (declared at libavutil/frame.h:301) [-Wdeprecated-declarations]
     *type   = f->qscale_type;
     ^
libavutil/frame.c: In function 'frame_copy_props':
libavutil/frame.c:350:5: warning: 'qscale_table' is deprecated (declared at libavutil/frame.h:293) [-Wdeprecated-declarations]
     dst->qscale_table = NULL;
     ^
libavutil/frame.c:351:5: warning: 'qstride' is deprecated (declared at libavutil/frame.h:298) [-Wdeprecated-declarations]
     dst->qstride      = 0;
     ^
libavutil/frame.c:352:5: warning: 'qscale_type' is deprecated (declared at libavutil/frame.h:301) [-Wdeprecated-declarations]
     dst->qscale_type  = 0;
     ^
libavutil/frame.c:356:13: warning: 'qscale_table' is deprecated (declared at libavutil/frame.h:293) [-Wdeprecated-declarations]
             dst->qscale_table = dst->qp_table_buf->data;
             ^
libavutil/frame.c:357:13: warning: 'qstride' is deprecated (declared at libavutil/frame.h:298) [-Wdeprecated-declarations]
             dst->qstride      = src->qstride;
             ^
libavutil/frame.c:357:13: warning: 'qstride' is deprecated (declared at libavutil/frame.h:298) [-Wdeprecated-declarations]
libavutil/frame.c:358:13: warning: 'qscale_type' is deprecated (declared at libavutil/frame.h:301) [-Wdeprecated-declarations]
             dst->qscale_type  = src->qscale_type;
             ^
libavutil/frame.c:358:13: warning: 'qscale_type' is deprecated (declared at libavutil/frame.h:301) [-Wdeprecated-declarations]
CC	libavutil/hash.o
CC	libavutil/hmac.o
CC	libavutil/imgutils.o
CC	libavutil/intmath.o
CC	libavutil/lfg.o
CC	libavutil/lls.o
CC	libavutil/log.o
CC	libavutil/log2_tab.o
CC	libavutil/mathematics.o
CC	libavutil/md5.o
CC	libavutil/mem.o
CC	libavutil/murmur3.o
CC	libavutil/opt.o
CC	libavutil/parseutils.o
CC	libavutil/pixdesc.o
CC	libavutil/pixelutils.o
CC	libavutil/random_seed.o
CC	libavutil/rational.o
CC	libavutil/rc4.o
CC	libavutil/reverse.o
CC	libavutil/ripemd.o
CC	libavutil/samplefmt.o
CC	libavutil/sha.o
CC	libavutil/sha512.o
CC	libavutil/stereo3d.o
CC	libavutil/tea.o
CC	libavutil/threadmessage.o
CC	libavutil/time.o
CC	libavutil/timecode.o
CC	libavutil/tree.o
CC	libavutil/twofish.o
CC	libavutil/utils.o
CC	libavutil/x86/cpu.o
YASM	libavutil/x86/cpuid.o
STRIP	libavutil/x86/cpuid.o
YASM	libavutil/x86/float_dsp.o
STRIP	libavutil/x86/float_dsp.o
CC	libavutil/x86/float_dsp_init.o
CC	libavutil/x86/lls_init.o
YASM	libavutil/x86/lls.o
STRIP	libavutil/x86/lls.o
CC	libavutil/x86/pixelutils_init.o
CC	libavutil/xga_font_data.o
CC	libavutil/xtea.o
YASM	libavutil/x86/pixelutils.o
AR	libavfilter/libavfilter.a
STRIP	libavutil/x86/pixelutils.o
AR	libavformat/libavformat.a
AR	libavcodec/libavcodec.a
AR	libswresample/libswresample.a
AR	libswscale/libswscale.a
AR	libavutil/libavutil.a
INSTALL	libavfilter/libavfilter.a
INSTALL	libavformat/libavformat.a
INSTALL	libavcodec/libavcodec.a
INSTALL	libswresample/libswresample.a
INSTALL	libswscale/libswscale.a
INSTALL	libavutil/libavutil.a
INSTALL	libavfilter/asrc_abuffer.h
INSTALL	libavfilter/avcodec.h
INSTALL	libavfilter/avfilter.h
INSTALL	libavfilter/avfiltergraph.h
INSTALL	libavfilter/buffersink.h
INSTALL	libavfilter/buffersrc.h
INSTALL	libavfilter/version.h
INSTALL	libavfilter/libavfilter.pc
INSTALL	libavformat/avformat.h
INSTALL	libavformat/avio.h
INSTALL	libavformat/version.h
INSTALL	libavformat/avc.h
INSTALL	libavformat/url.h
INSTALL	libavformat/internal.h
INSTALL	libavformat/libavformat.pc
INSTALL	libavcodec/avcodec.h
INSTALL	libavcodec/avfft.h
INSTALL	libavcodec/dv_profile.h
INSTALL	libavcodec/d3d11va.h
INSTALL	libavcodec/dxva2.h
INSTALL	libavcodec/old_codec_ids.h
INSTALL	libavcodec/qsv.h
INSTALL	libavcodec/vaapi.h
INSTALL	libavcodec/vda.h
INSTALL	libavcodec/vdpau.h
INSTALL	libavcodec/version.h
INSTALL	libavcodec/videotoolbox.h
INSTALL	libavcodec/vorbis_parser.h
INSTALL	libavcodec/xvmc.h
INSTALL	libavcodec/libavcodec.pc
INSTALL	libswresample/swresample.h
INSTALL	libswresample/version.h
INSTALL	libswresample/libswresample.pc
INSTALL	libswscale/swscale.h
INSTALL	libswscale/version.h
INSTALL	libswscale/libswscale.pc
INSTALL	libavutil/adler32.h
INSTALL	libavutil/aes.h
INSTALL	libavutil/attributes.h
INSTALL	libavutil/audio_fifo.h
INSTALL	libavutil/audioconvert.h
INSTALL	libavutil/avassert.h
INSTALL	libavutil/avstring.h
INSTALL	libavutil/avutil.h
INSTALL	libavutil/base64.h
INSTALL	libavutil/blowfish.h
INSTALL	libavutil/bprint.h
INSTALL	libavutil/bswap.h
INSTALL	libavutil/buffer.h
INSTALL	libavutil/cast5.h
INSTALL	libavutil/camellia.h
INSTALL	libavutil/channel_layout.h
INSTALL	libavutil/common.h
INSTALL	libavutil/cpu.h
INSTALL	libavutil/crc.h
INSTALL	libavutil/display.h
INSTALL	libavutil/downmix_info.h
INSTALL	libavutil/error.h
INSTALL	libavutil/eval.h
INSTALL	libavutil/fifo.h
INSTALL	libavutil/file.h
INSTALL	libavutil/frame.h
INSTALL	libavutil/hash.h
INSTALL	libavutil/hmac.h
INSTALL	libavutil/imgutils.h
INSTALL	libavutil/intfloat.h
INSTALL	libavutil/intreadwrite.h
INSTALL	libavutil/lfg.h
INSTALL	libavutil/log.h
INSTALL	libavutil/macros.h
INSTALL	libavutil/mathematics.h
INSTALL	libavutil/md5.h
INSTALL	libavutil/mem.h
INSTALL	libavutil/motion_vector.h
INSTALL	libavutil/murmur3.h
INSTALL	libavutil/dict.h
INSTALL	libavutil/old_pix_fmts.h
INSTALL	libavutil/opt.h
INSTALL	libavutil/parseutils.h
INSTALL	libavutil/pixdesc.h
INSTALL	libavutil/pixelutils.h
INSTALL	libavutil/pixfmt.h
INSTALL	libavutil/random_seed.h
INSTALL	libavutil/replaygain.h
INSTALL	libavutil/rational.h
INSTALL	libavutil/ripemd.h
INSTALL	libavutil/samplefmt.h
INSTALL	libavutil/sha.h
INSTALL	libavutil/sha512.h
INSTALL	libavutil/stereo3d.h
INSTALL	libavutil/threadmessage.h
INSTALL	libavutil/time.h
INSTALL	libavutil/timecode.h
INSTALL	libavutil/timestamp.h
INSTALL	libavutil/twofish.h
INSTALL	libavutil/version.h
INSTALL	libavutil/xtea.h
INSTALL	libavutil/tea.h
INSTALL	libavutil/thread.h
INSTALL	libavutil/avconfig.h
INSTALL	libavutil/ffversion.h
INSTALL	libavutil/libavutil.pc

--------------------
[*] link ffmpeg
--------------------


--------------------
[*] create files for shared ffmpeg
--------------------
====================
[*] check env arm64
====================
build on Linux x86_64
ANDROID_SDK=/home/zhangbin/android/sdk/android-sdk-linux
ANDROID_NDK=/home/zhangbin/android/NDK/android-ndk-r10e
NDKr10e-rc4 (64-bit) detected

--------------------
[*] make NDK standalone toolchain
--------------------
Copying prebuilt binaries...
Copying sysroot headers and libraries...
Copying c++ runtime headers and libraries...
Copying files to: /home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/contrib/build/ffmpeg-arm64/toolchain
Cleaning up...
Done.

--------------------
[*] check ffmpeg env
--------------------

--------------------
[*] configurate ffmpeg
--------------------
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/contrib/build/ffmpeg-arm64/toolchain/bin/aarch64-linux-android-gcc
install prefix            /home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/contrib/build/ffmpeg-arm64/output
source path               .
C compiler                aarch64-linux-android-gcc
C library                 bionic
host C compiler           gcc
host C library            glibc
ARCH                      aarch64 (generic)
big-endian                no
runtime cpu detection     yes
NEON enabled              yes
VFP enabled               yes
debug symbols             yes
strip symbols             yes
optimize for size         no
optimizations             yes
static                    yes
shared                    no
postprocessing support    no
new filter support        yes
network support           yes
threading support         pthreads
safe bitstream reader     yes
SDL support               no
opencl enabled            no
texi2html enabled         no
perl enabled              yes
pod2man enabled           yes
makeinfo enabled          yes
makeinfo supports HTML    yes

Enabled programs:

External libraries:
zlib

Enabled decoders:
aac			h264			mp3on4
aac_latm		mp3			mp3on4float
flv			mp3adu			vp6
h263			mp3adufloat		vp6a
h263i			mp3float		vp6f
h263p

Enabled encoders:

Enabled hwaccels:

Enabled parsers:
aac			h263			mpegaudio
aac_latm		h264

Enabled demuxers:
aac			latm			mp3
concat			live_flv		mpegps
data			loas			mpegts
flv			m4v			mpegvideo
hls			mov

Enabled muxers:
adts			mov			mpegts
latm			mp4

Enabled protocols:
cache			hls			rtmp
concat			http			rtmpt
crypto			httpproxy		subfile
data			icecast			tcp
ffrtmphttp		md5			udp
file			pipe			udplite
ftp

Enabled filters:
acrossfade		dctdnoiz		paletteuse
adelay			deband			pan
adrawgraph		decimate		perms
aecho			deflate			pixdesctest
aeval			dejudder		psnr
aevalsrc		deshake			qp
afade			detelecine		random
aformat			dilation		removegrain
ainterleave		drawbox			removelogo
allpass			drawgraph		replaygain
allrgb			drawgrid		reverse
allyuv			dynaudnorm		rgbtestsrc
alphaextract		earwax			rotate
alphamerge		edgedetect		scale
amerge			elbg			scale2ref
amix			equalizer		select
amovie			erosion			sendcmd
anull			extractplanes		separatefields
anullsink		fade			setdar
anullsrc		fftfilt			setfield
apad			field			setpts
aperms			fieldmatch		setsar
aphasemeter		fieldorder		settb
aphaser			flanger			showcqt
aresample		format			showfreqs
areverse		fps			showinfo
aselect			framepack		showpalette
asendcmd		framerate		showspectrum
asetnsamples		framestep		showvolume
asetpts			gradfun			showwaves
asetrate		haldclut		showwavespic
asettb			haldclutsrc		shuffleplanes
ashowinfo		hflip			sidechaincompress
asplit			highpass		signalstats
astats			histogram		silencedetect
astreamsync		hqx			silenceremove
atadenoise		hstack			sine
atempo			hue			smptebars
atrim			idet			smptehdbars
avectorscope		il			split
bandpass		inflate			ssim
bandreject		interleave		swapuv
bass			join			tblend
bbox			lenscorrection		telecine
biquad			life			testsrc
blackdetect		lowpass			thumbnail
blend			lut			tile
cellauto		lut3d			transpose
channelmap		lutrgb			treble
channelsplit		lutyuv			trim
chorus			mandelbrot		unsharp
codecview		mergeplanes		vectorscope
color			movie			vflip
colorbalance		negate			vignette
colorchannelmixer	noformat		volume
colorkey		noise			volumedetect
colorlevels		null			vstack
compand			nullsink		w3fdif
concat			nullsrc			waveform
copy			overlay			xbr
crop			pad			yadif
curves			palettegen		zoompan
dcshift

Enabled bsfs:
aac_adtstoasc		hevc_mp4toannexb	mpeg4_unpack_bframes
chomp			imx_dump_header		noise
dump_extradata		mp3_header_decompress	remove_extradata
h264_mp4toannexb

Enabled indevs:

Enabled outdevs:

License: LGPL version 2.1 or later
Creating config.mak, config.h, and doc/config.texi...

WARNING: aarch64-linux-android-pkg-config not found, library detection may fail.

--------------------
[*] compile ffmpeg
--------------------
CC	libavfilter/aeval.o
CC	libavfilter/af_adelay.o
CC	libavfilter/af_aecho.o
CC	libavfilter/af_afade.o
CC	libavfilter/af_aformat.o
CC	libavfilter/af_amerge.o
CC	libavfilter/af_amix.o
CC	libavfilter/af_anull.o
CC	libavfilter/af_apad.o
CC	libavfilter/af_aphaser.o
CC	libavfilter/af_aresample.o
CC	libavfilter/af_asetnsamples.o
CC	libavfilter/af_asetrate.o
CC	libavfilter/af_astats.o
CC	libavfilter/af_ashowinfo.o
CC	libavfilter/af_astreamsync.o
CC	libavfilter/af_atempo.o
CC	libavfilter/af_biquads.o
CC	libavfilter/af_channelmap.o
CC	libavfilter/af_channelsplit.o
CC	libavfilter/af_compand.o
CC	libavfilter/af_chorus.o
CC	libavfilter/af_dcshift.o
CC	libavfilter/af_dynaudnorm.o
CC	libavfilter/af_earwax.o
CC	libavfilter/af_flanger.o
CC	libavfilter/af_join.o
CC	libavfilter/af_pan.o
CC	libavfilter/af_replaygain.o
CC	libavfilter/af_sidechaincompress.o
CC	libavfilter/af_silencedetect.o
CC	libavfilter/af_silenceremove.o
CC	libavfilter/af_volume.o
CC	libavfilter/af_volumedetect.o
CC	libavfilter/allfilters.o
CC	libavfilter/asink_anullsink.o
CC	libavfilter/asrc_anullsrc.o
CC	libavfilter/asrc_sine.o
CC	libavfilter/audio.o
CC	libavfilter/avcodec.o
CC	libavfilter/avf_aphasemeter.o
CC	libavfilter/avf_avectorscope.o
CC	libavfilter/avf_concat.o
CC	libavfilter/avf_showcqt.o
CC	libavfilter/avf_showfreqs.o
CC	libavfilter/avf_showspectrum.o
CC	libavfilter/avf_showvolume.o
CC	libavfilter/avf_showwaves.o
CC	libavfilter/avfilter.o
CC	libavfilter/avfiltergraph.o
CC	libavfilter/bbox.o
CC	libavfilter/buffer.o
CC	libavfilter/buffersink.o
CC	libavfilter/buffersrc.o
libavfilter/buffersrc.c: In function 'av_buffersrc_buffer':
libavfilter/buffersrc.c:304:5: warning: 'av_buffersrc_add_ref' is deprecated (declared at libavfilter/buffersrc.c:205) [-Wdeprecated-declarations]
     return av_buffersrc_add_ref(ctx, buf, 0);
     ^
CC	libavfilter/dualinput.o
CC	libavfilter/drawutils.o
CC	libavfilter/f_drawgraph.o
CC	libavfilter/f_interleave.o
CC	libavfilter/f_reverse.o
CC	libavfilter/f_perms.o
CC	libavfilter/f_select.o
CC	libavfilter/f_sendcmd.o
CC	libavfilter/fifo.o
CC	libavfilter/formats.o
CC	libavfilter/framesync.o
CC	libavfilter/generate_wave_table.o
CC	libavfilter/graphdump.o
CC	libavfilter/graphparser.o
CC	libavfilter/lavfutils.o
CC	libavfilter/lswsutils.o
CC	libavfilter/opencl_allkernels.o
CC	libavfilter/pthread.o
CC	libavfilter/setpts.o
CC	libavfilter/settb.o
CC	libavfilter/src_movie.o
CC	libavfilter/split.o
CC	libavfilter/transform.o
CC	libavfilter/trim.o
CC	libavfilter/vf_alphamerge.o
CC	libavfilter/vf_aspect.o
CC	libavfilter/vf_atadenoise.o
CC	libavfilter/vf_bbox.o
CC	libavfilter/vf_blackdetect.o
CC	libavfilter/vf_blend.o
CC	libavfilter/vf_codecview.o
CC	libavfilter/vf_colorbalance.o
CC	libavfilter/vf_colorchannelmixer.o
CC	libavfilter/vf_colorkey.o
CC	libavfilter/vf_colorlevels.o
CC	libavfilter/vf_copy.o
CC	libavfilter/vf_crop.o
CC	libavfilter/vf_curves.o
CC	libavfilter/vf_dctdnoiz.o
CC	libavfilter/vf_deband.o
CC	libavfilter/vf_decimate.o
CC	libavfilter/vf_dejudder.o
CC	libavfilter/vf_deshake.o
CC	libavfilter/vf_detelecine.o
CC	libavfilter/vf_drawbox.o
CC	libavfilter/vf_edgedetect.o
CC	libavfilter/vf_elbg.o
CC	libavfilter/vf_extractplanes.o
CC	libavfilter/vf_fade.o
CC	libavfilter/vf_fftfilt.o
CC	libavfilter/vf_field.o
CC	libavfilter/vf_fieldmatch.o
CC	libavfilter/vf_fieldorder.o
CC	libavfilter/vf_format.o
CC	libavfilter/vf_fps.o
CC	libavfilter/vf_framepack.o
CC	libavfilter/vf_framerate.o
CC	libavfilter/vf_framestep.o
CC	libavfilter/vf_gradfun.o
CC	libavfilter/vf_hflip.o
CC	libavfilter/vf_histogram.o
CC	libavfilter/vf_hqx.o
CC	libavfilter/vf_hue.o
CC	libavfilter/vf_idet.o
CC	libavfilter/vf_il.o
CC	libavfilter/vf_lenscorrection.o
CC	libavfilter/vf_lut.o
CC	libavfilter/vf_lut3d.o
CC	libavfilter/vf_mergeplanes.o
CC	libavfilter/vf_neighbor.o
CC	libavfilter/vf_noise.o
CC	libavfilter/vf_null.o
CC	libavfilter/vf_overlay.o
CC	libavfilter/vf_pad.o
CC	libavfilter/vf_palettegen.o
CC	libavfilter/vf_paletteuse.o
CC	libavfilter/vf_pixdesctest.o
CC	libavfilter/vf_psnr.o
CC	libavfilter/vf_qp.o
CC	libavfilter/vf_random.o
CC	libavfilter/vf_removegrain.o
CC	libavfilter/vf_removelogo.o
CC	libavfilter/vf_rotate.o
CC	libavfilter/vf_scale.o
CC	libavfilter/vf_separatefields.o
CC	libavfilter/vf_setfield.o
CC	libavfilter/vf_showinfo.o
CC	libavfilter/vf_showpalette.o
CC	libavfilter/vf_shuffleplanes.o
CC	libavfilter/vf_signalstats.o
CC	libavfilter/vf_ssim.o
CC	libavfilter/vf_stack.o
CC	libavfilter/vf_swapuv.o
CC	libavfilter/vf_telecine.o
CC	libavfilter/vf_thumbnail.o
CC	libavfilter/vf_tile.o
CC	libavfilter/vf_transpose.o
CC	libavfilter/vf_unsharp.o
CC	libavfilter/vf_vectorscope.o
CC	libavfilter/vf_vflip.o
CC	libavfilter/vf_vignette.o
CC	libavfilter/vf_w3fdif.o
CC	libavfilter/vf_waveform.o
CC	libavfilter/vf_xbr.o
CC	libavfilter/vf_yadif.o
CC	libavfilter/vf_zoompan.o
CC	libavfilter/video.o
CC	libavfilter/vsink_nullsink.o
CC	libavfilter/vsrc_cellauto.o
CC	libavfilter/vsrc_life.o
CC	libavfilter/vsrc_mandelbrot.o
CC	libavfilter/vsrc_testsrc.o
CC	libavformat/aacdec.o
CC	libavformat/adtsenc.o
CC	libavformat/allformats.o
CC	libavformat/apetag.o
CC	libavformat/avc.o
CC	libavformat/avio.o
CC	libavformat/aviobuf.o
CC	libavformat/cache.o
CC	libavformat/concat.o
CC	libavformat/concatdec.o
CC	libavformat/crypto.o
CC	libavformat/cutils.o
CC	libavformat/data_uri.o
CC	libavformat/dump.o
CC	libavformat/file.o
CC	libavformat/flvdec.o
CC	libavformat/format.o
libavformat/format.c: In function 'av_probe_input_format3':
libavformat/format.c:178:17: warning: assignment discards 'const' qualifier from pointer target type
         lpd.buf = zerobuffer;
                 ^
CC	libavformat/ftp.o
CC	libavformat/hls.o
libavformat/hls.c:501:12: warning: 'open_in' defined but not used [-Wunused-function]
 static int open_in(HLSContext *c, AVIOContext **in, const char *url)
            ^
CC	libavformat/hevc.o
CC	libavformat/hlsproto.o
CC	libavformat/http.o
CC	libavformat/httpauth.o
CC	libavformat/id3v1.o
CC	libavformat/icecast.o
CC	libavformat/id3v2.o
CC	libavformat/id3v2enc.o
CC	libavformat/img2.o
CC	libavformat/latmenc.o
CC	libavformat/isom.o
CC	libavformat/loasdec.o
CC	libavformat/md5proto.o
CC	libavformat/m4vdec.o
CC	libavformat/metadata.o
CC	libavformat/mov_chan.o
CC	libavformat/mov.o
CC	libavformat/movenc.o
libavformat/movenc.c: In function 'ff_mov_write_packet':
libavformat/movenc.c:4544:1: warning: label 'end' defined but not used [-Wunused-label]
 end:
 ^
CC	libavformat/movenchint.o
libavformat/movenc.c: In function 'mov_flush_fragment':
libavformat/movenc.c:857:8: warning: assuming signed overflow does not occur when assuming that (X - c) > X is always false [-Wstrict-overflow]
     if (cluster_idx >= track->entry)
        ^
CC	libavformat/mp3dec.o
CC	libavformat/mpeg.o
CC	libavformat/mpegts.o
CC	libavformat/mpegtsenc.o
CC	libavformat/mpegvideodec.o
CC	libavformat/mux.o
CC	libavformat/network.o
CC	libavformat/options.o
CC	libavformat/os_support.o
CC	libavformat/rawdec.o
CC	libavformat/rawenc.o
CC	libavformat/replaygain.o
libavformat/rawenc.c:32:12: warning: 'force_one_stream' defined but not used [-Wunused-function]
 static int force_one_stream(AVFormatContext *s)
            ^
CC	libavformat/riff.o
CC	libavformat/riffdec.o
CC	libavformat/riffenc.o
CC	libavformat/rtmppkt.o
CC	libavformat/rtmphttp.o
CC	libavformat/rtmpproto.o
CC	libavformat/rtp.o
CC	libavformat/rtpenc_chain.o
CC	libavformat/sdp.o
CC	libavformat/subfile.o
CC	libavformat/tcp.o
CC	libavformat/udp.o
CC	libavformat/url.o
CC	libavformat/urldecode.o
CC	libavformat/utils.o
libavformat/utils.c: In function 'avformat_find_stream_info':
libavformat/utils.c:3118:9: warning: 'max_analyze_duration' is deprecated (declared at libavformat/avformat.h:1414) [-Wdeprecated-declarations]
         max_analyze_duration = ic->max_analyze_duration;
         ^
CC	libavcodec/aac_ac3_parser.o
CC	libavcodec/aac_adtstoasc_bsf.o
CC	libavcodec/aac_parser.o
CC	libavcodec/aacadtsdec.o
CC	libavcodec/aacdec.o
CC	libavcodec/aacps_float.o
CC	libavcodec/aacpsdsp_float.o
CC	libavcodec/aacsbr.o
CC	libavcodec/aactab.o
CC	libavcodec/aarch64/fft_init_aarch64.o
AS	libavcodec/aarch64/fft_neon.o
CC	libavcodec/aarch64/h264chroma_init_aarch64.o
AS	libavcodec/aarch64/h264cmc_neon.o
CC	libavcodec/aarch64/h264dsp_init_aarch64.o
AS	libavcodec/aarch64/h264dsp_neon.o
AS	libavcodec/aarch64/h264idct_neon.o
CC	libavcodec/aarch64/h264pred_init.o
AS	libavcodec/aarch64/h264pred_neon.o
CC	libavcodec/aarch64/h264qpel_init_aarch64.o
AS	libavcodec/aarch64/h264qpel_neon.o
CC	libavcodec/aarch64/hpeldsp_init_aarch64.o
AS	libavcodec/aarch64/hpeldsp_neon.o
CC	libavcodec/aarch64/imdct15_init.o
AS	libavcodec/aarch64/imdct15_neon.o
AS	libavcodec/aarch64/mdct_neon.o
AS	libavcodec/aarch64/mpegaudiodsp_neon.o
CC	libavcodec/aarch64/mpegaudiodsp_init.o
AS	libavcodec/aarch64/videodsp.o
CC	libavcodec/aarch64/videodsp_init.o
CC	libavcodec/ac3tab.o
CC	libavcodec/allcodecs.o
CC	libavcodec/audioconvert.o
CC	libavcodec/avdct.o
CC	libavcodec/avpacket.o
CC	libavcodec/avfft.o
CC	libavcodec/avpicture.o
CC	libavcodec/bitstream.o
CC	libavcodec/bitstream_filter.o
CC	libavcodec/blockdsp.o
CC	libavcodec/cabac.o
CC	libavcodec/chomp_bsf.o
CC	libavcodec/codec_desc.o
CC	libavcodec/dct.o
CC	libavcodec/dct32_fixed.o
CC	libavcodec/dct32_float.o
CC	libavcodec/dump_extradata_bsf.o
CC	libavcodec/dv_profile.o
CC	libavcodec/elbg.o
CC	libavcodec/error_resilience.o
CC	libavcodec/faandct.o
CC	libavcodec/faanidct.o
CC	libavcodec/fdctdsp.o
CC	libavcodec/fft_fixed.o
CC	libavcodec/fft_fixed_32.o
CC	libavcodec/fft_float.o
CC	libavcodec/fft_init_table.o
CC	libavcodec/flvdec.o
CC	libavcodec/golomb.o
CC	libavcodec/h263.o
CC	libavcodec/h263_parser.o
CC	libavcodec/h263data.o
CC	libavcodec/h263dsp.o
CC	libavcodec/h263dec.o
CC	libavcodec/h264.o
CC	libavcodec/h264_cabac.o
CC	libavcodec/h264_cavlc.o
CC	libavcodec/h264_direct.o
CC	libavcodec/h264_loopfilter.o
CC	libavcodec/h264_mb.o
CC	libavcodec/h264_mp4toannexb_bsf.o
CC	libavcodec/h264_parser.o
CC	libavcodec/h264_picture.o
CC	libavcodec/h264_ps.o
CC	libavcodec/h264_refs.o
CC	libavcodec/h264_sei.o
CC	libavcodec/h264_slice.o
CC	libavcodec/h264chroma.o
CC	libavcodec/h264dsp.o
CC	libavcodec/h264idct.o
CC	libavcodec/h264pred.o
CC	libavcodec/h264qpel.o
CC	libavcodec/hevc_mp4toannexb_bsf.o
libavcodec/hevc_mp4toannexb_bsf.c: In function 'hevc_mp4toannexb_filter':
libavcodec/hevc_mp4toannexb_bsf.c:137:27: warning: assignment discards 'const' qualifier from pointer target type
             *poutbuf      = buf;
                           ^
CC	libavcodec/hpeldsp.o
CC	libavcodec/huffman.o
CC	libavcodec/idctdsp.o
CC	libavcodec/imdct15.o
CC	libavcodec/imgconvert.o
CC	libavcodec/imx_dump_header_bsf.o
CC	libavcodec/intelh263dec.o
CC	libavcodec/ituh263dec.o
CC	libavcodec/jfdctfst.o
CC	libavcodec/jfdctint.o
CC	libavcodec/jrevdct.o
CC	libavcodec/kbdwin.o
CC	libavcodec/latm_parser.o
CC	libavcodec/mathtables.o
CC	libavcodec/mdct_fixed.o
CC	libavcodec/mdct_fixed_32.o
CC	libavcodec/mdct_float.o
CC	libavcodec/me_cmp.o
CC	libavcodec/mp3_header_decompress_bsf.o
CC	libavcodec/mpeg4_unpack_bframes_bsf.o
CC	libavcodec/mpeg4audio.o
CC	libavcodec/mpeg4video.o
CC	libavcodec/mpeg4videodec.o
CC	libavcodec/mpeg_er.o
CC	libavcodec/mpegaudio.o
CC	libavcodec/mpegaudio_parser.o
CC	libavcodec/mpegaudiodata.o
CC	libavcodec/mpegaudiodec_fixed.o
CC	libavcodec/mpegaudiodec_float.o
CC	libavcodec/mpegaudiodecheader.o
CC	libavcodec/mpegaudiodsp.o
CC	libavcodec/mpegaudiodsp_data.o
CC	libavcodec/mpegaudiodsp_fixed.o
CC	libavcodec/mpegaudiodsp_float.o
CC	libavcodec/mpegpicture.o
CC	libavcodec/mpegutils.o
CC	libavcodec/mpegvideo.o
CC	libavcodec/mpegvideo_motion.o
CC	libavcodec/mpegvideodata.o
CC	libavcodec/mpegvideodsp.o
CC	libavcodec/neon/mpegvideo.o
CC	libavcodec/noise_bsf.o
CC	libavcodec/options.o
libavcodec/options.c: In function 'avcodec_copy_context':
libavcodec/options.c:202:5: warning: passing argument 2 of 'av_opt_copy' discards 'const' qualifier from pointer target type
     av_opt_copy(dest, src);
     ^
In file included from libavcodec/options.c:32:0:
./libavutil/opt.h:838:5: note: expected 'void *' but argument is of type 'const struct AVCodecContext *'
 int av_opt_copy(void *dest, FF_CONST_AVUTIL55 void *src);
     ^
CC	libavcodec/parser.o
CC	libavcodec/pixblockdsp.o
CC	libavcodec/pthread.o
CC	libavcodec/pthread_frame.o
CC	libavcodec/pthread_slice.o
CC	libavcodec/qpeldsp.o
CC	libavcodec/qsv_api.o
CC	libavcodec/raw.o
CC	libavcodec/rdft.o
CC	libavcodec/remove_extradata_bsf.o
CC	libavcodec/resample.o
CC	libavcodec/resample2.o
CC	libavcodec/rl.o
CC	libavcodec/sbrdsp.o
CC	libavcodec/simple_idct.o
CC	libavcodec/sinewin.o
CC	libavcodec/sinewin_fixed.o
CC	libavcodec/startcode.o
CC	libavcodec/utils.o
CC	libavcodec/videodsp.o
CC	libavcodec/vorbis_parser.o
CC	libavcodec/vp3dsp.o
CC	libavcodec/vp56.o
CC	libavcodec/vp56data.o
CC	libavcodec/vp56dsp.o
CC	libavcodec/vp56rac.o
CC	libavcodec/vp6.o
CC	libavcodec/vp6dsp.o
CC	libavcodec/xiph.o
CC	libswresample/aarch64/audio_convert_init.o
AS	libswresample/aarch64/audio_convert_neon.o
CC	libswresample/audioconvert.o
CC	libswresample/dither.o
CC	libswresample/options.o
CC	libswresample/rematrix.o
CC	libswresample/resample.o
CC	libswresample/resample_dsp.o
CC	libswresample/swresample.o
CC	libswresample/swresample_frame.o
CC	libswscale/alphablend.o
CC	libswscale/gamma.o
CC	libswscale/hscale.o
CC	libswscale/hscale_fast_bilinear.o
CC	libswscale/input.o
CC	libswscale/options.o
CC	libswscale/output.o
libswscale/output.c:1172:21: warning: 'yuv2rgba64be_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, rgba64be, AV_PIX_FMT_RGBA64BE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1172:21: warning: 'yuv2rgba64be_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, rgba64be, AV_PIX_FMT_RGBA64BE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1172:21: warning: 'yuv2rgba64be_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, rgba64be, AV_PIX_FMT_RGBA64BE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1173:21: warning: 'yuv2rgba64le_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, rgba64le, AV_PIX_FMT_RGBA64LE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1173:21: warning: 'yuv2rgba64le_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, rgba64le, AV_PIX_FMT_RGBA64LE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1173:21: warning: 'yuv2rgba64le_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, rgba64le, AV_PIX_FMT_RGBA64LE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1176:21: warning: 'yuv2bgra64be_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, bgra64be, AV_PIX_FMT_BGRA64BE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1176:21: warning: 'yuv2bgra64be_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, bgra64be, AV_PIX_FMT_BGRA64BE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1176:21: warning: 'yuv2bgra64be_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, bgra64be, AV_PIX_FMT_BGRA64BE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1177:21: warning: 'yuv2bgra64le_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, bgra64le, AV_PIX_FMT_BGRA64LE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1177:21: warning: 'yuv2bgra64le_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, bgra64le, AV_PIX_FMT_BGRA64LE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1177:21: warning: 'yuv2bgra64le_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64, bgra64le, AV_PIX_FMT_BGRA64LE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1185:21: warning: 'yuv2rgba64be_full_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, rgba64be_full, AV_PIX_FMT_RGBA64BE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1185:21: warning: 'yuv2rgba64be_full_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, rgba64be_full, AV_PIX_FMT_RGBA64BE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1185:21: warning: 'yuv2rgba64be_full_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, rgba64be_full, AV_PIX_FMT_RGBA64BE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1186:21: warning: 'yuv2rgba64le_full_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, rgba64le_full, AV_PIX_FMT_RGBA64LE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1186:21: warning: 'yuv2rgba64le_full_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, rgba64le_full, AV_PIX_FMT_RGBA64LE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1186:21: warning: 'yuv2rgba64le_full_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, rgba64le_full, AV_PIX_FMT_RGBA64LE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1189:21: warning: 'yuv2bgra64be_full_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, bgra64be_full, AV_PIX_FMT_BGRA64BE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1189:21: warning: 'yuv2bgra64be_full_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, bgra64be_full, AV_PIX_FMT_BGRA64BE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1189:21: warning: 'yuv2bgra64be_full_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, bgra64be_full, AV_PIX_FMT_BGRA64BE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
libswscale/output.c:1190:21: warning: 'yuv2bgra64le_full_X_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, bgra64le_full, AV_PIX_FMT_BGRA64LE, 1, 1)
                     ^
libswscale/output.c:1123:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _X_c(SwsContext *c, const int16_t *lumFilter, \
             ^
libswscale/output.c:1190:21: warning: 'yuv2bgra64le_full_2_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, bgra64le_full, AV_PIX_FMT_BGRA64LE, 1, 1)
                     ^
libswscale/output.c:1140:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _2_c(SwsContext *c, const int16_t *_buf[2], \
             ^
libswscale/output.c:1190:21: warning: 'yuv2bgra64le_full_1_c' defined but not used [-Wunused-function]
 YUV2PACKED16WRAPPER(yuv2, rgba64_full, bgra64le_full, AV_PIX_FMT_BGRA64LE, 1, 1)
                     ^
libswscale/output.c:1154:13: note: in definition of macro 'YUV2PACKED16WRAPPER'
 static void name ## ext ## _1_c(SwsContext *c, const int16_t *_buf0, \
             ^
CC	libswscale/rgb2rgb.o
CC	libswscale/slice.o
CC	libswscale/swscale.o
libswscale/swscale.c: In function 'swscale':
libswscale/swscale.c:382:9: warning: unused variable 'perform_gamma' [-Wunused-variable]
     int perform_gamma = c->is_internal_gamma;
         ^
libswscale/swscale.c: At top level:
libswscale/swscale.c:55:13: warning: 'gamma_convert' defined but not used [-Wunused-function]
 static void gamma_convert(uint8_t * src[], int width, uint16_t *gamma)
             ^
CC	libswscale/swscale_unscaled.o
CC	libswscale/utils.o
CC	libswscale/vscale.o
CC	libswscale/yuv2rgb.o
CC	libavutil/../compat/strtod.o
libavutil/../compat/strtod.c: In function 'avpriv_strtod':
libavutil/../compat/strtod.c:55:13: warning: assignment discards 'const' qualifier from pointer target type
         end = nptr + 8;
             ^
libavutil/../compat/strtod.c:58:13: warning: assignment discards 'const' qualifier from pointer target type
         end = nptr + 3;
             ^
libavutil/../compat/strtod.c:61:13: warning: assignment discards 'const' qualifier from pointer target type
         end = nptr + 9;
             ^
libavutil/../compat/strtod.c:64:13: warning: assignment discards 'const' qualifier from pointer target type
         end = nptr + 4;
             ^
libavutil/../compat/strtod.c:67:13: warning: assignment discards 'const' qualifier from pointer target type
         end = nptr + 9;
             ^
libavutil/../compat/strtod.c:70:13: warning: assignment discards 'const' qualifier from pointer target type
         end = nptr + 4;
             ^
libavutil/../compat/strtod.c:73:15: warning: passing argument 1 of 'check_nan_suffix' discards 'const' qualifier from pointer target type
         end = check_nan_suffix(nptr + 3);
               ^
libavutil/../compat/strtod.c:28:14: note: expected 'char *' but argument is of type 'const char *'
 static char *check_nan_suffix(char *s)
              ^
libavutil/../compat/strtod.c:77:15: warning: passing argument 1 of 'check_nan_suffix' discards 'const' qualifier from pointer target type
         end = check_nan_suffix(nptr + 4);
               ^
libavutil/../compat/strtod.c:28:14: note: expected 'char *' but argument is of type 'const char *'
 static char *check_nan_suffix(char *s)
              ^
CC	libavutil/aarch64/cpu.o
CC	libavutil/aarch64/float_dsp_init.o
AS	libavutil/aarch64/float_dsp_neon.o
CC	libavutil/adler32.o
CC	libavutil/aes.o
CC	libavutil/audio_fifo.o
CC	libavutil/avstring.o
CC	libavutil/base64.o
CC	libavutil/blowfish.o
CC	libavutil/bprint.o
CC	libavutil/buffer.o
CC	libavutil/camellia.o
CC	libavutil/cast5.o
CC	libavutil/channel_layout.o
CC	libavutil/color_utils.o
CC	libavutil/cpu.o
CC	libavutil/crc.o
CC	libavutil/des.o
CC	libavutil/dict.o
CC	libavutil/display.o
CC	libavutil/downmix_info.o
CC	libavutil/error.o
CC	libavutil/eval.o
CC	libavutil/fifo.o
CC	libavutil/file.o
CC	libavutil/file_open.o
CC	libavutil/fixed_dsp.o
CC	libavutil/float_dsp.o
CC	libavutil/frame.o
libavutil/frame.c: In function 'av_frame_set_qp_table':
libavutil/frame.c:55:5: warning: 'qscale_table' is deprecated (declared at libavutil/frame.h:293) [-Wdeprecated-declarations]
     f->qscale_table = buf->data;
     ^
libavutil/frame.c:56:5: warning: 'qstride' is deprecated (declared at libavutil/frame.h:298) [-Wdeprecated-declarations]
     f->qstride      = stride;
     ^
libavutil/frame.c:57:5: warning: 'qscale_type' is deprecated (declared at libavutil/frame.h:301) [-Wdeprecated-declarations]
     f->qscale_type  = qp_type;
     ^
libavutil/frame.c: In function 'av_frame_get_qp_table':
libavutil/frame.c:64:5: warning: 'qstride' is deprecated (declared at libavutil/frame.h:298) [-Wdeprecated-declarations]
     *stride = f->qstride;
     ^
libavutil/frame.c:65:5: warning: 'qscale_type' is deprecated (declared at libavutil/frame.h:301) [-Wdeprecated-declarations]
     *type   = f->qscale_type;
     ^
libavutil/frame.c: In function 'frame_copy_props':
libavutil/frame.c:350:5: warning: 'qscale_table' is deprecated (declared at libavutil/frame.h:293) [-Wdeprecated-declarations]
     dst->qscale_table = NULL;
     ^
libavutil/frame.c:351:5: warning: 'qstride' is deprecated (declared at libavutil/frame.h:298) [-Wdeprecated-declarations]
     dst->qstride      = 0;
     ^
libavutil/frame.c:352:5: warning: 'qscale_type' is deprecated (declared at libavutil/frame.h:301) [-Wdeprecated-declarations]
     dst->qscale_type  = 0;
     ^
libavutil/frame.c:356:13: warning: 'qscale_table' is deprecated (declared at libavutil/frame.h:293) [-Wdeprecated-declarations]
             dst->qscale_table = dst->qp_table_buf->data;
             ^
libavutil/frame.c:357:13: warning: 'qstride' is deprecated (declared at libavutil/frame.h:298) [-Wdeprecated-declarations]
             dst->qstride      = src->qstride;
             ^
libavutil/frame.c:357:13: warning: 'qstride' is deprecated (declared at libavutil/frame.h:298) [-Wdeprecated-declarations]
libavutil/frame.c:358:13: warning: 'qscale_type' is deprecated (declared at libavutil/frame.h:301) [-Wdeprecated-declarations]
             dst->qscale_type  = src->qscale_type;
             ^
libavutil/frame.c:358:13: warning: 'qscale_type' is deprecated (declared at libavutil/frame.h:301) [-Wdeprecated-declarations]
CC	libavutil/hash.o
CC	libavutil/hmac.o
CC	libavutil/imgutils.o
CC	libavutil/intmath.o
CC	libavutil/lfg.o
CC	libavutil/lls.o
CC	libavutil/log2_tab.o
CC	libavutil/log.o
CC	libavutil/mathematics.o
CC	libavutil/md5.o
CC	libavutil/mem.o
CC	libavutil/murmur3.o
CC	libavutil/opt.o
CC	libavutil/parseutils.o
CC	libavutil/pixdesc.o
CC	libavutil/pixelutils.o
CC	libavutil/random_seed.o
CC	libavutil/rational.o
CC	libavutil/rc4.o
CC	libavutil/reverse.o
CC	libavutil/ripemd.o
CC	libavutil/samplefmt.o
CC	libavutil/sha.o
CC	libavutil/sha512.o
CC	libavutil/stereo3d.o
CC	libavutil/tea.o
CC	libavutil/threadmessage.o
CC	libavutil/time.o
CC	libavutil/timecode.o
CC	libavutil/tree.o
CC	libavutil/twofish.o
CC	libavutil/utils.o
CC	libavutil/xga_font_data.o
CC	libavutil/xtea.o
AR	libavfilter/libavfilter.a
AR	libavformat/libavformat.a
AR	libavcodec/libavcodec.a
AR	libswresample/libswresample.a
AR	libswscale/libswscale.a
AR	libavutil/libavutil.a
INSTALL	libavfilter/libavfilter.a
INSTALL	libavformat/libavformat.a
INSTALL	libavcodec/libavcodec.a
INSTALL	libswresample/libswresample.a
INSTALL	libswscale/libswscale.a
INSTALL	libavutil/libavutil.a
INSTALL	libavfilter/asrc_abuffer.h
INSTALL	libavfilter/avcodec.h
INSTALL	libavfilter/avfilter.h
INSTALL	libavfilter/avfiltergraph.h
INSTALL	libavfilter/buffersink.h
INSTALL	libavfilter/buffersrc.h
INSTALL	libavfilter/version.h
INSTALL	libavfilter/libavfilter.pc
INSTALL	libavformat/avformat.h
INSTALL	libavformat/avio.h
INSTALL	libavformat/version.h
INSTALL	libavformat/avc.h
INSTALL	libavformat/url.h
INSTALL	libavformat/internal.h
INSTALL	libavformat/libavformat.pc
INSTALL	libavcodec/avcodec.h
INSTALL	libavcodec/avfft.h
INSTALL	libavcodec/dv_profile.h
INSTALL	libavcodec/d3d11va.h
INSTALL	libavcodec/dxva2.h
INSTALL	libavcodec/old_codec_ids.h
INSTALL	libavcodec/qsv.h
INSTALL	libavcodec/vaapi.h
INSTALL	libavcodec/vda.h
INSTALL	libavcodec/vdpau.h
INSTALL	libavcodec/version.h
INSTALL	libavcodec/videotoolbox.h
INSTALL	libavcodec/vorbis_parser.h
INSTALL	libavcodec/xvmc.h
INSTALL	libavcodec/libavcodec.pc
INSTALL	libswresample/swresample.h
INSTALL	libswresample/version.h
INSTALL	libswresample/libswresample.pc
INSTALL	libswscale/swscale.h
INSTALL	libswscale/version.h
INSTALL	libswscale/libswscale.pc
INSTALL	libavutil/adler32.h
INSTALL	libavutil/aes.h
INSTALL	libavutil/attributes.h
INSTALL	libavutil/audio_fifo.h
INSTALL	libavutil/audioconvert.h
INSTALL	libavutil/avassert.h
INSTALL	libavutil/avstring.h
INSTALL	libavutil/avutil.h
INSTALL	libavutil/base64.h
INSTALL	libavutil/blowfish.h
INSTALL	libavutil/bprint.h
INSTALL	libavutil/bswap.h
INSTALL	libavutil/buffer.h
INSTALL	libavutil/cast5.h
INSTALL	libavutil/camellia.h
INSTALL	libavutil/channel_layout.h
INSTALL	libavutil/common.h
INSTALL	libavutil/cpu.h
INSTALL	libavutil/crc.h
INSTALL	libavutil/display.h
INSTALL	libavutil/downmix_info.h
INSTALL	libavutil/error.h
INSTALL	libavutil/eval.h
INSTALL	libavutil/fifo.h
INSTALL	libavutil/file.h
INSTALL	libavutil/frame.h
INSTALL	libavutil/hash.h
INSTALL	libavutil/hmac.h
INSTALL	libavutil/imgutils.h
INSTALL	libavutil/intfloat.h
INSTALL	libavutil/intreadwrite.h
INSTALL	libavutil/lfg.h
INSTALL	libavutil/log.h
INSTALL	libavutil/macros.h
INSTALL	libavutil/mathematics.h
INSTALL	libavutil/md5.h
INSTALL	libavutil/mem.h
INSTALL	libavutil/motion_vector.h
INSTALL	libavutil/murmur3.h
INSTALL	libavutil/dict.h
INSTALL	libavutil/old_pix_fmts.h
INSTALL	libavutil/opt.h
INSTALL	libavutil/parseutils.h
INSTALL	libavutil/pixdesc.h
INSTALL	libavutil/pixelutils.h
INSTALL	libavutil/pixfmt.h
INSTALL	libavutil/random_seed.h
INSTALL	libavutil/replaygain.h
INSTALL	libavutil/rational.h
INSTALL	libavutil/ripemd.h
INSTALL	libavutil/samplefmt.h
INSTALL	libavutil/sha.h
INSTALL	libavutil/sha512.h
INSTALL	libavutil/stereo3d.h
INSTALL	libavutil/threadmessage.h
INSTALL	libavutil/time.h
INSTALL	libavutil/timecode.h
INSTALL	libavutil/timestamp.h
INSTALL	libavutil/twofish.h
INSTALL	libavutil/version.h
INSTALL	libavutil/xtea.h
INSTALL	libavutil/tea.h
INSTALL	libavutil/thread.h
INSTALL	libavutil/avconfig.h
INSTALL	libavutil/ffversion.h
INSTALL	libavutil/libavutil.pc

--------------------
[*] link ffmpeg
--------------------


--------------------
[*] create files for shared ffmpeg
--------------------

--------------------
[*] Finished
--------------------
# to continue to build ijkplayer, run script below,
sh compile-ijk.sh 
[root@c7 contrib]# cd ..
[root@c7 android]# ./compile-ijk.sh all
profiler build: NO
[armeabi] Prebuilt       : libijkffmpeg.so <= /home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/contrib/build/ffmpeg-armv5/output/
[armeabi] Compile thumb  : ijkplayer <= ff_cmdutils.c
[armeabi] Compile thumb  : ijkplayer <= ff_ffplay.c
[armeabi] Compile thumb  : ijkplayer <= ff_ffpipeline.c
[armeabi] Compile thumb  : ijkplayer <= ff_ffpipenode.c
[armeabi] Compile thumb  : ijkplayer <= ijkmeta.c
[armeabi] Compile thumb  : ijkplayer <= ijkplayer.c
[armeabi] Compile thumb  : ijkplayer <= ffpipeline_ffplay.c
[armeabi] Compile thumb  : ijkplayer <= ffpipenode_ffplay_vdec.c
[armeabi] Compile thumb  : ijkplayer <= ffmpeg_api_jni.c
[armeabi] Compile thumb  : ijkplayer <= ijkplayer_android.c
[armeabi] Compile thumb  : ijkplayer <= ijkplayer_jni.c
[armeabi] Compile thumb  : ijkplayer <= ffpipeline_android.c
[armeabi] Compile thumb  : ijkplayer <= ffpipenode_android_mediacodec_vdec.c
[armeabi] Compile thumb  : ijkplayer <= allformats.c
[armeabi] Compile thumb  : ijkplayer <= async.c
[armeabi] Compile thumb  : ijkplayer <= ijkinject.c
[armeabi] Compile thumb  : ijkplayer <= ijklivehook.c
[armeabi] Compile thumb  : ijkplayer <= ijklongurl.c
[armeabi] Compile thumb  : ijkplayer <= ijkmediadatasource.c
[armeabi] Compile thumb  : ijkplayer <= ijksegment.c
[armeabi] Compile thumb  : ijkplayer <= ijkurlhook.c
[armeabi] Compile thumb  : ijkplayer <= utils.c
[armeabi] Compile thumb  : ijksdl <= ijksdl_aout.c
[armeabi] Compile thumb  : ijksdl <= ijksdl_audio.c
[armeabi] Compile thumb  : ijksdl <= ijksdl_error.c
[armeabi] Compile thumb  : ijksdl <= ijksdl_mutex.c
[armeabi] Compile thumb  : ijksdl <= ijksdl_stdinc.c
[armeabi] Compile thumb  : ijksdl <= ijksdl_thread.c
[armeabi] Compile thumb  : ijksdl <= ijksdl_timer.c
[armeabi] Compile thumb  : ijksdl <= ijksdl_vout.c
[armeabi] Compile thumb  : ijksdl <= ijksdl_vout_dummy.c
[armeabi] Compile thumb  : ijksdl <= ijksdl_vout_overlay_ffmpeg.c
[armeabi] Compile thumb  : ijksdl <= image_convert.c
[armeabi] Compile thumb  : ijksdl <= android_audiotrack.c
[armeabi] Compile thumb  : ijksdl <= android_nativewindow.c
[armeabi] Compile thumb  : ijksdl <= ijksdl_android_jni.c
[armeabi] Compile thumb  : ijksdl <= ijksdl_aout_android_audiotrack.c
[armeabi] Compile thumb  : ijksdl <= ijksdl_aout_android_opensles.c
[armeabi] Compile thumb  : ijksdl <= ijksdl_codec_android_mediacodec_java.c
[armeabi] Compile thumb  : ijksdl <= ijksdl_codec_android_mediacodec.c
[armeabi] Compile thumb  : ijksdl <= ijksdl_codec_android_mediadef.c
[armeabi] Compile thumb  : ijksdl <= ijksdl_codec_android_mediaformat_java.c
[armeabi] Compile thumb  : ijksdl <= ijksdl_codec_android_mediaformat.c
[armeabi] Compile thumb  : ijksdl <= ijksdl_vout_android_nativewindow.c
[armeabi] Compile thumb  : ijksdl <= ijksdl_vout_android_surface.c
[armeabi] Compile thumb  : ijksdl <= ijksdl_vout_overlay_android_mediacodec.c
[armeabi] Compile thumb  : ijksdl <= jjk_allclasses.c
[armeabi] Compile thumb  : ijksdl <= jjk_internal.c
[armeabi] Compile thumb  : ijksdl <= AudioTrack.c
[armeabi] Compile thumb  : ijksdl <= MediaCodec.c
[armeabi] Compile thumb  : ijksdl <= MediaFormat.c
[armeabi] Compile thumb  : ijksdl <= Build.c
[armeabi] Compile thumb  : ijksdl <= Bundle.c
[armeabi] Compile thumb  : ijksdl <= Buffer.c
[armeabi] Compile thumb  : ijksdl <= ByteBuffer.c
[armeabi] Compile thumb  : ijksdl <= ByteBuffer.util.c
[armeabi] Compile thumb  : ijksdl <= ArrayList.c
[armeabi] Compile thumb  : ijksdl <= IjkMediaPlayer.c
[armeabi] Compile thumb  : ijksdl <= IMediaDataSource.c
[armeabi] Install        : libijkffmpeg.so => libs/armeabi/libijkffmpeg.so
[armeabi] SharedLibrary  : libijksdl.so
[armeabi] SharedLibrary  : libijkplayer.so
[armeabi] Install        : libijksdl.so => libs/armeabi/libijksdl.so
[armeabi] Install        : libijkplayer.so => libs/armeabi/libijkplayer.so
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android
profiler build: NO
[armeabi-v7a] Prebuilt       : libijkffmpeg.so <= /home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/contrib/build/ffmpeg-armv7a/output/
[armeabi-v7a] Compile thumb  : ijkplayer <= ff_cmdutils.c
[armeabi-v7a] Compile thumb  : ijkplayer <= ff_ffplay.c
[armeabi-v7a] Compile thumb  : ijkplayer <= ff_ffpipeline.c
[armeabi-v7a] Compile thumb  : ijkplayer <= ff_ffpipenode.c
[armeabi-v7a] Compile thumb  : ijkplayer <= ijkmeta.c
[armeabi-v7a] Compile thumb  : ijkplayer <= ijkplayer.c
[armeabi-v7a] Compile thumb  : ijkplayer <= ffpipeline_ffplay.c
[armeabi-v7a] Compile thumb  : ijkplayer <= ffpipenode_ffplay_vdec.c
[armeabi-v7a] Compile thumb  : ijkplayer <= ffmpeg_api_jni.c
[armeabi-v7a] Compile thumb  : ijkplayer <= ijkplayer_android.c
[armeabi-v7a] Compile thumb  : ijkplayer <= ijkplayer_jni.c
[armeabi-v7a] Compile thumb  : ijkplayer <= ffpipeline_android.c
[armeabi-v7a] Compile thumb  : ijkplayer <= ffpipenode_android_mediacodec_vdec.c
[armeabi-v7a] Compile thumb  : ijkplayer <= allformats.c
[armeabi-v7a] Compile thumb  : ijkplayer <= async.c
[armeabi-v7a] Compile thumb  : ijkplayer <= ijkinject.c
[armeabi-v7a] Compile thumb  : ijkplayer <= ijklivehook.c
[armeabi-v7a] Compile thumb  : ijkplayer <= ijklongurl.c
[armeabi-v7a] Compile thumb  : ijkplayer <= ijkmediadatasource.c
[armeabi-v7a] Compile thumb  : ijkplayer <= ijksegment.c
[armeabi-v7a] Compile thumb  : ijkplayer <= ijkurlhook.c
[armeabi-v7a] Compile thumb  : ijkplayer <= utils.c
[armeabi-v7a] Compile thumb  : ijksdl <= ijksdl_aout.c
[armeabi-v7a] Compile thumb  : ijksdl <= ijksdl_audio.c
[armeabi-v7a] Compile thumb  : ijksdl <= ijksdl_error.c
[armeabi-v7a] Compile thumb  : ijksdl <= ijksdl_mutex.c
[armeabi-v7a] Compile thumb  : ijksdl <= ijksdl_stdinc.c
[armeabi-v7a] Compile thumb  : ijksdl <= ijksdl_thread.c
[armeabi-v7a] Compile thumb  : ijksdl <= ijksdl_timer.c
[armeabi-v7a] Compile thumb  : ijksdl <= ijksdl_vout.c
[armeabi-v7a] Compile thumb  : ijksdl <= ijksdl_vout_dummy.c
[armeabi-v7a] Compile thumb  : ijksdl <= ijksdl_vout_overlay_ffmpeg.c
[armeabi-v7a] Compile thumb  : ijksdl <= image_convert.c
[armeabi-v7a] Compile thumb  : ijksdl <= android_audiotrack.c
[armeabi-v7a] Compile thumb  : ijksdl <= android_nativewindow.c
[armeabi-v7a] Compile thumb  : ijksdl <= ijksdl_android_jni.c
[armeabi-v7a] Compile thumb  : ijksdl <= ijksdl_aout_android_audiotrack.c
[armeabi-v7a] Compile thumb  : ijksdl <= ijksdl_aout_android_opensles.c
[armeabi-v7a] Compile thumb  : ijksdl <= ijksdl_codec_android_mediacodec_java.c
[armeabi-v7a] Compile thumb  : ijksdl <= ijksdl_codec_android_mediacodec.c
[armeabi-v7a] Compile thumb  : ijksdl <= ijksdl_codec_android_mediadef.c
[armeabi-v7a] Compile thumb  : ijksdl <= ijksdl_codec_android_mediaformat_java.c
[armeabi-v7a] Compile thumb  : ijksdl <= ijksdl_codec_android_mediaformat.c
[armeabi-v7a] Compile thumb  : ijksdl <= ijksdl_vout_android_nativewindow.c
[armeabi-v7a] Compile thumb  : ijksdl <= ijksdl_vout_android_surface.c
[armeabi-v7a] Compile thumb  : ijksdl <= ijksdl_vout_overlay_android_mediacodec.c
[armeabi-v7a] Compile thumb  : ijksdl <= jjk_allclasses.c
[armeabi-v7a] Compile thumb  : ijksdl <= jjk_internal.c
[armeabi-v7a] Compile thumb  : ijksdl <= AudioTrack.c
[armeabi-v7a] Compile thumb  : ijksdl <= MediaCodec.c
[armeabi-v7a] Compile thumb  : ijksdl <= MediaFormat.c
[armeabi-v7a] Compile thumb  : ijksdl <= Build.c
[armeabi-v7a] Compile thumb  : ijksdl <= Bundle.c
[armeabi-v7a] Compile thumb  : ijksdl <= Buffer.c
[armeabi-v7a] Compile thumb  : ijksdl <= ByteBuffer.c
[armeabi-v7a] Compile thumb  : ijksdl <= ByteBuffer.util.c
[armeabi-v7a] Compile thumb  : ijksdl <= ArrayList.c
[armeabi-v7a] Compile thumb  : ijksdl <= IjkMediaPlayer.c
[armeabi-v7a] Compile thumb  : ijksdl <= IMediaDataSource.c
[armeabi-v7a] Install        : libijkffmpeg.so => libs/armeabi-v7a/libijkffmpeg.so
[armeabi-v7a] SharedLibrary  : libijksdl.so
[armeabi-v7a] SharedLibrary  : libijkplayer.so
[armeabi-v7a] Install        : libijksdl.so => libs/armeabi-v7a/libijksdl.so
[armeabi-v7a] Install        : libijkplayer.so => libs/armeabi-v7a/libijkplayer.so
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android
profiler build: NO
[x86] Prebuilt       : libijkffmpeg.so <= /home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/contrib/build/ffmpeg-x86/output/
[x86] Compile        : ijkplayer <= ff_cmdutils.c
[x86] Compile        : ijkplayer <= ff_ffplay.c
[x86] Compile        : ijkplayer <= ff_ffpipeline.c
[x86] Compile        : ijkplayer <= ff_ffpipenode.c
[x86] Compile        : ijkplayer <= ijkmeta.c
[x86] Compile        : ijkplayer <= ijkplayer.c
[x86] Compile        : ijkplayer <= ffpipeline_ffplay.c
[x86] Compile        : ijkplayer <= ffpipenode_ffplay_vdec.c
[x86] Compile        : ijkplayer <= ffmpeg_api_jni.c
[x86] Compile        : ijkplayer <= ijkplayer_android.c
[x86] Compile        : ijkplayer <= ijkplayer_jni.c
[x86] Compile        : ijkplayer <= ffpipeline_android.c
[x86] Compile        : ijkplayer <= ffpipenode_android_mediacodec_vdec.c
[x86] Compile        : ijkplayer <= allformats.c
[x86] Compile        : ijkplayer <= async.c
[x86] Compile        : ijkplayer <= ijkinject.c
[x86] Compile        : ijkplayer <= ijklivehook.c
[x86] Compile        : ijkplayer <= ijklongurl.c
[x86] Compile        : ijkplayer <= ijkmediadatasource.c
[x86] Compile        : ijkplayer <= ijksegment.c
[x86] Compile        : ijkplayer <= ijkurlhook.c
[x86] Compile        : ijkplayer <= utils.c
[x86] Compile        : ijksdl <= ijksdl_aout.c
[x86] Compile        : ijksdl <= ijksdl_audio.c
[x86] Compile        : ijksdl <= ijksdl_error.c
[x86] Compile        : ijksdl <= ijksdl_mutex.c
[x86] Compile        : ijksdl <= ijksdl_stdinc.c
[x86] Compile        : ijksdl <= ijksdl_thread.c
[x86] Compile        : ijksdl <= ijksdl_timer.c
[x86] Compile        : ijksdl <= ijksdl_vout.c
[x86] Compile        : ijksdl <= ijksdl_vout_dummy.c
[x86] Compile        : ijksdl <= ijksdl_vout_overlay_ffmpeg.c
[x86] Compile        : ijksdl <= image_convert.c
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/ijkplayer/ijkplayer-x86/src/main/jni/ijkmedia/ijksdl/ffmpeg/ijksdl_vout_overlay_ffmpeg.c: In function 'func_fill_frame':
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/ijkplayer/ijkplayer-x86/src/main/jni/ijkmedia/ijksdl/ffmpeg/ijksdl_vout_overlay_ffmpeg.c:222:33: warning: array subscript is above array bounds [-Warray-bounds]
             swscale_dst_pic.data[i] = overlay->pixels[i];
                                 ^
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/ijkplayer/ijkplayer-x86/src/main/jni/ijkmedia/ijksdl/ffmpeg/ijksdl_vout_overlay_ffmpeg.c:223:37: warning: array subscript is above array bounds [-Warray-bounds]
             swscale_dst_pic.linesize[i] = overlay->pitches[i];
                                     ^
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/ijkplayer/ijkplayer-x86/src/main/jni/ijkmedia/ijksdl/ffmpeg/ijksdl_vout_overlay_ffmpeg.c:222:33: warning: array subscript is above array bounds [-Warray-bounds]
             swscale_dst_pic.data[i] = overlay->pixels[i];
                                 ^
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/ijkplayer/ijkplayer-x86/src/main/jni/ijkmedia/ijksdl/ffmpeg/ijksdl_vout_overlay_ffmpeg.c:223:37: warning: array subscript is above array bounds [-Warray-bounds]
             swscale_dst_pic.linesize[i] = overlay->pitches[i];
                                     ^
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/ijkplayer/ijkplayer-x86/src/main/jni/ijkmedia/ijksdl/ffmpeg/ijksdl_vout_overlay_ffmpeg.c:222:33: warning: array subscript is above array bounds [-Warray-bounds]
             swscale_dst_pic.data[i] = overlay->pixels[i];
                                 ^
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/ijkplayer/ijkplayer-x86/src/main/jni/ijkmedia/ijksdl/ffmpeg/ijksdl_vout_overlay_ffmpeg.c:223:37: warning: array subscript is above array bounds [-Warray-bounds]
             swscale_dst_pic.linesize[i] = overlay->pitches[i];
                                     ^
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/ijkplayer/ijkplayer-x86/src/main/jni/ijkmedia/ijksdl/ffmpeg/ijksdl_vout_overlay_ffmpeg.c:222:33: warning: array subscript is above array bounds [-Warray-bounds]
             swscale_dst_pic.data[i] = overlay->pixels[i];
                                 ^
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/ijkplayer/ijkplayer-x86/src/main/jni/ijkmedia/ijksdl/ffmpeg/ijksdl_vout_overlay_ffmpeg.c:223:37: warning: array subscript is above array bounds [-Warray-bounds]
             swscale_dst_pic.linesize[i] = overlay->pitches[i];
                                     ^
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/ijkplayer/ijkplayer-x86/src/main/jni/ijkmedia/ijksdl/ffmpeg/ijksdl_vout_overlay_ffmpeg.c:222:33: warning: array subscript is above array bounds [-Warray-bounds]
             swscale_dst_pic.data[i] = overlay->pixels[i];
                                 ^
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/ijkplayer/ijkplayer-x86/src/main/jni/ijkmedia/ijksdl/ffmpeg/ijksdl_vout_overlay_ffmpeg.c:223:37: warning: array subscript is above array bounds [-Warray-bounds]
             swscale_dst_pic.linesize[i] = overlay->pitches[i];
                                     ^
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/ijkplayer/ijkplayer-x86/src/main/jni/ijkmedia/ijksdl/ffmpeg/ijksdl_vout_overlay_ffmpeg.c:222:33: warning: array subscript is above array bounds [-Warray-bounds]
             swscale_dst_pic.data[i] = overlay->pixels[i];
                                 ^
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/ijkplayer/ijkplayer-x86/src/main/jni/ijkmedia/ijksdl/ffmpeg/ijksdl_vout_overlay_ffmpeg.c:223:37: warning: array subscript is above array bounds [-Warray-bounds]
             swscale_dst_pic.linesize[i] = overlay->pitches[i];
                                     ^
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/ijkplayer/ijkplayer-x86/src/main/jni/ijkmedia/ijksdl/ffmpeg/ijksdl_vout_overlay_ffmpeg.c:222:33: warning: array subscript is above array bounds [-Warray-bounds]
             swscale_dst_pic.data[i] = overlay->pixels[i];
                                 ^
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/ijkplayer/ijkplayer-x86/src/main/jni/ijkmedia/ijksdl/ffmpeg/ijksdl_vout_overlay_ffmpeg.c:223:37: warning: array subscript is above array bounds [-Warray-bounds]
             swscale_dst_pic.linesize[i] = overlay->pitches[i];
                                     ^
[x86] Compile        : ijksdl <= android_audiotrack.c
[x86] Compile        : ijksdl <= android_nativewindow.c
[x86] Compile        : ijksdl <= ijksdl_android_jni.c
[x86] Compile        : ijksdl <= ijksdl_aout_android_audiotrack.c
[x86] Compile        : ijksdl <= ijksdl_aout_android_opensles.c
[x86] Compile        : ijksdl <= ijksdl_codec_android_mediacodec_java.c
[x86] Compile        : ijksdl <= ijksdl_codec_android_mediacodec.c
[x86] Compile        : ijksdl <= ijksdl_codec_android_mediadef.c
[x86] Compile        : ijksdl <= ijksdl_codec_android_mediaformat_java.c
[x86] Compile        : ijksdl <= ijksdl_codec_android_mediaformat.c
[x86] Compile        : ijksdl <= ijksdl_vout_android_nativewindow.c
[x86] Compile        : ijksdl <= ijksdl_vout_android_surface.c
[x86] Compile        : ijksdl <= ijksdl_vout_overlay_android_mediacodec.c
[x86] Compile        : ijksdl <= jjk_allclasses.c
[x86] Compile        : ijksdl <= jjk_internal.c
[x86] Compile        : ijksdl <= AudioTrack.c
[x86] Compile        : ijksdl <= MediaCodec.c
[x86] Compile        : ijksdl <= MediaFormat.c
[x86] Compile        : ijksdl <= Build.c
[x86] Compile        : ijksdl <= Bundle.c
[x86] Compile        : ijksdl <= Buffer.c
[x86] Compile        : ijksdl <= ByteBuffer.c
[x86] Compile        : ijksdl <= ByteBuffer.util.c
[x86] Compile        : ijksdl <= ArrayList.c
[x86] Compile        : ijksdl <= IjkMediaPlayer.c
[x86] Compile        : ijksdl <= IMediaDataSource.c
[x86] Install        : libijkffmpeg.so => libs/x86/libijkffmpeg.so
[x86] SharedLibrary  : libijksdl.so
[x86] SharedLibrary  : libijkplayer.so
[x86] Install        : libijksdl.so => libs/x86/libijksdl.so
[x86] Install        : libijkplayer.so => libs/x86/libijkplayer.so
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android
profiler build: NO
[arm64-v8a] Prebuilt       : libijkffmpeg.so <= /home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/contrib/build/ffmpeg-arm64/output/
[arm64-v8a] Compile        : ijkplayer <= ff_cmdutils.c
[arm64-v8a] Compile        : ijkplayer <= ff_ffplay.c
[arm64-v8a] Compile        : ijkplayer <= ff_ffpipeline.c
[arm64-v8a] Compile        : ijkplayer <= ff_ffpipenode.c
[arm64-v8a] Compile        : ijkplayer <= ijkmeta.c
[arm64-v8a] Compile        : ijkplayer <= ijkplayer.c
[arm64-v8a] Compile        : ijkplayer <= ffpipeline_ffplay.c
[arm64-v8a] Compile        : ijkplayer <= ffpipenode_ffplay_vdec.c
[arm64-v8a] Compile        : ijkplayer <= ffmpeg_api_jni.c
[arm64-v8a] Compile        : ijkplayer <= ijkplayer_android.c
[arm64-v8a] Compile        : ijkplayer <= ijkplayer_jni.c
[arm64-v8a] Compile        : ijkplayer <= ffpipeline_android.c
[arm64-v8a] Compile        : ijkplayer <= ffpipenode_android_mediacodec_vdec.c
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/ijkplayer/ijkplayer-arm64/src/main/jni/ijkmedia/ijkplayer/android/pipeline/ffpipenode_android_mediacodec_vdec.c: In function 'ffpipenode_create_video_decoder_from_android_mediacodec':
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/ijkplayer/ijkplayer-arm64/src/main/jni/ijkmedia/ijkplayer/android/pipeline/ffpipenode_android_mediacodec_vdec.c:1137:26: warning: passing argument 5 of 'convert_hevc_nal_units' from incompatible pointer type
                 if (0 != convert_hevc_nal_units(opaque->avctx->extradata, opaque->avctx->extradata_size,
                          ^
In file included from /home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/ijkplayer/ijkplayer-arm64/src/main/jni/ijkmedia/ijkplayer/android/pipeline/ffpipenode_android_mediacodec_vdec.c:34:0:
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/ijkplayer/ijkplayer-arm64/src/main/jni/ijkmedia/ijkplayer/android/pipeline/hevc_nal.h:28:5: note: expected 'uint32_t *' but argument is of type 'size_t *'
 int convert_hevc_nal_units(const uint8_t *p_buf,uint32_t i_buf_size,
     ^
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/ijkplayer/ijkplayer-arm64/src/main/jni/ijkmedia/ijkplayer/android/pipeline/ffpipenode_android_mediacodec_vdec.c:1137:26: warning: passing argument 6 of 'convert_hevc_nal_units' from incompatible pointer type
                 if (0 != convert_hevc_nal_units(opaque->avctx->extradata, opaque->avctx->extradata_size,
                          ^
In file included from /home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/ijkplayer/ijkplayer-arm64/src/main/jni/ijkmedia/ijkplayer/android/pipeline/ffpipenode_android_mediacodec_vdec.c:34:0:
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android/ijkplayer/ijkplayer-arm64/src/main/jni/ijkmedia/ijkplayer/android/pipeline/hevc_nal.h:28:5: note: expected 'uint32_t *' but argument is of type 'size_t *'
 int convert_hevc_nal_units(const uint8_t *p_buf,uint32_t i_buf_size,
     ^
[arm64-v8a] Compile        : ijkplayer <= allformats.c
[arm64-v8a] Compile        : ijkplayer <= async.c
[arm64-v8a] Compile        : ijkplayer <= ijkinject.c
[arm64-v8a] Compile        : ijkplayer <= ijklivehook.c
[arm64-v8a] Compile        : ijkplayer <= ijklongurl.c
[arm64-v8a] Compile        : ijkplayer <= ijkmediadatasource.c
[arm64-v8a] Compile        : ijkplayer <= ijksegment.c
[arm64-v8a] Compile        : ijkplayer <= ijkurlhook.c
[arm64-v8a] Compile        : ijkplayer <= utils.c
[arm64-v8a] Compile        : ijksdl <= ijksdl_aout.c
[arm64-v8a] Compile        : ijksdl <= ijksdl_audio.c
[arm64-v8a] Compile        : ijksdl <= ijksdl_error.c
[arm64-v8a] Compile        : ijksdl <= ijksdl_mutex.c
[arm64-v8a] Compile        : ijksdl <= ijksdl_stdinc.c
[arm64-v8a] Compile        : ijksdl <= ijksdl_thread.c
[arm64-v8a] Compile        : ijksdl <= ijksdl_timer.c
[arm64-v8a] Compile        : ijksdl <= ijksdl_vout.c
[arm64-v8a] Compile        : ijksdl <= ijksdl_vout_dummy.c
[arm64-v8a] Compile        : ijksdl <= ijksdl_vout_overlay_ffmpeg.c
[arm64-v8a] Compile        : ijksdl <= image_convert.c
[arm64-v8a] Compile        : ijksdl <= android_audiotrack.c
[arm64-v8a] Compile        : ijksdl <= android_nativewindow.c
[arm64-v8a] Compile        : ijksdl <= ijksdl_android_jni.c
[arm64-v8a] Compile        : ijksdl <= ijksdl_aout_android_audiotrack.c
[arm64-v8a] Compile        : ijksdl <= ijksdl_aout_android_opensles.c
[arm64-v8a] Compile        : ijksdl <= ijksdl_codec_android_mediacodec_java.c
[arm64-v8a] Compile        : ijksdl <= ijksdl_codec_android_mediacodec.c
[arm64-v8a] Compile        : ijksdl <= ijksdl_codec_android_mediadef.c
[arm64-v8a] Compile        : ijksdl <= ijksdl_codec_android_mediaformat_java.c
[arm64-v8a] Compile        : ijksdl <= ijksdl_codec_android_mediaformat.c
[arm64-v8a] Compile        : ijksdl <= ijksdl_vout_android_nativewindow.c
[arm64-v8a] Compile        : ijksdl <= ijksdl_vout_android_surface.c
[arm64-v8a] Compile        : ijksdl <= ijksdl_vout_overlay_android_mediacodec.c
[arm64-v8a] Compile        : ijksdl <= jjk_allclasses.c
[arm64-v8a] Compile        : ijksdl <= jjk_internal.c
[arm64-v8a] Compile        : ijksdl <= AudioTrack.c
[arm64-v8a] Compile        : ijksdl <= MediaCodec.c
[arm64-v8a] Compile        : ijksdl <= MediaFormat.c
[arm64-v8a] Compile        : ijksdl <= Build.c
[arm64-v8a] Compile        : ijksdl <= Bundle.c
[arm64-v8a] Compile        : ijksdl <= Buffer.c
[arm64-v8a] Compile        : ijksdl <= ByteBuffer.c
[arm64-v8a] Compile        : ijksdl <= ByteBuffer.util.c
[arm64-v8a] Compile        : ijksdl <= ArrayList.c
[arm64-v8a] Compile        : ijksdl <= IjkMediaPlayer.c
[arm64-v8a] Compile        : ijksdl <= IMediaDataSource.c
[arm64-v8a] Install        : libijkffmpeg.so => libs/arm64-v8a/libijkffmpeg.so
[arm64-v8a] SharedLibrary  : libijksdl.so
[arm64-v8a] SharedLibrary  : libijkplayer.so
[arm64-v8a] Install        : libijksdl.so => libs/arm64-v8a/libijksdl.so
[arm64-v8a] Install        : libijkplayer.so => libs/arm64-v8a/libijkplayer.so
/home/zhangbin/nuf/sc/sl/meSCOpenSL/ref/ijkplayer-android/android
[root@c7 android]# 

```