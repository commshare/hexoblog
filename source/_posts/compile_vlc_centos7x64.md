title: Centos7x64_VLC_Compile
---

> 为了方便调试android上的VLC，调试linux的


# 1 [参考官方wiki](https://wiki.videolan.org/UnixCompile/)
```
sudo yum install git libtool pkgconfig
git clone git://git.videolan.org/vlc.git
cd vlc

```

# 2 生成Makefile
进入到vlc目录：
```
./bootstrap

```
这个过程会根据.am来生成.in

# 3 第三方库 contrib目录
>  [官方](https://download.videolan.org/contrib/)
>  其他的超时的话也要自己下载，放在contrib/tarballs下

```
cd contrib
mkdir native

cd native ##必须在子目录下执行boostrap
../bootstrap

make

```
这些依赖库很少有编译不过的
可以知道的是，vlc的依赖库比android版本多。

# 4 配置VLC
```
./configure --prefix=/path/to/install/folder/  --enable-debug --disable-chromaprint
```


然后 make

# 5 centos7 上protobuf编译不过
主要是因为protoc是2.5的，识别不了2.6.1的
需要修改rule.mk，去掉
```
--with-protoc=protoc

```

# 5 stream_out/chromcast 编译不过
>   不知道为啥chromcast目录下的proto不识别，说是版本太旧了，我还以为是protoc的原因，手动编译了protobuf2.6.1给centos7装上，实际上人家是protobuf-compiler，而且我应该降级？

我不懂protobuf协议，现在也没空细看，所以直接屏蔽掉这个插件

修改modules/stream_out/Makefile.am，去掉对chromecast的引用:

```
if ENABLE_SOUT
#if BUILD_CHROMECAST
#BUILT_SOURCES += stream_out/chromecast/cast_channel.pb.h
#sout_LTLIBRARIES += libstream_out_chromecast_plugin.la
#control_LTLIBRARIES += libctrl_chromecast_plugin.la
#endif
endif
```
此时，重新执行vlc的autogen：
```
[root@c7 vlc]# ./bootstrap
NOTE: GNU gettext appears to be missing or out-of-date.
Please install or update GNU gettext.
Also check if you have cvs, a dependency of autopoint.
Otherwise, you will not be able to build a source tarball.
==============================================================

generating modules/**/Makefile.am
.
+ autoreconf --install --force --verbose -I m4
autoreconf: Entering directory `.'
autoreconf: running: true --force
autoreconf: running: aclocal -I m4 --force -I m4
autoreconf: configure.ac: tracing
autoreconf: running: libtoolize --copy --force
libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, `autotools'.
libtoolize: copying file `autotools/ltmain.sh'
libtoolize: putting macros in AC_CONFIG_MACRO_DIR, `m4'.
libtoolize: copying file `m4/libtool.m4'
libtoolize: copying file `m4/ltoptions.m4'
libtoolize: copying file `m4/ltsugar.m4'
libtoolize: copying file `m4/ltversion.m4'
libtoolize: copying file `m4/lt~obsolete.m4'
autoreconf: running: /usr/bin/autoconf --include=m4 --force
autoreconf: running: /usr/bin/autoheader --include=m4 --force
autoreconf: running: automake --add-missing --copy --force-missing
modules/stream_out/Makefile.am:92: warning: variable 'libstream_out_chromecast_plugin_la_SOURCES' is defined but no program or
modules/stream_out/Makefile.am:92: library has 'libstream_out_chromecast_plugin_la' as canonical name (possible typo)
modules/Makefile.am:53:   'modules/stream_out/Makefile.am' included from here
modules/stream_out/Makefile.am:87: warning: variable 'nodist_libctrl_chromecast_plugin_la_SOURCES' is defined but no program or
modules/stream_out/Makefile.am:87: library has 'libctrl_chromecast_plugin_la' as canonical name (possible typo)
modules/Makefile.am:53:   'modules/stream_out/Makefile.am' included from here
modules/stream_out/Makefile.am:83: warning: variable 'libctrl_chromecast_plugin_la_SOURCES' is defined but no program or
modules/stream_out/Makefile.am:83: library has 'libctrl_chromecast_plugin_la' as canonical name (possible typo)
modules/Makefile.am:53:   'modules/stream_out/Makefile.am' included from here
modules/stream_out/Makefile.am:89: warning: variable 'libctrl_chromecast_plugin_la_LIBADD' is defined but no program or
modules/stream_out/Makefile.am:89: library has 'libctrl_chromecast_plugin_la' as canonical name (possible typo)
modules/Makefile.am:53:   'modules/stream_out/Makefile.am' included from here
modules/stream_out/Makefile.am:94: warning: variable 'libstream_out_chromecast_plugin_la_LIBADD' is defined but no program or
modules/stream_out/Makefile.am:94: library has 'libstream_out_chromecast_plugin_la' as canonical name (possible typo)
modules/Makefile.am:53:   'modules/stream_out/Makefile.am' included from here
autoreconf: Leaving directory `.'
+ rm -f po/Makevars.template
+ rm -f stamp-h1
+ set +x
Successfully bootstrapped
[root@c7 vlc]#

```
这个时候就没有chromecast被编译了。

# 6  PRId64

> modules/demux 下好几个把c函数弄到cpp中来编译的就会出现这样的问题。

> 受到了[这个](https://www.videolan.org/developers/vlc/doc/doxygen/html/vlc__fixups_8h_source.html)的启发:

在vlc/include/vlc_fixups.h中，加入：
```
#ifndef LIBVLC_FIXUPS_H
# define LIBVLC_FIXUPS_H 1
```

这比一个一个cpp的加方便多了。

不知道为啥vlc_fixups.h中原有的：
```
/* C++11 says there's no need to define __STDC_*_MACROS when including
 * inttypes.h and stdint.h. */
#if defined (__cplusplus) && (!defined(HAVE_CXX11) || defined(__MINGW32__))
# ifndef __STDC_FORMAT_MACROS
#  define __STDC_FORMAT_MACROS 1
# endif
# ifndef __STDC_CONSTANT_MACROS
#  define __STDC_CONSTANT_MACROS 1
# endif
# ifndef __STDC_LIMIT_MACROS
#  define __STDC_LIMIT_MACROS 1
# endif
#endif
```
没有起作用。

[有个patch](https://mailman.videolan.org/pipermail/vlc-devel/2015-May/103117.html),貌似是为了解决这个问题的，没看懂啊，没起作用么？

# 7 VLC禁用 --disable-chromaprint

当前ffmpeg的编译选项:
```
# ./configure --extra-ldflags=' -L/home/zhangbin/xlive/vlc/pc/vlc/contrib/x86_64-redhat-linux/lib' --cc=gcc --pkg-config=pkg-config --disable-doc --disable-encoder=vorbis --enable-libgsm --enable-libopenjpeg --disable-debug --disable-avdevice --disable-devices --disable-avfilter --disable-filters --disable-protocol=concat --disable-bsfs --disable-bzlib --disable-avresample --enable-libmp3lame --enable-libvpx --disable-decoder=libvpx --disable-decoder=libvpx_vp8 --disable-decoder=libvpx_vp9 --arch=x86_64 --target-os=linux --enable-pic --enable-pthreads --nm= --ar=ar --prefix=/home/zhangbin/xlive/vlc/pc/vlc/contrib/x86_64-redhat-linux --enable-static --disable-shared
```

```
CC       demux/avformat/libavformat_plugin_la-avformat.lo
  CC       demux/avformat/libavformat_plugin_la-mux.lo
  CCLD     libavformat_plugin.la
  CC       packetizer/libpacketizer_avparser_plugin_la-avparser.lo
  CC       codec/avcodec/libpacketizer_avparser_plugin_la-fourcc.lo
  CCLD     libpacketizer_avparser_plugin.la
  CXXLD    libstream_out_chromaprint_plugin.la
/bin/ld: /home/zhangbin/xlive/vlc/pc/vlc/contrib/x86_64-redhat-linux/lib/libavcodec.a(fft.o): relocation R_X86_64_PC32 against symbol `ff_cos_32' can not be used when making a shared object; recompile with -fPIC
/bin/ld: final link failed: Bad value
collect2: error: ld returned 1 exit status
make[4]: *** [libstream_out_chromaprint_plugin.la] 错误 1
make[4]: 离开目录“/home/zhangbin/xlive/vlc/pc/vlc/modules”
make[3]: *** [all-recursive] 错误 1
make[3]: 离开目录“/home/zhangbin/xlive/vlc/pc/vlc/modules”
make[2]: *** [all] 错误 2
make[2]: 离开目录“/home/zhangbin/xlive/vlc/pc/vlc/modules”
make[1]: *** [all-recursive] 错误 1
make[1]: 离开目录“/home/zhangbin/xlive/vlc/pc/vlc”
make: *** [all] 错误 2
[root@c7 vlc]# 

```
> 在ffmpeg的Makefile的CFLAGS中加入 -fPIC,不管用啊，是不是CPPFLAGS也要加入啊
> [参考](https://forum.videolan.org/viewtopic.php?t=113054) 
```
I can confirm that this is still an issue in VLC 2.1.5. Basically,the only way to proceed is to run ./configure --disable-chromaprint, but this is at best just a work around to the issue.

Also, i noticed something very interesting; I currently have both VLC 2.1.4 and VLC 2.1.5 in my machine. If i compile any one release (e.g.: 2.1.5) with the contribs method and modify the ffmpeg rules.mak to --enable-shared --enable-static, that release will compile without having any problems with chromaprint, but the other version (which will be 2.1.4), when compiled with the same contribs method and the sane --enable-shared --enable-static rules in the ffmpeg rules.mak, will successfully complete but will not be able to see the ffmpeg codecs at all.

And both will also fail to actually activate the audio fingerprinter even though the plugin is already present in VLC.

Any ideas on what could be the problem?
```


# 8 没有桌面啊

```
[root@c7 vlc]# source doconfigure.sh 
checking build system type... x86_64-unknown-linux-gnu
checking host system type... x86_64-unknown-linux-gnu
checking for a BSD-compatible install... /bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking whether UID '0' is supported by ustar format... yes
checking whether GID '0' is supported by ustar format... yes
checking how to create a ustar tar archive... gnutar
checking whether make supports nested variables... (cached) yes
checking whether to enable maintainer-specific portions of Makefiles... yes
checking for style of include used by make... GNU
checking for gcc... gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking dependency style of gcc... gcc3
checking for gcc option to accept ISO C99... -std=gnu99
checking how to run the C preprocessor... gcc -std=gnu99 -E
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking minix/config.h usability... no
checking minix/config.h presence... no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... yes
checking whether gcc -std=gnu99  supports C11... no
checking whether gcc -std=gnu99 -std=gnu11 supports C11... no
checking whether gcc -std=gnu99 -std=c11 supports C11... no
checking whether gcc -std=gnu99 -c11 supports C11... no
checking whether gcc -std=gnu99 and cc understand -c and -o together... yes
checking for g++... g++
checking whether we are using the GNU C++ compiler... yes
checking whether g++ accepts -g... yes
checking dependency style of g++... gcc3
checking how to run the C preprocessor... gcc -std=gnu99 -E
checking for gcc... gcc
checking whether we are using the GNU Objective C compiler... no
checking whether gcc accepts -g... no
checking dependency style of gcc... gcc3
checking dependency style of gcc... (cached) gcc3
checking for egrep... (cached) /bin/grep -E
checking whether make sets $(MAKE)... (cached) yes
checking dependency style of gcc -std=gnu99... gcc3
checking for desktop-file-validate... desktop-file-validate
checking for c11-gcc... no
checking for c11... no
checking for c99-gcc... no
checking for c99... c99
checking for an ANSI C-conforming const... yes
checking for inline... inline
checking for C/C++ restrict keyword... __restrict
checking whether g++ supports C++11 features by default... no
checking whether g++ supports C++11 features with -std=c++11... yes
checking for an Android system... no
checking for Tizen... no
checking for 3rd party libraries path... /home/zhangbin/xlive/vlc/pc/vlc/contrib/x86_64-redhat-linux
checking how to print strings... printf
checking for a sed that does not truncate output... /bin/sed
checking for fgrep... /bin/grep -F
checking for ld used by gcc -std=gnu99... /bin/ld
checking if the linker (/bin/ld) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... /bin/nm -B
checking the name lister (/bin/nm -B) interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 1572864
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+="... yes
checking how to convert x86_64-unknown-linux-gnu file names to x86_64-unknown-linux-gnu format... func_convert_file_noop
checking how to convert x86_64-unknown-linux-gnu file names to toolchain format... func_convert_file_noop
checking for /bin/ld option to reload object files... -r
checking for objdump... objdump
checking how to recognize dependent libraries... (cached) pass_all
checking for dlltool... no
checking how to associate runtime and link libraries... printf %s\n
checking for ar... ar
checking for archiver @FILE support... @
checking for strip... strip
checking for ranlib... ranlib
checking command to parse /bin/nm -B output from gcc -std=gnu99 object... ok
checking for sysroot... no
checking for mt... no
checking if : is a manifest tool... no
checking for dlfcn.h... yes
checking for objdir... .libs
checking if gcc -std=gnu99 supports -fno-rtti -fno-exceptions... no
checking for gcc -std=gnu99 option to produce PIC... -fPIC -DPIC
checking if gcc -std=gnu99 PIC flag -fPIC -DPIC works... yes
checking if gcc -std=gnu99 static flag -static works... no
checking if gcc -std=gnu99 supports -c -o file.o... yes
checking if gcc -std=gnu99 supports -c -o file.o... (cached) yes
checking whether the gcc -std=gnu99 linker (/bin/ld -m elf_x86_64) supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking for shl_load... no
checking for shl_load in -ldld... no
checking for dlopen... no
checking for dlopen in -ldl... yes
checking whether a program can dlopen itself... yes
checking whether a statically linked program can dlopen itself... yes
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... no
checking how to run the C++ preprocessor... g++ -E
checking for ld used by g++... /bin/ld -m elf_x86_64
checking if the linker (/bin/ld -m elf_x86_64) is GNU ld... yes
checking whether the g++ linker (/bin/ld -m elf_x86_64) supports shared libraries... yes
checking for g++ option to produce PIC... -fPIC -DPIC
checking if g++ PIC flag -fPIC -DPIC works... yes
checking if g++ static flag -static works... no
checking if g++ supports -c -o file.o... yes
checking if g++ supports -c -o file.o... (cached) yes
checking whether the g++ linker (/bin/ld -m elf_x86_64) supports shared libraries... yes
checking dynamic linker characteristics... (cached) GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking for windres... no
checking for bash... /bin/bash
checking if dolt supports this host... yes, replacing libtool
checking whether NLS is requested... yes
checking for msgfmt... /home/zhangbin/xlive/vlc/pc/vlc/contrib/x86_64-redhat-linux/bin/msgfmt
checking for gmsgfmt... /home/zhangbin/xlive/vlc/pc/vlc/contrib/x86_64-redhat-linux/bin/msgfmt
checking for xgettext... /home/zhangbin/xlive/vlc/pc/vlc/contrib/x86_64-redhat-linux/bin/xgettext
checking for msgmerge... /home/zhangbin/xlive/vlc/pc/vlc/contrib/x86_64-redhat-linux/bin/msgmerge
checking for ld used by gcc -std=gnu99... /bin/ld -m elf_x86_64
checking if the linker (/bin/ld -m elf_x86_64) is GNU ld... yes
checking for shared library run path origin... done
checking for CFPreferencesCopyAppValue... no
checking for CFLocaleCopyCurrent... no
checking for GNU gettext in libc... yes
checking whether to use NLS... yes
checking where the gettext function comes from... libc
checking for iconv... yes
checking for working iconv... yes
checking for iconv declaration... 
         extern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft);
checking for buggy GNU/libc versions... not present
checking for shared objects suffix... .so
checking whether nanosleep is declared... yes
checking for daemon... yes
checking for fcntl... yes
checking for flock... yes
checking for fstatvfs... yes
checking for fork... yes
checking for getenv... yes
checking for getpwuid_r... yes
checking for isatty... yes
checking for lstat... yes
checking for memalign... yes
checking for mkostemp... yes
checking for mmap... yes
checking for open_memstream... yes
checking for openat... yes
checking for pread... yes
checking for posix_fadvise... yes
checking for posix_madvise... yes
checking for setlocale... yes
checking for stricmp... no
checking for strnicmp... no
checking for strptime... yes
checking for uselocale... yes
checking for pthread_cond_timedwait_monotonic_np... no
checking for pthread_condattr_setclock... no
checking for atof... yes
checking for atoll... yes
checking for dirfd... yes
checking for fdopendir... yes
checking for ffsll... yes
checking for flockfile... yes
checking for fsync... yes
checking for getdelim... yes
checking for getpid... yes
checking for lldiv... yes
checking for nrand48... yes
checking for poll... yes
checking for posix_memalign... yes
checking for recvmsg... yes
checking for rewind... yes
checking for sendmsg... yes
checking for setenv... yes
checking for strcasecmp... yes
checking for strcasestr... yes
checking for strdup... yes
checking for strlcpy... no
checking for strndup... yes
checking for strnlen... yes
checking for strnstr... no
checking for strsep... yes
checking for strtof... yes
checking for strtok_r... yes
checking for strtoll... yes
checking for swab... yes
checking for tdestroy... yes
checking for timegm... yes
checking for timespec_get... yes
checking for strverscmp... yes
checking for gettimeofday... yes
checking for fdatasync... yes
checking whether asprintf is declared... yes
checking whether vasprintf is declared... yes
checking whether gmtime_r is declared... yes
checking whether localtime_r is declared... yes
checking for static_assert in assert.h... yes
checking for working strcoll... yes
checking for accept4... yes
checking for pipe2... yes
checking for eventfd... yes
checking for vmsplice... yes
checking for sched_getaffinity... yes
checking for struct pollfd... yes
checking for struct timespec... yes
checking for library containing connect... none required
checking for library containing inet_pton... none required
checking for if_nameindex... yes
checking for if_nametoindex... yes
checking for socklen_t in sys/socket.h... yes
checking for struct sockaddr_storage... yes
checking for getopt_long... yes
checking for cos in -lm... yes
checking for lrintf in -lm... yes
checking for nanf in -lm... yes
checking for library containing dlsym... -ldl
checking for library containing pthread_rwlock_init... -lpthread
checking for library containing clock_nanosleep... none required
checking arpa/inet.h usability... yes
checking arpa/inet.h presence... yes
checking for arpa/inet.h... yes
checking pthread.h usability... yes
checking pthread.h presence... yes
checking for pthread.h... yes
checking search.h usability... yes
checking search.h presence... yes
checking for search.h... yes
checking sys/shm.h usability... yes
checking sys/shm.h presence... yes
checking for sys/shm.h... yes
checking sys/socket.h usability... yes
checking sys/socket.h presence... yes
checking for sys/socket.h... yes
checking for net/if.h... yes
checking syslog.h usability... yes
checking syslog.h presence... yes
checking for syslog.h... yes
checking netinet/udplite.h usability... no
checking netinet/udplite.h presence... no
checking for netinet/udplite.h... no
checking sys/param.h usability... yes
checking sys/param.h presence... yes
checking for sys/param.h... yes
checking sys/mount.h usability... yes
checking sys/mount.h presence... yes
checking for sys/mount.h... yes
checking getopt.h usability... yes
checking getopt.h presence... yes
checking for getopt.h... yes
checking linux/dccp.h usability... yes
checking linux/dccp.h presence... yes
checking for linux/dccp.h... yes
checking linux/magic.h usability... yes
checking linux/magic.h presence... yes
checking for linux/magic.h... yes
checking mntent.h usability... yes
checking mntent.h presence... yes
checking for mntent.h... yes
checking sys/eventfd.h usability... yes
checking sys/eventfd.h presence... yes
checking for sys/eventfd.h... yes
checking xlocale.h usability... yes
checking xlocale.h presence... yes
checking for xlocale.h... yes
checking for ssize_t... yes
checking for pkg-config... /bin/pkg-config
checking pkg-config is at least version 0.9.0... yes
checking zlib.h usability... yes
checking zlib.h presence... yes
checking for zlib.h... yes
checking for MINIZIP... no
checking unzip.h usability... no
checking unzip.h presence... no
checking for unzip.h... no
checking for IDN... no
checking for DBUS... yes
checking for SYSTEMD... no
configure: WARNING: No package 'libsystemd' found.
checking for ntohl in sys/param.h... no
checking if gcc -std=gnu99 accepts -Wall... yes
checking if gcc -std=gnu99 accepts -Wextra... yes
checking if gcc -std=gnu99 accepts -Wsign-compare... yes
checking if gcc -std=gnu99 accepts -Wundef... yes
checking if gcc -std=gnu99 accepts -Wpointer-arith... yes
checking if gcc -std=gnu99 accepts -Wbad-function-cast... yes
checking if gcc -std=gnu99 accepts -Wwrite-strings... yes
checking if gcc -std=gnu99 accepts -Wmissing-prototypes... yes
checking if gcc -std=gnu99 accepts -Wvolatile-register-var... yes
checking if gcc -std=gnu99 accepts -Werror-implicit-function-declaration... yes
checking if gcc -std=gnu99 accepts -Winit-self... yes
checking if gcc -std=gnu99 accepts -Wlogical-op... yes
checking if gcc -std=gnu99 accepts -Wformat-security... yes
checking if gcc -std=gnu99 accepts -pipe... yes
checking if g++ accepts -Wall... yes
checking if g++ accepts -Wextra... yes
checking if g++ accepts -Wsign-compare... yes
checking if g++ accepts -Wundef... yes
checking if g++ accepts -Wpointer-arith... yes
checking if g++ accepts -Wvolatile-register-var... yes
checking if g++ accepts -Wformat-security... yes
checking valgrind/valgrind.h usability... no
checking valgrind/valgrind.h presence... no
checking for valgrind/valgrind.h... no
checking if gcc -std=gnu99 accepts -fvisibility=hidden... yes
checking if gcc -std=gnu99 accepts -ffast-math... yes
checking if gcc -std=gnu99 accepts -funroll-loops... yes
checking if linker supports -Bsymbolic... -Wl,-Bsymbolic
checking __attribute__ ((aligned ())) support... 64
checking for __attribute__((packed))... yes
checking execinfo.h usability... yes
checking execinfo.h presence... yes
checking for execinfo.h... yes
checking for backtrace... yes
checking if gcc -std=gnu99 groks MMX intrinsics... yes
checking if gcc -std=gnu99 groks MMX inline assembly... yes
checking if gcc -std=gnu99 groks MMX EXT inline assembly... yes
checking if gcc -std=gnu99 groks SSE2 intrinsics... yes
checking if gcc -std=gnu99 groks SSE inline assembly... yes
checking if gcc -std=gnu99 groks SSE2 inline assembly... yes
checking if gcc -std=gnu99 groks SSE3 inline assembly... yes
checking if gcc -std=gnu99 groks SSSE3 inline assembly... yes
checking if gcc -std=gnu99 groks SSE4.1 inline assembly... yes
checking if gcc -std=gnu99 groks SSE4.2 inline assembly... yes
checking if gcc -std=gnu99 groks SSE4A inline assembly... yes
checking if gcc -std=gnu99 groks 3D Now! inline assembly... yes
checking for LUA... no
configure: WARNING: No package 'lua5.2' found, trying lua 5.1 instead
checking for LUA... no
configure: WARNING: No package 'lua5.1' found, trying lua >= 5.1 instead
checking for LUA... no
configure: WARNING: No package 'lua' found, trying manual detection instead
checking lua.h usability... yes
checking lua.h presence... yes
checking for lua.h... yes
checking lauxlib.h usability... yes
checking lauxlib.h presence... yes
checking for lauxlib.h... yes
checking lualib.h usability... yes
checking lualib.h presence... yes
checking for lualib.h... yes
checking for luaL_newstate in -llua5.2 ... no
checking for luaL_newstate in -llua5.1 ... no
checking for luaL_newstate in -llua51 ... no
checking for luaL_newstate in -llua ... yes
checking for luac... luac
checking for ARCHIVE... yes
checking for LIVE555... no
configure: WARNING: No package 'live555' found.
checking for live555 version 1324598400 or later... yes
checking for main in -lliveMedia_pic... no
checking for main in -lliveMedia... yes
checking for DC1394... no
configure: WARNING: Library libdc1394-2 >= 2.1.0 needed for dc1394 was not found
checking for DV1394... no
configure: WARNING: Library libraw1394 >= 2.0.1 libavc1394 >= 0.5.3 needed for dv1394 was not found
checking for LINSYS_SDI... yes
checking for DVDREAD... yes
checking for DVDNAV... yes
checking for dvdnav_stream_cb in dvdnav/dvdnav.h... yes
checking for BLURAY... yes
checking for OPENCV... no
configure: WARNING: Library opencv > 2.0 needed for opencv was not found
checking for SMBCLIENT... no
configure: WARNING: Library smbclient needed for smbclient was not found
checking for DSM... no
configure: WARNING: Library libdsm >= 0.0.7 needed for dsm was not found
checking for SFTP... yes
checking for NFS... yes
checking linux/videodev2.h usability... yes
checking linux/videodev2.h presence... yes
checking for linux/videodev2.h... yes
checking sys/videoio.h usability... no
checking sys/videoio.h presence... no
checking for sys/videoio.h... no
checking DeckLinkAPIDispatch.cpp usability... no
checking DeckLinkAPIDispatch.cpp presence... no
checking for DeckLinkAPIDispatch.cpp... no
configure: WARNING: Blackmagic DeckLink SDI include files not found
checking for cdrom_msf0 in linux/cdrom.h... yes
checking for scsireq in sys/scsiio.h... no
checking for ioc_toc_header in sys/cdio.h... no
checking for LIBCDDB... yes
checking for Linux DVB version 5.1... yes
checking for VNC... no
configure: WARNING: Library libvncclient >= 0.9.9 needed for vnc was not found
checking for FREERDP... no
configure: WARNING: Library freerdp >= 1.0.1 needed for freerdp was not found
checking for ASDCP... no
checking for DVBPSI... yes
checking gme/gme.h usability... yes
checking gme/gme.h presence... yes
checking for gme/gme.h... yes
checking for SID... yes
checking sidplay/builders/resid.h usability... yes
checking sidplay/builders/resid.h presence... yes
checking for sidplay/builders/resid.h... yes
checking for OGG... yes
checking for LIBVORBIS... yes
checking for OGG... yes
checking for SHOUT... yes
checking ebml/EbmlVersion.h usability... yes
checking ebml/EbmlVersion.h presence... yes
checking for ebml/EbmlVersion.h... yes
checking for libebml version >= 1.0.0... yes
checking matroska/KaxVersion.h usability... yes
checking matroska/KaxVersion.h presence... yes
checking for matroska/KaxVersion.h... yes
checking for libmatroska version >= 1.0.0... yes
checking matroska/KaxAttachments.h usability... yes
checking matroska/KaxAttachments.h presence... yes
checking for matroska/KaxAttachments.h... yes
checking for main in -lebml_pic... no
checking for main in -lebml... yes
checking for LIBMODPLUG... yes
checking mpc/mpcdec.h usability... yes
checking mpc/mpcdec.h presence... yes
checking for mpc/mpcdec.h... yes
checking for SHINE... no
configure: WARNING: Library shine >= 3.0.0 needed for shine was not found
checking for libcrystalhd/libcrystalhd_if.h... no
checking mad.h usability... yes
checking mad.h presence... yes
checking for mad.h... yes
checking for mad_bit_init in -lmad... yes
checking for MPG123... yes
checking for libavutil variant... libav
checking for GST_APP... no
configure: WARNING: No package 'gstreamer-app-1.0' found. GStreamer modules will not be built.
checking for AVCODEC... yes
checking libavcodec/avcodec.h usability... yes
checking libavcodec/avcodec.h presence... yes
checking for libavcodec/avcodec.h... yes
checking libavutil/avutil.h usability... yes
checking libavutil/avutil.h presence... yes
checking for libavutil/avutil.h... yes
configure: WARNING: .
checking for LIBVA_DRM... no
configure: WARNING: No package 'libva-drm' found.
checking for LIBVA_X11... no
configure: WARNING: No package 'libva-x11' found.
checking dxgidebug.h usability... no
checking dxgidebug.h presence... no
checking for dxgidebug.h... no
checking for AVFORMAT... yes
checking libavformat/avformat.h usability... yes
checking libavformat/avformat.h presence... yes
checking for libavformat/avformat.h... yes
checking libavformat/avio.h usability... yes
checking libavformat/avio.h presence... yes
checking for libavformat/avio.h... yes
checking for libavcodec/avcodec.h... (cached) yes
checking for libavutil/avutil.h... (cached) yes
checking for SWSCALE... yes
checking libswscale/swscale.h usability... yes
checking libswscale/swscale.h presence... yes
checking for libswscale/swscale.h... yes
checking for libavutil/avutil.h... (cached) yes
checking for POSTPROC... yes
checking postproc/postprocess.h usability... no
checking postproc/postprocess.h presence... no
checking for postproc/postprocess.h... no
checking neaacdec.h usability... yes
checking neaacdec.h presence... yes
checking for neaacdec.h... yes
checking for NeAACDecOpen in -lfaad... yes
checking for VPX... yes
checking for vpx_codec_vp8_dx in -lvpx... yes
checking for vpx_codec_vp9_dx in -lvpx... yes
checking for vpx_codec_vp8_cx in -lvpx... yes
checking for vpx_codec_vp9_cx in -lvpx... yes
checking for TWOLAME... yes
checking a52dec/a52.h usability... yes
checking a52dec/a52.h presence... yes
checking for a52dec/a52.h... yes
checking for a52_free in -la52... yes
checking for DCA... yes
checking for FLAC... yes
checking for LIBMPEG2... yes
checking for VORBIS... yes
checking for SPEEX... yes
checking for SPEEXDSP... yes
checking for OPUS... yes
checking for THEORA... yes
checking for SCHROEDINGER... yes
checking png.h usability... yes
checking png.h presence... yes
checking for png.h... yes
checking for png_set_rows in -lpng... yes
checking jpeglib.h usability... yes
checking jpeglib.h presence... yes
checking for jpeglib.h... yes
checking libbpg.h usability... no
checking libbpg.h presence... no
checking for libbpg.h... no
checking for X262... no
checking for X265... yes
checking for X26410B... no
checking for X264... yes
checking for MFX... no
configure: WARNING: Library libmfx needed for mfx was not found
checking for FLUIDSYNTH... yes
checking for ZVBI... yes
checking for LIBASS... yes
checking fontconfig/fontconfig.h usability... yes
checking fontconfig/fontconfig.h presence... yes
checking for fontconfig/fontconfig.h... yes
checking for ARIBB24... yes
checking for ARIBB25... no
configure: WARNING: Library aribb25 >= 0.2.6 needed for aribb25 was not found
checking for KATE... yes
checking for TIGER... no
checking for EGL... no
checking for GL... yes
checking for X... libraries , headers 
checking for gethostbyname... yes
checking for connect... yes
checking for remove... yes
checking for shmat... yes
checking for IceConnectionNumber in -lICE... no
checking X11/Xlib.h usability... yes
checking X11/Xlib.h presence... yes
checking for X11/Xlib.h... yes
checking for XCB... yes
checking for XCB_SHM... yes
checking for XCB_COMPOSITE... yes
checking for XPROTO... yes
checking for XCB_XV... yes
checking for XCB_RANDR... yes
checking for XCB_KEYSYMS... no
configure: WARNING: No package 'xcb-keysyms' found. Hotkeys will not work.
checking for VDPAU... no
checking for the Wayland scanner... wayland-scanner
checking for WAYLAND_CLIENT... no
checking for SDL... yes
checking for SDL_IMAGE... yes
checking for FREETYPE... yes
checking for fontconfig/fontconfig.h... (cached) yes
checking for FRIBIDI... yes
checking for HARFBUZZ... yes
checking for ISpObjectToken... no
configure: WARNING: sapi.h not found. Text to Speech renderer for Windows disabled
checking for SVG... no
configure: WARNING: Library librsvg-2.0 >= 2.9.0 needed for svg was not found
checking for SVGDEC... no
configure: WARNING: Library librsvg-2.0 >= 2.9.0 cairo >= 1.13.1 needed for svgdec was not found
checking linux/fb.h usability... yes
checking linux/fb.h presence... yes
checking for linux/fb.h... yes
checking for CACA... yes
checking kva.h usability... no
checking kva.h presence... no
checking for kva.h... no
checking interface/mmal/mmal.h usability... no
checking interface/mmal/mmal.h presence... no
checking for interface/mmal/mmal.h... no
configure: WARNING: Cannot find development headers for mmal...
checking for PULSE... yes
checking for ALSA... yes
checking sndio.h usability... no
checking sndio.h presence... no
checking for sndio.h... no
checking audioclient.h usability... no
checking audioclient.h presence... no
checking for audioclient.h... no
checking for JACK... no
configure: WARNING: No package 'jack' found, trying jack1 instead
checking for JACK... no
configure: WARNING: No package 'jack' found
No package 'jack' found.
checking for SAMPLERATE... yes
checking for SOXR... no
configure: WARNING: Library soxr >= 0.1.2 needed for soxr was not found
checking kai.h usability... no
checking kai.h presence... no
checking for kai.h... no
checking for protoc... protoc
checking for CHROMECAST... yes
checking for QT... no
checking for QT... no
configure: WARNING: No package 'QtCore' found 没找到
No package 'QtGui' found. 没找到
checking for moc-qt4... no 没找到
checking for moc... no
checking for rcc... rcc
checking for uic-qt4... no
checking for uic... no
configure: WARNING: The skins2 module depends on the Qt4 interface, Qt4 is not built so skins2 is disabled.
checking VideoToolbox/VideoToolbox.h usability... no
checking VideoToolbox/VideoToolbox.h presence... no
checking for VideoToolbox/VideoToolbox.h... no
checking for NCURSES... yes
checking for GOOM... yes
checking for PROJECTM... no
configure: WARNING: No package 'libprojectM' found.
checking for VSXU... no
configure: WARNING: No package 'libvsxu' found.
checking for AVAHI... no
configure: WARNING: Library avahi-client >= 0.6 needed for avahi was not found
checking for UDEV... no
configure: WARNING: Library libudev >= 142 needed for udev was not found
checking for MTP... no
configure: WARNING: Library libmtp >= 1.0.0 needed for mtp was not found
checking for UPNP... yes
checking for MICRODNS... no
configure: WARNING: Library microdns needed for microdns was not found
checking for LIBXML2... yes
checking for GNUTLS... yes
checking for TAGLIB... yes
checking for SECRET... no
configure: WARNING: Library libsecret-1 needed for secret was not found
checking for NOTIFY... no
configure: WARNING: Library libnotify gtk+-2.0 needed for notify was not found
checking whether byte ordering is bigendian... no
./configure: line 54895: kde4-config: command not found
checking that generated files are newer than configure... done
configure: creating ./config.status
config.status: creating Makefile
config.status: creating doc/Makefile
config.status: creating modules/Makefile
config.status: creating m4/Makefile
config.status: creating po/Makefile.in
config.status: creating share/Makefile
config.status: creating compat/Makefile
config.status: creating src/Makefile
config.status: creating lib/Makefile
config.status: creating bin/Makefile
config.status: creating test/Makefile
config.status: creating modules/gui/macosx/Makefile
config.status: creating modules/gui/qt4/Makefile
config.status: creating modules/gui/skins2/Makefile
config.status: creating modules/hw/mmal/Makefile
config.status: creating config.h
config.status: executing depfiles commands
config.status: executing libtool commands
config.status: executing po-directories commands
config.status: creating po/POTFILES
config.status: creating po/Makefile

libvlc configuration
--------------------
version               : 3.0.0-git
system                : linux
architecture          : x86_64 mmx sse sse2
optimizations         : yes
vlc aliases           : cvlc rvlc nvlc

To build vlc and its plugins, type `make', or `./compile' if you like nice colors.

```




```
[root@c7 bin]# ./vlc
VLC is not supposed to be run as root. Sorry.
If you need to use real-time priorities and/or privileged TCP ports
you can use ./vlc-wrapper (make sure it is Set-UID root and
cannot be run by non-trusted users first).
[root@c7 bin]# ./vlc-wrapper 
VLC media player 3.0.0-git Vetinari (revision 2.2.0-git-6459-g144ebc4)
[000000000237e298] core interface error: no suitable interface module
[0000000002288368] core libvlc error: interface "globalhotkeys,none" initialization failed
[000000000237e308] dbus interface error: Failed to connect to the D-Bus session daemon: Failed to connect to socket /tmp/dbus-GvRimyV9Uw: 拒绝连接
[000000000237e308] core interface error: no suitable interface module
[0000000002288368] core libvlc error: interface "dbus,none" initialization failed
[0000000002288368] core libvlc: 正在以默认界面运行 vlc，使用 'cvlc' 将 vlc 运行在无界面的状态下。
[000000000237e308] [cli] lua interface error: Error loading script /home/zhangbin/xlive/vlc/pc/out/lib/vlc/lua/intf/cli.luac: /home/zhangbin/xlive/vlc/pc/out/lib/vlc/lua/intf/cli.luac: bad header in precompiled chunk


```

# 9 qt5的qvlc
> config.log 发现没有找到qt4， centos7安装的qt是qt4.8.5，据说vlc要4.8.7或者5.1.0+，5.1.0有bug
> 现在的qt已经是5.5了，qtcreator早就基于qt5开发了

```
[zhangbin@c7 ~]$ sudo su
[sudo] password for zhangbin: 
[root@c7 zhangbin]# yum install qtcreator
已加载插件：axelget, fastestmirror, langpacks
repomd.xml                                               | 3.6 kB     00:00     
base/group                                               | 729 kB     00:16     
base/primary                                             | 1.9 MB     00:33 ... 
base/primary_db                                          | 4.0 MB     00:33 ... 
update base metadata successfully
repomd.xml                                               | 2.9 kB     00:00     
elrepo/primary_db                                        | 348 kB     00:16     
update elrepo metadata successfully
epel/x86_64/metalink                                     | 5.3 kB     00:00     
repomd.xml                                               | 4.3 kB     00:00     
epel/group                                               | 1.3 MB     00:11     
epel/updateinfo                                          | 488 kB     00:11     
epel/primary                                             | 2.6 MB     00:11     
epel/primary_db                                          | 3.8 MB     00:01     
update epel metadata successfully
repomd.xml                                               | 3.4 kB     00:00     
update extras metadata successfully
repomd.xml                                               | 2.9 kB     00:00     
nux-dextop/primary                                       | 828 kB     10:25     
nux-dextop/primary_db                                    | 1.5 MB     00:49     
update nux-dextop metadata successfully
repomd.xml                                               | 3.4 kB     00:00     
updates/primary                                          | 1.6 MB     00:15     
updates/primary_db                                       | 3.1 MB     00:11     
update updates metadata successfully
base                                                     | 3.6 kB     00:00     
elrepo                                                   | 2.9 kB     00:00     
extras                                                   | 3.4 kB     00:00     
nux-dextop                                               | 2.9 kB     00:00     
updates                                                  | 3.4 kB     00:00     
(1/4): epel/x86_64/group_gz                                | 169 kB   00:00     
(2/4): extras/7/x86_64/primary_db                          |  90 kB   00:05     
(3/4): base/7/x86_64/group_gz                              | 155 kB   00:05     
(4/4): base/7/x86_64/primary_db                            | 5.3 MB   00:06     
Loading mirror speeds from cached hostfile
 * base: ftp.sjtu.edu.cn
 * elrepo: hkg.mirror.rackspace.com
 * epel: mirrors.neusoft.edu.cn
 * extras: mirrors.neusoft.edu.cn
 * nux-dextop: mirror.li.nux.ro
 * updates: ftp.sjtu.edu.cn
正在解决依赖关系
--> 正在检查事务
---> 软件包 qt-creator.x86_64.0.3.5.1-1.el7 将被 安装
--> 正在处理依赖关系 qt-creator-data = 3.5.1-1.el7，它被软件包 qt-creator-3.5.1-1.el7.x86_64 需要
--> 正在处理依赖关系 qt5-qtquickcontrols，它被软件包 qt-creator-3.5.1-1.el7.x86_64 需要
--> 正在处理依赖关系 qt5-qtdoc，它被软件包 qt-creator-3.5.1-1.el7.x86_64 需要
--> 正在处理依赖关系 qt5-qtbase-devel，它被软件包 qt-creator-3.5.1-1.el7.x86_64 需要
--> 正在处理依赖关系 libbotan-1.10.so.0()(64bit)，它被软件包 qt-creator-3.5.1-1.el7.x86_64 需要
--> 正在处理依赖关系 libQt5Xml.so.5()(64bit)，它被软件包 qt-creator-3.5.1-1.el7.x86_64 需要
--> 正在处理依赖关系 libQt5Widgets.so.5()(64bit)，它被软件包 qt-creator-3.5.1-1.el7.x86_64 需要
--> 正在处理依赖关系 libQt5WebKitWidgets.so.5()(64bit)，它被软件包 qt-creator-3.5.1-1.el7.x86_64 需要
--> 正在处理依赖关系 libQt5WebKit.so.5()(64bit)，它被软件包 qt-creator-3.5.1-1.el7.x86_64 需要
--> 正在处理依赖关系 libQt5Sql.so.5()(64bit)，它被软件包 qt-creator-3.5.1-1.el7.x86_64 需要
--> 正在处理依赖关系 libQt5Script.so.5()(64bit)，它被软件包 qt-creator-3.5.1-1.el7.x86_64 需要
--> 正在处理依赖关系 libQt5QuickWidgets.so.5()(64bit)，它被软件包 qt-creator-3.5.1-1.el7.x86_64 需要
--> 正在处理依赖关系 libQt5Quick.so.5()(64bit)，它被软件包 qt-creator-3.5.1-1.el7.x86_64 需要
--> 正在处理依赖关系 libQt5Qml.so.5()(64bit)，它被软件包 qt-creator-3.5.1-1.el7.x86_64 需要
--> 正在处理依赖关系 libQt5PrintSupport.so.5()(64bit)，它被软件包 qt-creator-3.5.1-1.el7.x86_64 需要
--> 正在处理依赖关系 libQt5Network.so.5()(64bit)，它被软件包 qt-creator-3.5.1-1.el7.x86_64 需要
--> 正在处理依赖关系 libQt5Help.so.5()(64bit)，它被软件包 qt-creator-3.5.1-1.el7.x86_64 需要
--> 正在处理依赖关系 libQt5Gui.so.5()(64bit)，它被软件包 qt-creator-3.5.1-1.el7.x86_64 需要
--> 正在处理依赖关系 libQt5DesignerComponents.so.5()(64bit)，它被软件包 qt-creator-3.5.1-1.el7.x86_64 需要
--> 正在处理依赖关系 libQt5Designer.so.5()(64bit)，它被软件包 qt-creator-3.5.1-1.el7.x86_64 需要
--> 正在处理依赖关系 libQt5Core.so.5()(64bit)，它被软件包 qt-creator-3.5.1-1.el7.x86_64 需要
--> 正在处理依赖关系 libQt5Concurrent.so.5()(64bit)，它被软件包 qt-creator-3.5.1-1.el7.x86_64 需要
--> 正在检查事务
---> 软件包 botan.x86_64.0.1.10.9-4.el7 将被 安装
---> 软件包 qt-creator-data.noarch.0.3.5.1-1.el7 将被 安装
---> 软件包 qt5-qtbase.x86_64.0.5.5.1-11.el7 将被 安装
--> 正在处理依赖关系 qt5-qtbase-common = 5.5.1-11.el7，它被软件包 qt5-qtbase-5.5.1-11.el7.x86_64 需要
---> 软件包 qt5-qtbase-devel.x86_64.0.5.5.1-11.el7 将被 安装
--> 正在处理依赖关系 qt5-qdoc，它被软件包 qt5-qtbase-devel-5.5.1-11.el7.x86_64 需要
--> 正在处理依赖关系 pkgconfig(egl)，它被软件包 qt5-qtbase-devel-5.5.1-11.el7.x86_64 需要
---> 软件包 qt5-qtbase-gui.x86_64.0.5.5.1-11.el7 将被 安装
--> 正在处理依赖关系 libxcb-render-util.so.0()(64bit)，它被软件包 qt5-qtbase-gui-5.5.1-11.el7.x86_64 需要
--> 正在处理依赖关系 libxcb-keysyms.so.1()(64bit)，它被软件包 qt5-qtbase-gui-5.5.1-11.el7.x86_64 需要
--> 正在处理依赖关系 libxcb-image.so.0()(64bit)，它被软件包 qt5-qtbase-gui-5.5.1-11.el7.x86_64 需要
--> 正在处理依赖关系 libxcb-icccm.so.4()(64bit)，它被软件包 qt5-qtbase-gui-5.5.1-11.el7.x86_64 需要
---> 软件包 qt5-qtdeclarative.x86_64.0.5.5.1-2.el7 将被 安装
--> 正在处理依赖关系 libQt5XmlPatterns.so.5()(64bit)，它被软件包 qt5-qtdeclarative-5.5.1-2.el7.x86_64 需要
---> 软件包 qt5-qtdoc.noarch.0.5.5.1-2.el7 将被 安装
---> 软件包 qt5-qtquickcontrols.x86_64.0.5.5.1-2.el7 将被 安装
---> 软件包 qt5-qtscript.x86_64.0.5.5.1-2.el7 将被 安装
---> 软件包 qt5-qttools-libs-designer.x86_64.0.5.5.1-2.el7 将被 安装
--> 正在处理依赖关系 qt5-qttools-common = 5.5.1-2.el7，它被软件包 qt5-qttools-libs-designer-5.5.1-2.el7.x86_64 需要
---> 软件包 qt5-qttools-libs-designercomponents.x86_64.0.5.5.1-2.el7 将被 安装
---> 软件包 qt5-qttools-libs-help.x86_64.0.5.5.1-2.el7 将被 安装
--> 正在处理依赖关系 libclucene.so.3()(64bit)，它被软件包 qt5-qttools-libs-help-5.5.1-2.el7.x86_64 需要
--> 正在处理依赖关系 libQt5CLucene.so.5()(64bit)，它被软件包 qt5-qttools-libs-help-5.5.1-2.el7.x86_64 需要
---> 软件包 qt5-qtwebkit.x86_64.0.5.5.1-3.el7 将被 安装
--> 正在处理依赖关系 libQt5Sensors.so.5()(64bit)，它被软件包 qt5-qtwebkit-5.5.1-3.el7.x86_64 需要
--> 正在处理依赖关系 libQt5Positioning.so.5()(64bit)，它被软件包 qt5-qtwebkit-5.5.1-3.el7.x86_64 需要
--> 正在检查事务
---> 软件包 clucene09-core.x86_64.0.0.9.21b-13.el7 将被 安装
---> 软件包 mesa-libEGL-devel.x86_64.0.10.6.5-3.20150824.el7 将被 安装
---> 软件包 qt5-qdoc.x86_64.0.5.5.1-11.el7 将被 安装
---> 软件包 qt5-qtbase-common.noarch.0.5.5.1-11.el7 将被 安装
---> 软件包 qt5-qtlocation.x86_64.0.5.5.1-3.el7 将被 安装
---> 软件包 qt5-qtsensors.x86_64.0.5.5.1-2.el7 将被 安装
---> 软件包 qt5-qttools-common.noarch.0.5.5.1-2.el7 将被 安装
---> 软件包 qt5-qttools-libs-clucene.x86_64.0.5.5.1-2.el7 将被 安装
---> 软件包 qt5-qtxmlpatterns.x86_64.0.5.5.1-2.el7 将被 安装
---> 软件包 xcb-util-image.x86_64.0.0.4.0-2.el7 将被 安装
---> 软件包 xcb-util-keysyms.x86_64.0.0.4.0-1.el7 将被 安装
---> 软件包 xcb-util-renderutil.x86_64.0.0.3.9-3.el7 将被 安装
---> 软件包 xcb-util-wm.x86_64.0.0.4.1-5.el7 将被 安装
--> 解决依赖关系完成

依赖关系解决

================================================================================
 Package                             架构   版本                     源    大小
================================================================================
正在安装:
 qt-creator                          x86_64 3.5.1-1.el7              epel  14 M
为依赖而安装:
 botan                               x86_64 1.10.9-4.el7             epel 951 k
 clucene09-core                      x86_64 0.9.21b-13.el7           epel 300 k
 mesa-libEGL-devel                   x86_64 10.6.5-3.20150824.el7    base  27 k
 qt-creator-data                     noarch 3.5.1-1.el7              epel 1.0 M
 qt5-qdoc                            x86_64 5.5.1-11.el7             epel 473 k
 qt5-qtbase                          x86_64 5.5.1-11.el7             epel 3.1 M
 qt5-qtbase-common                   noarch 5.5.1-11.el7             epel  19 k
 qt5-qtbase-devel                    x86_64 5.5.1-11.el7             epel 3.9 M
 qt5-qtbase-gui                      x86_64 5.5.1-11.el7             epel 5.4 M
 qt5-qtdeclarative                   x86_64 5.5.1-2.el7              epel 2.9 M
 qt5-qtdoc                           noarch 5.5.1-2.el7              epel 5.0 M
 qt5-qtlocation                      x86_64 5.5.1-3.el7              epel 648 k
 qt5-qtquickcontrols                 x86_64 5.5.1-2.el7              epel 917 k
 qt5-qtscript                        x86_64 5.5.1-2.el7              epel 1.0 M
 qt5-qtsensors                       x86_64 5.5.1-2.el7              epel 190 k
 qt5-qttools-common                  noarch 5.5.1-2.el7              epel  19 k
 qt5-qttools-libs-clucene            x86_64 5.5.1-2.el7              epel  46 k
 qt5-qttools-libs-designer           x86_64 5.5.1-2.el7              epel 2.7 M
 qt5-qttools-libs-designercomponents x86_64 5.5.1-2.el7              epel 773 k
 qt5-qttools-libs-help               x86_64 5.5.1-2.el7              epel 201 k
 qt5-qtwebkit                        x86_64 5.5.1-3.el7              epel  10 M
 qt5-qtxmlpatterns                   x86_64 5.5.1-2.el7              epel 1.1 M
 xcb-util-image                      x86_64 0.4.0-2.el7              base  15 k
 xcb-util-keysyms                    x86_64 0.4.0-1.el7              base  10 k
 xcb-util-renderutil                 x86_64 0.3.9-3.el7              base  12 k
 xcb-util-wm                         x86_64 0.4.1-5.el7              base  25 k

事务概要
================================================================================
安装  1 软件包 (+26 依赖软件包)

总计：55 M
总下载量：12 M
安装大小：182 M
Is this ok [y/d/N]: y
Downloading packages:
No Presto metadata available for epel
qt5-qtdeclarative-5.5.1-2.el7.x86_64.rpm                 | 2.9 MB     00:11     
qt5-qtbase-gui-5.5.1-11.el7.x86_64.rpm                   | 5.4 MB     00:01     
qt5-qtquickcontrols-5.5.1-2.el7.x86_64.rpm               | 917 kB     00:06     
qt5-qtbase-devel-5.5.1-11.el7.x86_64.rpm                 | 3.9 MB     00:06     
qt5-qttools-libs-designercomponents-5.5.1-2.el7.x86_64.r | 773 kB     00:11     
qt5-qdoc-5.5.1-11.el7.x86_64.rpm                         | 473 kB     00:06     
qt5-qtscript-5.5.1-2.el7.x86_64.rpm                      | 1.0 MB     00:11     
qt5-qtlocation-5.5.1-3.el7.x86_64.rpm                    | 648 kB     00:11     
qt-creator-data-3.5.1-1.el7.noarch.rpm                   | 1.0 MB     00:11     
botan-1.10.9-4.el7.x86_64.rpm                            | 951 kB     00:06     
qt5-qtbase-5.5.1-11.el7.x86_64.rpm                       | 3.1 MB     00:11     
(1/10): mesa-libEGL-devel-10.6.5-3.20150824.el7.x86_64.rpm |  27 kB   00:00     
(2/10): qt5-qtbase-common-5.5.1-11.el7.noarch.rpm          |  19 kB   00:05     
(3/10): qt5-qtsensors-5.5.1-2.el7.x86_64.rpm               | 190 kB   00:00     
(4/10): qt5-qttools-common-5.5.1-2.el7.noarch.rpm          |  19 kB   00:00     
(5/10): qt5-qttools-libs-clucene-5.5.1-2.el7.x86_64.rpm    |  46 kB   00:00     
(6/10): qt5-qttools-libs-help-5.5.1-2.el7.x86_64.rpm       | 201 kB   00:00     
(7/10): xcb-util-image-0.4.0-2.el7.x86_64.rpm              |  15 kB   00:00     
(8/10): xcb-util-renderutil-0.3.9-3.el7.x86_64.rpm         |  12 kB   00:00     
(9/10): xcb-util-keysyms-0.4.0-1.el7.x86_64.rpm            |  10 kB   00:05     
(10/10): xcb-util-wm-0.4.1-5.el7.x86_64.rpm                |  25 kB   00:05     
--------------------------------------------------------------------------------
总计                                                46 kB/s | 566 kB  00:12     
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  正在安装    : qt5-qttools-common-5.5.1-2.el7.noarch                      1/27 
  正在安装    : clucene09-core-0.9.21b-13.el7.x86_64                       2/27 
/sbin/ldconfig: /lib/libGLESv1_CM.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libMali.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1.4 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so.1.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2.0 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so 用于未知的机器 40。

  正在安装    : qt5-qtbase-5.5.1-11.el7.x86_64                             3/27 
/sbin/ldconfig: /lib/libGLESv1_CM.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libMali.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1.4 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so.1.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2.0 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so 用于未知的机器 40。

  正在安装    : qt5-qtbase-common-5.5.1-11.el7.noarch                      4/27 
  正在安装    : qt5-qtxmlpatterns-5.5.1-2.el7.x86_64                       5/27 
/sbin/ldconfig: /lib/libGLESv1_CM.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libMali.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1.4 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so.1.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2.0 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so 用于未知的机器 40。

  正在安装    : qt5-qdoc-5.5.1-11.el7.x86_64                               6/27 
  正在安装    : qt5-qttools-libs-clucene-5.5.1-2.el7.x86_64                7/27 
/sbin/ldconfig: /lib/libGLESv1_CM.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libMali.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1.4 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so.1.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2.0 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so 用于未知的机器 40。

  正在安装    : botan-1.10.9-4.el7.x86_64                                  8/27 
/sbin/ldconfig: /lib/libGLESv1_CM.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libMali.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1.4 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so.1.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2.0 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so 用于未知的机器 40。

  正在安装    : xcb-util-image-0.4.0-2.el7.x86_64                          9/27 
/sbin/ldconfig: /lib/libGLESv1_CM.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libMali.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1.4 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so.1.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2.0 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so 用于未知的机器 40。

  正在安装    : xcb-util-renderutil-0.3.9-3.el7.x86_64                    10/27 
/sbin/ldconfig: /lib/libGLESv1_CM.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libMali.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1.4 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so.1.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2.0 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so 用于未知的机器 40。

  正在安装    : mesa-libEGL-devel-10.6.5-3.20150824.el7.x86_64            11/27 
  正在安装    : qt5-qtdoc-5.5.1-2.el7.noarch                              12/27 
  正在安装    : xcb-util-keysyms-0.4.0-1.el7.x86_64                       13/27 
/sbin/ldconfig: /lib/libGLESv1_CM.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libMali.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1.4 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so.1.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2.0 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so 用于未知的机器 40。

  正在安装    : xcb-util-wm-0.4.1-5.el7.x86_64                            14/27 
/sbin/ldconfig: /lib/libGLESv1_CM.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libMali.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1.4 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so.1.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2.0 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so 用于未知的机器 40。

  正在安装    : qt5-qtbase-gui-5.5.1-11.el7.x86_64                        15/27 
/sbin/ldconfig: /lib/libGLESv1_CM.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libMali.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1.4 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so.1.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2.0 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so 用于未知的机器 40。

  正在安装    : qt5-qtdeclarative-5.5.1-2.el7.x86_64                      16/27 
/sbin/ldconfig: /lib/libGLESv1_CM.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libMali.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1.4 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so.1.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2.0 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so 用于未知的机器 40。

  正在安装    : qt5-qttools-libs-designer-5.5.1-2.el7.x86_64              17/27 
/sbin/ldconfig: /lib/libGLESv1_CM.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libMali.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1.4 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so.1.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2.0 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so 用于未知的机器 40。

  正在安装    : qt5-qttools-libs-designercomponents-5.5.1-2.el7.x86_64    18/27 
/sbin/ldconfig: /lib/libGLESv1_CM.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libMali.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1.4 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so.1.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2.0 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so 用于未知的机器 40。

  正在安装    : qt5-qtquickcontrols-5.5.1-2.el7.x86_64                    19/27 
  正在安装    : qt5-qtlocation-5.5.1-3.el7.x86_64                         20/27 
/sbin/ldconfig: /lib/libGLESv1_CM.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libMali.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1.4 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so.1.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2.0 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so 用于未知的机器 40。

  正在安装    : qt5-qtsensors-5.5.1-2.el7.x86_64                          21/27 
/sbin/ldconfig: /lib/libGLESv1_CM.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libMali.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1.4 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so.1.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2.0 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so 用于未知的机器 40。

  正在安装    : qt5-qtwebkit-5.5.1-3.el7.x86_64                           22/27 
/sbin/ldconfig: /lib/libGLESv1_CM.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libMali.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1.4 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so.1.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2.0 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so 用于未知的机器 40。

  正在安装    : qt5-qttools-libs-help-5.5.1-2.el7.x86_64                  23/27 
/sbin/ldconfig: /lib/libGLESv1_CM.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libMali.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1.4 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so.1.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2.0 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so 用于未知的机器 40。

  正在安装    : qt5-qtbase-devel-5.5.1-11.el7.x86_64                      24/27 
  正在安装    : qt5-qtscript-5.5.1-2.el7.x86_64                           25/27 
/sbin/ldconfig: /lib/libGLESv1_CM.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libMali.so 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1.4 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv1_CM.so.1.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libGLESv2.so.2.0 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so.1 用于未知的机器 40。

/sbin/ldconfig: /lib/libEGL.so 用于未知的机器 40。

  正在安装    : qt-creator-data-3.5.1-1.el7.noarch                        26/27 
  正在安装    : qt-creator-3.5.1-1.el7.x86_64                             27/27 
  验证中      : qt5-qtbase-common-5.5.1-11.el7.noarch                      1/27 
  验证中      : qt-creator-3.5.1-1.el7.x86_64                              2/27 
  验证中      : qt5-qtdeclarative-5.5.1-2.el7.x86_64                       3/27 
  验证中      : qt5-qtbase-gui-5.5.1-11.el7.x86_64                         4/27 
  验证中      : qt5-qttools-common-5.5.1-2.el7.noarch                      5/27 
  验证中      : clucene09-core-0.9.21b-13.el7.x86_64                       6/27 
  验证中      : qt5-qtquickcontrols-5.5.1-2.el7.x86_64                     7/27 
  验证中      : xcb-util-wm-0.4.1-5.el7.x86_64                             8/27 
  验证中      : qt5-qttools-libs-help-5.5.1-2.el7.x86_64                   9/27 
  验证中      : qt5-qttools-libs-designer-5.5.1-2.el7.x86_64              10/27 
  验证中      : xcb-util-keysyms-0.4.0-1.el7.x86_64                       11/27 
  验证中      : qt5-qtwebkit-5.5.1-3.el7.x86_64                           12/27 
  验证中      : qt5-qtdoc-5.5.1-2.el7.noarch                              13/27 
  验证中      : qt5-qtxmlpatterns-5.5.1-2.el7.x86_64                      14/27 
  验证中      : mesa-libEGL-devel-10.6.5-3.20150824.el7.x86_64            15/27 
  验证中      : qt5-qtbase-devel-5.5.1-11.el7.x86_64                      16/27 
  验证中      : qt5-qttools-libs-designercomponents-5.5.1-2.el7.x86_64    17/27 
  验证中      : xcb-util-renderutil-0.3.9-3.el7.x86_64                    18/27 
  验证中      : xcb-util-image-0.4.0-2.el7.x86_64                         19/27 
  验证中      : qt5-qdoc-5.5.1-11.el7.x86_64                              20/27 
  验证中      : qt5-qtscript-5.5.1-2.el7.x86_64                           21/27 
  验证中      : qt5-qtlocation-5.5.1-3.el7.x86_64                         22/27 
  验证中      : qt5-qtsensors-5.5.1-2.el7.x86_64                          23/27 
  验证中      : qt-creator-data-3.5.1-1.el7.noarch                        24/27 
  验证中      : botan-1.10.9-4.el7.x86_64                                 25/27 
  验证中      : qt5-qttools-libs-clucene-5.5.1-2.el7.x86_64               26/27 
  验证中      : qt5-qtbase-5.5.1-11.el7.x86_64                            27/27 

已安装:
  qt-creator.x86_64 0:3.5.1-1.el7                                               

作为依赖被安装:
  botan.x86_64 0:1.10.9-4.el7                                                   
  clucene09-core.x86_64 0:0.9.21b-13.el7                                        
  mesa-libEGL-devel.x86_64 0:10.6.5-3.20150824.el7                              
  qt-creator-data.noarch 0:3.5.1-1.el7                                          
  qt5-qdoc.x86_64 0:5.5.1-11.el7                                                
  qt5-qtbase.x86_64 0:5.5.1-11.el7                                              
  qt5-qtbase-common.noarch 0:5.5.1-11.el7                                       
  qt5-qtbase-devel.x86_64 0:5.5.1-11.el7                                        
  qt5-qtbase-gui.x86_64 0:5.5.1-11.el7                                          
  qt5-qtdeclarative.x86_64 0:5.5.1-2.el7                                        
  qt5-qtdoc.noarch 0:5.5.1-2.el7                                                
  qt5-qtlocation.x86_64 0:5.5.1-3.el7                                           
  qt5-qtquickcontrols.x86_64 0:5.5.1-2.el7                                      
  qt5-qtscript.x86_64 0:5.5.1-2.el7                                             
  qt5-qtsensors.x86_64 0:5.5.1-2.el7                                            
  qt5-qttools-common.noarch 0:5.5.1-2.el7                                       
  qt5-qttools-libs-clucene.x86_64 0:5.5.1-2.el7                                 
  qt5-qttools-libs-designer.x86_64 0:5.5.1-2.el7                                
  qt5-qttools-libs-designercomponents.x86_64 0:5.5.1-2.el7                      
  qt5-qttools-libs-help.x86_64 0:5.5.1-2.el7                                    
  qt5-qtwebkit.x86_64 0:5.5.1-3.el7                                             
  qt5-qtxmlpatterns.x86_64 0:5.5.1-2.el7                                        
  xcb-util-image.x86_64 0:0.4.0-2.el7                                           
  xcb-util-keysyms.x86_64 0:0.4.0-1.el7                                         
  xcb-util-renderutil.x86_64 0:0.3.9-3.el7                                      
  xcb-util-wm.x86_64 0:0.4.1-5.el7                                              

完毕！

^C[root@c7 zhangbin]# 
[root@c7 zhangbin]# 
[root@c7 zhangbin]# cd xlive/vlc/pc
[root@c7 pc]# ls
out  vlc
[root@c7 pc]# cd vlc
[root@c7 vlc]# ls
aclocal.m4      config.h.in~        doc             make-alias   share
AUTHORS         config.log          doconfigure.sh  Makefile     src
autom4te.cache  config.status       doltcompile     Makefile.am  stamp-h1
autotools       configure           doltlibtool     Makefile.in  test
bin             configure.ac        extras          modules      THANKS
bootstrap       configure_help.txt  include         NEWS         vlc
compat          contrib             INSTALL         nvlc
compile         COPYING             lib             po
config.h        COPYING.LIB         libtool         README
config.h.in     cvlc                m4              rvlc
[root@c7 vlc]# source doconfigure.sh 
checking build system type... x86_64-unknown-linux-gnu
checking host system type... x86_64-unknown-linux-gnu
checking for a BSD-compatible install... /bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking whether UID '0' is supported by ustar format... yes
checking whether GID '0' is supported by ustar format... yes
checking how to create a ustar tar archive... gnutar
checking whether make supports nested variables... (cached) yes
checking whether to enable maintainer-specific portions of Makefiles... yes
checking for style of include used by make... GNU
checking for gcc... gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking dependency style of gcc... gcc3
checking for gcc option to accept ISO C99... -std=gnu99
checking how to run the C preprocessor... gcc -std=gnu99 -E
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking minix/config.h usability... no
checking minix/config.h presence... no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... yes
checking whether gcc -std=gnu99  supports C11... no
checking whether gcc -std=gnu99 -std=gnu11 supports C11... no
checking whether gcc -std=gnu99 -std=c11 supports C11... no
checking whether gcc -std=gnu99 -c11 supports C11... no
checking whether gcc -std=gnu99 and cc understand -c and -o together... yes
checking for g++... g++
checking whether we are using the GNU C++ compiler... yes
checking whether g++ accepts -g... yes
checking dependency style of g++... gcc3
checking how to run the C preprocessor... gcc -std=gnu99 -E
checking for gcc... gcc
checking whether we are using the GNU Objective C compiler... no
checking whether gcc accepts -g... no
checking dependency style of gcc... gcc3
checking dependency style of gcc... (cached) gcc3
checking for egrep... (cached) /bin/grep -E
checking whether make sets $(MAKE)... (cached) yes
checking dependency style of gcc -std=gnu99... gcc3
checking for desktop-file-validate... desktop-file-validate
checking for c11-gcc... no
checking for c11... no
checking for c99-gcc... no
checking for c99... c99
checking for an ANSI C-conforming const... yes
checking for inline... inline
checking for C/C++ restrict keyword... __restrict
checking whether g++ supports C++11 features by default... no
checking whether g++ supports C++11 features with -std=c++11... yes
checking for an Android system... no
checking for Tizen... no
checking for 3rd party libraries path... /home/zhangbin/xlive/vlc/pc/vlc/contrib/x86_64-redhat-linux
checking how to print strings... printf
checking for a sed that does not truncate output... /bin/sed
checking for fgrep... /bin/grep -F
checking for ld used by gcc -std=gnu99... /bin/ld
checking if the linker (/bin/ld) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... /bin/nm -B
checking the name lister (/bin/nm -B) interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 1572864
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+="... yes
checking how to convert x86_64-unknown-linux-gnu file names to x86_64-unknown-linux-gnu format... func_convert_file_noop
checking how to convert x86_64-unknown-linux-gnu file names to toolchain format... func_convert_file_noop
checking for /bin/ld option to reload object files... -r
checking for objdump... objdump
checking how to recognize dependent libraries... (cached) pass_all
checking for dlltool... no
checking how to associate runtime and link libraries... printf %s\n
checking for ar... ar
checking for archiver @FILE support... @
checking for strip... strip
checking for ranlib... ranlib
checking command to parse /bin/nm -B output from gcc -std=gnu99 object... ok
checking for sysroot... no
checking for mt... no
checking if : is a manifest tool... no
checking for dlfcn.h... yes
checking for objdir... .libs
checking if gcc -std=gnu99 supports -fno-rtti -fno-exceptions... no
checking for gcc -std=gnu99 option to produce PIC... -fPIC -DPIC
checking if gcc -std=gnu99 PIC flag -fPIC -DPIC works... yes
checking if gcc -std=gnu99 static flag -static works... no
checking if gcc -std=gnu99 supports -c -o file.o... yes
checking if gcc -std=gnu99 supports -c -o file.o... (cached) yes
checking whether the gcc -std=gnu99 linker (/bin/ld -m elf_x86_64) supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking for shl_load... no
checking for shl_load in -ldld... no
checking for dlopen... no
checking for dlopen in -ldl... yes
checking whether a program can dlopen itself... yes
checking whether a statically linked program can dlopen itself... yes
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... no
checking how to run the C++ preprocessor... g++ -E
checking for ld used by g++... /bin/ld -m elf_x86_64
checking if the linker (/bin/ld -m elf_x86_64) is GNU ld... yes
checking whether the g++ linker (/bin/ld -m elf_x86_64) supports shared libraries... yes
checking for g++ option to produce PIC... -fPIC -DPIC
checking if g++ PIC flag -fPIC -DPIC works... yes
checking if g++ static flag -static works... no
checking if g++ supports -c -o file.o... yes
checking if g++ supports -c -o file.o... (cached) yes
checking whether the g++ linker (/bin/ld -m elf_x86_64) supports shared libraries... yes
checking dynamic linker characteristics... (cached) GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking for windres... no
checking for bash... /bin/bash
checking if dolt supports this host... yes, replacing libtool
checking whether NLS is requested... yes
checking for msgfmt... /home/zhangbin/xlive/vlc/pc/vlc/contrib/x86_64-redhat-linux/bin/msgfmt
checking for gmsgfmt... /home/zhangbin/xlive/vlc/pc/vlc/contrib/x86_64-redhat-linux/bin/msgfmt
checking for xgettext... /home/zhangbin/xlive/vlc/pc/vlc/contrib/x86_64-redhat-linux/bin/xgettext
checking for msgmerge... /home/zhangbin/xlive/vlc/pc/vlc/contrib/x86_64-redhat-linux/bin/msgmerge
checking for ld used by gcc -std=gnu99... /bin/ld -m elf_x86_64
checking if the linker (/bin/ld -m elf_x86_64) is GNU ld... yes
checking for shared library run path origin... done
checking for CFPreferencesCopyAppValue... no
checking for CFLocaleCopyCurrent... no
checking for GNU gettext in libc... yes
checking whether to use NLS... yes
checking where the gettext function comes from... libc
checking for iconv... yes
checking for working iconv... yes
checking for iconv declaration... 
         extern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft);
checking for buggy GNU/libc versions... not present
checking for shared objects suffix... .so
checking whether nanosleep is declared... yes
checking for daemon... yes
checking for fcntl... yes
checking for flock... yes
checking for fstatvfs... yes
checking for fork... yes
checking for getenv... yes
checking for getpwuid_r... yes
checking for isatty... yes
checking for lstat... yes
checking for memalign... yes
checking for mkostemp... yes
checking for mmap... yes
checking for open_memstream... yes
checking for openat... yes
checking for pread... yes
checking for posix_fadvise... yes
checking for posix_madvise... yes
checking for setlocale... yes
checking for stricmp... no
checking for strnicmp... no
checking for strptime... yes
checking for uselocale... yes
checking for pthread_cond_timedwait_monotonic_np... no
checking for pthread_condattr_setclock... no
checking for atof... yes
checking for atoll... yes
checking for dirfd... yes
checking for fdopendir... yes
checking for ffsll... yes
checking for flockfile... yes
checking for fsync... yes
checking for getdelim... yes
checking for getpid... yes
checking for lldiv... yes
checking for nrand48... yes
checking for poll... yes
checking for posix_memalign... yes
checking for recvmsg... yes
checking for rewind... yes
checking for sendmsg... yes
checking for setenv... yes
checking for strcasecmp... yes
checking for strcasestr... yes
checking for strdup... yes
checking for strlcpy... no
checking for strndup... yes
checking for strnlen... yes
checking for strnstr... no
checking for strsep... yes
checking for strtof... yes
checking for strtok_r... yes
checking for strtoll... yes
checking for swab... yes
checking for tdestroy... yes
checking for timegm... yes
checking for timespec_get... yes
checking for strverscmp... yes
checking for gettimeofday... yes
checking for fdatasync... yes
checking whether asprintf is declared... yes
checking whether vasprintf is declared... yes
checking whether gmtime_r is declared... yes
checking whether localtime_r is declared... yes
checking for static_assert in assert.h... yes
checking for working strcoll... yes
checking for accept4... yes
checking for pipe2... yes
checking for eventfd... yes
checking for vmsplice... yes
checking for sched_getaffinity... yes
checking for struct pollfd... yes
checking for struct timespec... yes
checking for library containing connect... none required
checking for library containing inet_pton... none required
checking for if_nameindex... yes
checking for if_nametoindex... yes
checking for socklen_t in sys/socket.h... yes
checking for struct sockaddr_storage... yes
checking for getopt_long... yes
checking for cos in -lm... yes
checking for lrintf in -lm... yes
checking for nanf in -lm... yes
checking for library containing dlsym... -ldl
checking for library containing pthread_rwlock_init... -lpthread
checking for library containing clock_nanosleep... none required
checking arpa/inet.h usability... yes
checking arpa/inet.h presence... yes
checking for arpa/inet.h... yes
checking pthread.h usability... yes
checking pthread.h presence... yes
checking for pthread.h... yes
checking search.h usability... yes
checking search.h presence... yes
checking for search.h... yes
checking sys/shm.h usability... yes
checking sys/shm.h presence... yes
checking for sys/shm.h... yes
checking sys/socket.h usability... yes
checking sys/socket.h presence... yes
checking for sys/socket.h... yes
checking for net/if.h... yes
checking syslog.h usability... yes
checking syslog.h presence... yes
checking for syslog.h... yes
checking netinet/udplite.h usability... no
checking netinet/udplite.h presence... no
checking for netinet/udplite.h... no
checking sys/param.h usability... yes
checking sys/param.h presence... yes
checking for sys/param.h... yes
checking sys/mount.h usability... yes
checking sys/mount.h presence... yes
checking for sys/mount.h... yes
checking getopt.h usability... yes
checking getopt.h presence... yes
checking for getopt.h... yes
checking linux/dccp.h usability... yes
checking linux/dccp.h presence... yes
checking for linux/dccp.h... yes
checking linux/magic.h usability... yes
checking linux/magic.h presence... yes
checking for linux/magic.h... yes
checking mntent.h usability... yes
checking mntent.h presence... yes
checking for mntent.h... yes
checking sys/eventfd.h usability... yes
checking sys/eventfd.h presence... yes
checking for sys/eventfd.h... yes
checking xlocale.h usability... yes
checking xlocale.h presence... yes
checking for xlocale.h... yes
checking for ssize_t... yes
checking for pkg-config... /bin/pkg-config
checking pkg-config is at least version 0.9.0... yes
checking zlib.h usability... yes
checking zlib.h presence... yes
checking for zlib.h... yes
checking for MINIZIP... no
checking unzip.h usability... no
checking unzip.h presence... no
checking for unzip.h... no
checking for IDN... no
checking for DBUS... yes
checking for SYSTEMD... no
configure: WARNING: No package 'libsystemd' found.
checking for ntohl in sys/param.h... no
checking if gcc -std=gnu99 accepts -Wall... yes
checking if gcc -std=gnu99 accepts -Wextra... yes
checking if gcc -std=gnu99 accepts -Wsign-compare... yes
checking if gcc -std=gnu99 accepts -Wundef... yes
checking if gcc -std=gnu99 accepts -Wpointer-arith... yes
checking if gcc -std=gnu99 accepts -Wbad-function-cast... yes
checking if gcc -std=gnu99 accepts -Wwrite-strings... yes
checking if gcc -std=gnu99 accepts -Wmissing-prototypes... yes
checking if gcc -std=gnu99 accepts -Wvolatile-register-var... yes
checking if gcc -std=gnu99 accepts -Werror-implicit-function-declaration... yes
checking if gcc -std=gnu99 accepts -Winit-self... yes
checking if gcc -std=gnu99 accepts -Wlogical-op... yes
checking if gcc -std=gnu99 accepts -Wformat-security... yes
checking if gcc -std=gnu99 accepts -pipe... yes
checking if g++ accepts -Wall... yes
checking if g++ accepts -Wextra... yes
checking if g++ accepts -Wsign-compare... yes
checking if g++ accepts -Wundef... yes
checking if g++ accepts -Wpointer-arith... yes
checking if g++ accepts -Wvolatile-register-var... yes
checking if g++ accepts -Wformat-security... yes
checking valgrind/valgrind.h usability... no
checking valgrind/valgrind.h presence... no
checking for valgrind/valgrind.h... no
checking if gcc -std=gnu99 accepts -fvisibility=hidden... yes
checking if gcc -std=gnu99 accepts -ffast-math... yes
checking if gcc -std=gnu99 accepts -funroll-loops... yes
checking if linker supports -Bsymbolic... -Wl,-Bsymbolic
checking __attribute__ ((aligned ())) support... 64
checking for __attribute__((packed))... yes
checking execinfo.h usability... yes
checking execinfo.h presence... yes
checking for execinfo.h... yes
checking for backtrace... yes
checking if gcc -std=gnu99 groks MMX intrinsics... yes
checking if gcc -std=gnu99 groks MMX inline assembly... yes
checking if gcc -std=gnu99 groks MMX EXT inline assembly... yes
checking if gcc -std=gnu99 groks SSE2 intrinsics... yes
checking if gcc -std=gnu99 groks SSE inline assembly... yes
checking if gcc -std=gnu99 groks SSE2 inline assembly... yes
checking if gcc -std=gnu99 groks SSE3 inline assembly... yes
checking if gcc -std=gnu99 groks SSSE3 inline assembly... yes
checking if gcc -std=gnu99 groks SSE4.1 inline assembly... yes
checking if gcc -std=gnu99 groks SSE4.2 inline assembly... yes
checking if gcc -std=gnu99 groks SSE4A inline assembly... yes
checking if gcc -std=gnu99 groks 3D Now! inline assembly... yes
checking for LUA... no
configure: WARNING: No package 'lua5.2' found, trying lua 5.1 instead
checking for LUA... no
configure: WARNING: No package 'lua5.1' found, trying lua >= 5.1 instead
checking for LUA... no
configure: WARNING: No package 'lua' found, trying manual detection instead
checking lua.h usability... yes
checking lua.h presence... yes
checking for lua.h... yes
checking lauxlib.h usability... yes
checking lauxlib.h presence... yes
checking for lauxlib.h... yes
checking lualib.h usability... yes
checking lualib.h presence... yes
checking for lualib.h... yes
checking for luaL_newstate in -llua5.2 ... no
checking for luaL_newstate in -llua5.1 ... no
checking for luaL_newstate in -llua51 ... no
checking for luaL_newstate in -llua ... yes
checking for luac... luac
checking for ARCHIVE... yes
checking for LIVE555... no
configure: WARNING: No package 'live555' found.
checking for live555 version 1324598400 or later... yes
checking for main in -lliveMedia_pic... no
checking for main in -lliveMedia... yes
checking for DC1394... no
configure: WARNING: Library libdc1394-2 >= 2.1.0 needed for dc1394 was not found
checking for DV1394... no
configure: WARNING: Library libraw1394 >= 2.0.1 libavc1394 >= 0.5.3 needed for dv1394 was not found
checking for LINSYS_SDI... yes
checking for DVDREAD... yes
checking for DVDNAV... yes
checking for dvdnav_stream_cb in dvdnav/dvdnav.h... yes
checking for BLURAY... yes
checking for OPENCV... no
configure: WARNING: Library opencv > 2.0 needed for opencv was not found
checking for SMBCLIENT... no
configure: WARNING: Library smbclient needed for smbclient was not found
checking for DSM... no
configure: WARNING: Library libdsm >= 0.0.7 needed for dsm was not found
checking for SFTP... yes
checking for NFS... yes
checking linux/videodev2.h usability... yes
checking linux/videodev2.h presence... yes
checking for linux/videodev2.h... yes
checking sys/videoio.h usability... no
checking sys/videoio.h presence... no
checking for sys/videoio.h... no
checking DeckLinkAPIDispatch.cpp usability... no
checking DeckLinkAPIDispatch.cpp presence... no
checking for DeckLinkAPIDispatch.cpp... no
configure: WARNING: Blackmagic DeckLink SDI include files not found
checking for cdrom_msf0 in linux/cdrom.h... yes
checking for scsireq in sys/scsiio.h... no
checking for ioc_toc_header in sys/cdio.h... no
checking for LIBCDDB... yes
checking for Linux DVB version 5.1... yes
checking for VNC... no
configure: WARNING: Library libvncclient >= 0.9.9 needed for vnc was not found
checking for FREERDP... no
configure: WARNING: Library freerdp >= 1.0.1 needed for freerdp was not found
checking for ASDCP... no
checking for DVBPSI... yes
checking gme/gme.h usability... yes
checking gme/gme.h presence... yes
checking for gme/gme.h... yes
checking for SID... yes
checking sidplay/builders/resid.h usability... yes
checking sidplay/builders/resid.h presence... yes
checking for sidplay/builders/resid.h... yes
checking for OGG... yes
checking for LIBVORBIS... yes
checking for OGG... yes
checking for SHOUT... yes
checking ebml/EbmlVersion.h usability... yes
checking ebml/EbmlVersion.h presence... yes
checking for ebml/EbmlVersion.h... yes
checking for libebml version >= 1.0.0... yes
checking matroska/KaxVersion.h usability... yes
checking matroska/KaxVersion.h presence... yes
checking for matroska/KaxVersion.h... yes
checking for libmatroska version >= 1.0.0... yes
checking matroska/KaxAttachments.h usability... yes
checking matroska/KaxAttachments.h presence... yes
checking for matroska/KaxAttachments.h... yes
checking for main in -lebml_pic... no
checking for main in -lebml... yes
checking for LIBMODPLUG... yes
checking mpc/mpcdec.h usability... yes
checking mpc/mpcdec.h presence... yes
checking for mpc/mpcdec.h... yes
checking for SHINE... no
configure: WARNING: Library shine >= 3.0.0 needed for shine was not found
checking for libcrystalhd/libcrystalhd_if.h... no
checking mad.h usability... yes
checking mad.h presence... yes
checking for mad.h... yes
checking for mad_bit_init in -lmad... yes
checking for MPG123... yes
checking for libavutil variant... libav
checking for GST_APP... no
configure: WARNING: No package 'gstreamer-app-1.0' found. GStreamer modules will not be built.
checking for AVCODEC... yes
checking libavcodec/avcodec.h usability... yes
checking libavcodec/avcodec.h presence... yes
checking for libavcodec/avcodec.h... yes
checking libavutil/avutil.h usability... yes
checking libavutil/avutil.h presence... yes
checking for libavutil/avutil.h... yes
configure: WARNING: .
checking for LIBVA_DRM... no
configure: WARNING: No package 'libva-drm' found.
checking for LIBVA_X11... no
configure: WARNING: No package 'libva-x11' found.
checking dxgidebug.h usability... no
checking dxgidebug.h presence... no
checking for dxgidebug.h... no
checking for AVFORMAT... yes
checking libavformat/avformat.h usability... yes
checking libavformat/avformat.h presence... yes
checking for libavformat/avformat.h... yes
checking libavformat/avio.h usability... yes
checking libavformat/avio.h presence... yes
checking for libavformat/avio.h... yes
checking for libavcodec/avcodec.h... (cached) yes
checking for libavutil/avutil.h... (cached) yes
checking for SWSCALE... yes
checking libswscale/swscale.h usability... yes
checking libswscale/swscale.h presence... yes
checking for libswscale/swscale.h... yes
checking for libavutil/avutil.h... (cached) yes
checking for POSTPROC... yes
checking postproc/postprocess.h usability... no
checking postproc/postprocess.h presence... no
checking for postproc/postprocess.h... no
checking neaacdec.h usability... yes
checking neaacdec.h presence... yes
checking for neaacdec.h... yes
checking for NeAACDecOpen in -lfaad... yes
checking for VPX... yes
checking for vpx_codec_vp8_dx in -lvpx... yes
checking for vpx_codec_vp9_dx in -lvpx... yes
checking for vpx_codec_vp8_cx in -lvpx... yes
checking for vpx_codec_vp9_cx in -lvpx... yes
checking for TWOLAME... yes
checking a52dec/a52.h usability... yes
checking a52dec/a52.h presence... yes
checking for a52dec/a52.h... yes
checking for a52_free in -la52... yes
checking for DCA... yes
checking for FLAC... yes
checking for LIBMPEG2... yes
checking for VORBIS... yes
checking for SPEEX... yes
checking for SPEEXDSP... yes
checking for OPUS... yes
checking for THEORA... yes
checking for SCHROEDINGER... yes
checking png.h usability... yes
checking png.h presence... yes
checking for png.h... yes
checking for png_set_rows in -lpng... yes
checking jpeglib.h usability... yes
checking jpeglib.h presence... yes
checking for jpeglib.h... yes
checking libbpg.h usability... no
checking libbpg.h presence... no
checking for libbpg.h... no
checking for X262... no
checking for X265... yes
checking for X26410B... no
checking for X264... yes
checking for MFX... no
configure: WARNING: Library libmfx needed for mfx was not found
checking for FLUIDSYNTH... yes
checking for ZVBI... yes
checking for LIBASS... yes
checking fontconfig/fontconfig.h usability... yes
checking fontconfig/fontconfig.h presence... yes
checking for fontconfig/fontconfig.h... yes
checking for ARIBB24... yes
checking for ARIBB25... no
configure: WARNING: Library aribb25 >= 0.2.6 needed for aribb25 was not found
checking for KATE... yes
checking for TIGER... no
checking for EGL... yes
checking for GL... yes
checking for X... libraries , headers 
checking for gethostbyname... yes
checking for connect... yes
checking for remove... yes
checking for shmat... yes
checking for IceConnectionNumber in -lICE... no
checking X11/Xlib.h usability... yes
checking X11/Xlib.h presence... yes
checking for X11/Xlib.h... yes
checking for XCB... yes
checking for XCB_SHM... yes
checking for XCB_COMPOSITE... yes
checking for XPROTO... yes
checking for XCB_XV... yes
checking for XCB_RANDR... yes
checking for XCB_KEYSYMS... no
configure: WARNING: No package 'xcb-keysyms' found. Hotkeys will not work.
checking for VDPAU... no
checking for the Wayland scanner... wayland-scanner
checking for WAYLAND_CLIENT... no
checking for WAYLAND_EGL... no
checking for SDL... yes
checking for SDL_IMAGE... yes
checking for FREETYPE... yes
checking for fontconfig/fontconfig.h... (cached) yes
checking for FRIBIDI... yes
checking for HARFBUZZ... yes
checking for ISpObjectToken... no
configure: WARNING: sapi.h not found. Text to Speech renderer for Windows disabled
checking for SVG... no
configure: WARNING: Library librsvg-2.0 >= 2.9.0 needed for svg was not found
checking for SVGDEC... no
configure: WARNING: Library librsvg-2.0 >= 2.9.0 cairo >= 1.13.1 needed for svgdec was not found
checking linux/fb.h usability... yes
checking linux/fb.h presence... yes
checking for linux/fb.h... yes
checking for CACA... yes
checking kva.h usability... no
checking kva.h presence... no
checking for kva.h... no
checking interface/mmal/mmal.h usability... no
checking interface/mmal/mmal.h presence... no
checking for interface/mmal/mmal.h... no
configure: WARNING: Cannot find development headers for mmal...
checking for PULSE... yes
checking for ALSA... yes
checking sndio.h usability... no
checking sndio.h presence... no
checking for sndio.h... no
checking audioclient.h usability... no
checking audioclient.h presence... no
checking for audioclient.h... no
checking for JACK... no
configure: WARNING: No package 'jack' found, trying jack1 instead
checking for JACK... no
configure: WARNING: No package 'jack' found
No package 'jack' found.
checking for SAMPLERATE... yes
checking for SOXR... no
configure: WARNING: Library soxr >= 0.1.2 needed for soxr was not found
checking kai.h usability... no
checking kai.h presence... no
checking for kai.h... no
checking for protoc... protoc
checking for CHROMECAST... yes
checking for QT... yes  找到了qt啊
checking for QTX11... no
configure: WARNING: Not building Qt Interface with X11 helpers.
checking for moc-qt5... /usr/lib64/qt5/bin/moc-qt5
checking for rcc-qt5... /usr/lib64/qt5/bin/rcc-qt5
checking for uic-qt5... /usr/lib64/qt5/bin/uic-qt5
checking for XPM... no
checking for XINERAMA... no
checking for XEXT... yes
configure: WARNING: Skins2 interface disabled due to missing dependencies.
checking VideoToolbox/VideoToolbox.h usability... no
checking VideoToolbox/VideoToolbox.h presence... no
checking for VideoToolbox/VideoToolbox.h... no
checking for NCURSES... yes
checking for GOOM... yes
checking for PROJECTM... no
configure: WARNING: No package 'libprojectM' found.
checking for VSXU... no
configure: WARNING: No package 'libvsxu' found.
checking for AVAHI... no
configure: WARNING: Library avahi-client >= 0.6 needed for avahi was not found
checking for UDEV... no
configure: WARNING: Library libudev >= 142 needed for udev was not found
checking for MTP... no
configure: WARNING: Library libmtp >= 1.0.0 needed for mtp was not found
checking for UPNP... yes
checking for MICRODNS... no
configure: WARNING: Library microdns needed for microdns was not found
checking for LIBXML2... yes
checking for GNUTLS... yes
checking for TAGLIB... yes
checking for SECRET... no
configure: WARNING: Library libsecret-1 needed for secret was not found
./configure: line 54237: kde4-config: command not found
checking kwallet.h usability... no
checking kwallet.h presence... no
checking for kwallet.h... no
checking for NOTIFY... no
configure: WARNING: Library libnotify gtk+-2.0 needed for notify was not found
checking whether byte ordering is bigendian... no
./configure: line 54895: kde4-config: command not found
checking that generated files are newer than configure... done
configure: creating ./config.status
config.status: creating Makefile
config.status: creating doc/Makefile
config.status: creating modules/Makefile
config.status: creating m4/Makefile
config.status: creating po/Makefile.in
config.status: creating share/Makefile
config.status: creating compat/Makefile
config.status: creating src/Makefile
config.status: creating lib/Makefile
config.status: creating bin/Makefile
config.status: creating test/Makefile
config.status: creating modules/gui/macosx/Makefile
config.status: creating modules/gui/qt4/Makefile
config.status: creating modules/gui/skins2/Makefile
config.status: creating modules/hw/mmal/Makefile
config.status: creating config.h
config.status: config.h is unchanged
config.status: executing depfiles commands
config.status: executing libtool commands
config.status: executing po-directories commands
config.status: creating po/POTFILES
config.status: creating po/Makefile

libvlc configuration
--------------------
version               : 3.0.0-git
system                : linux
architecture          : x86_64 mmx sse sse2
optimizations         : yes
vlc aliases           : cvlc rvlc qvlc nvlc

To build vlc and its plugins, type `make', or `./compile' if you like nice colors.
[root@c7 vlc]# 

```

# 10 编译qvlc涉及到的模块

```
[root@c7 vlc]# make
make  all-recursive
make[1]: 进入目录“/home/zhangbin/xlive/vlc/pc/vlc”
Making all in compat
make[2]: 进入目录“/home/zhangbin/xlive/vlc/pc/vlc/compat”
make  all-am
make[3]: 进入目录“/home/zhangbin/xlive/vlc/pc/vlc/compat”
make[3]: 对“all-am”无需做任何事。
make[3]: 离开目录“/home/zhangbin/xlive/vlc/pc/vlc/compat”
make[2]: 离开目录“/home/zhangbin/xlive/vlc/pc/vlc/compat”
Making all in doc
make[2]: 进入目录“/home/zhangbin/xlive/vlc/pc/vlc/doc”
make[2]: 对“all”无需做任何事。
make[2]: 离开目录“/home/zhangbin/xlive/vlc/pc/vlc/doc”
Making all in po
make[2]: 进入目录“/home/zhangbin/xlive/vlc/pc/vlc/po”
make[2]: 对“all”无需做任何事。
make[2]: 离开目录“/home/zhangbin/xlive/vlc/pc/vlc/po”
Making all in share
make[2]: 进入目录“/home/zhangbin/xlive/vlc/pc/vlc/share”
  GEN      vlc.desktop
make[2]: 离开目录“/home/zhangbin/xlive/vlc/pc/vlc/share”
Making all in src
make[2]: 进入目录“/home/zhangbin/xlive/vlc/pc/vlc/src”
  GEN      stamp-revision
make  all-am
make[3]: 进入目录“/home/zhangbin/xlive/vlc/pc/vlc/src”
make[3]: 对“all-am”无需做任何事。
make[3]: 离开目录“/home/zhangbin/xlive/vlc/pc/vlc/src”
make[2]: 离开目录“/home/zhangbin/xlive/vlc/pc/vlc/src”
Making all in modules
make[2]: 进入目录“/home/zhangbin/xlive/vlc/pc/vlc/modules”
make  all-recursive
make[3]: 进入目录“/home/zhangbin/xlive/vlc/pc/vlc/modules”
Making all in .
make[4]: 进入目录“/home/zhangbin/xlive/vlc/pc/vlc/modules”
  CC       video_output/libegl_x11_plugin_la-egl.lo
  CCLD     libegl_x11_plugin.la
make[4]: 离开目录“/home/zhangbin/xlive/vlc/pc/vlc/modules”
Making all in gui/macosx
make[4]: 进入目录“/home/zhangbin/xlive/vlc/pc/vlc/modules/gui/macosx”
make  all-am
make[5]: 进入目录“/home/zhangbin/xlive/vlc/pc/vlc/modules/gui/macosx”
make[5]: 对“all-am”无需做任何事。
make[5]: 离开目录“/home/zhangbin/xlive/vlc/pc/vlc/modules/gui/macosx”
make[4]: 离开目录“/home/zhangbin/xlive/vlc/pc/vlc/modules/gui/macosx”
Making all in gui/qt4
make[4]: 进入目录“/home/zhangbin/xlive/vlc/pc/vlc/modules/gui/qt4”
  MOC    main_interface.moc.cpp
  MOC    menus.moc.cpp
  MOC    dialogs_provider.moc.cpp
  MOC    input_manager.moc.cpp
  MOC    actions_manager.moc.cpp
  MOC    extensions_manager.moc.cpp
  MOC    managers/addons_manager.moc.cpp
  MOC    recents.moc.cpp
  MOC    adapters/seekpoints.moc.cpp
  MOC    adapters/chromaprint.moc.cpp
  MOC    adapters/variables.moc.cpp
  MOC    dialogs/playlist.moc.cpp
  MOC    dialogs/bookmarks.moc.cpp
  MOC    dialogs/mediainfo.moc.cpp
  MOC    dialogs/extended.moc.cpp
  MOC    dialogs/messages.moc.cpp
  MOC    dialogs/epg.moc.cpp
  MOC    dialogs/errors.moc.cpp
  MOC    dialogs/external.moc.cpp
  MOC    dialogs/plugins.moc.cpp
  MOC    dialogs/preferences.moc.cpp
  MOC    dialogs/sout.moc.cpp
  MOC    dialogs/convert.moc.cpp
  MOC    dialogs/help.moc.cpp
  MOC    dialogs/gototime.moc.cpp
  MOC    dialogs/toolbar.moc.cpp
  MOC    dialogs/open.moc.cpp
  MOC    dialogs/openurl.moc.cpp
  MOC    dialogs/podcast_configuration.moc.cpp
  MOC    dialogs/vlm.moc.cpp
  MOC    dialogs/firstrun.moc.cpp
  MOC    dialogs/extensions.moc.cpp
  MOC    dialogs/fingerprintdialog.moc.cpp
  MOC    components/extended_panels.moc.cpp
  MOC    components/info_panels.moc.cpp
  MOC    components/info_widgets.moc.cpp
  MOC    components/preferences_widgets.moc.cpp
  MOC    components/complete_preferences.moc.cpp
  MOC    components/simple_preferences.moc.cpp
  MOC    components/open_panels.moc.cpp
  MOC    components/interface_widgets.moc.cpp
  MOC    components/controller.moc.cpp
  MOC    components/controller_widget.moc.cpp
  MOC    components/epg/EPGChannels.moc.cpp
  MOC    components/epg/EPGRuler.moc.cpp
  MOC    components/epg/EPGView.moc.cpp
  MOC    components/epg/EPGWidget.moc.cpp
  MOC    components/playlist/views.moc.cpp
  MOC    components/playlist/vlc_model.moc.cpp
  MOC    components/playlist/playlist_model.moc.cpp
  MOC    components/playlist/playlist.moc.cpp
  MOC    components/playlist/standardpanel.moc.cpp
  MOC    components/playlist/selector.moc.cpp
  MOC    components/sout/profile_selector.moc.cpp
  MOC    components/sout/sout_widgets.moc.cpp
  MOC    util/animators.moc.cpp
  MOC    util/input_slider.moc.cpp
  MOC    util/timetooltip.moc.cpp
  MOC    util/customwidgets.moc.cpp
  MOC    util/searchlineedit.moc.cpp
  MOC    util/qmenuview.moc.cpp
  MOC    util/qvlcapp.moc.cpp
  MOC    util/pictureflow.moc.cpp
  MOC    util/validators.moc.cpp
  MOC    util/buttons/RoundButton.moc.cpp
  MOC    util/buttons/DeckButtonsLayout.moc.cpp
  MOC    util/buttons/BrowseButton.moc.cpp
  MOC    styles/seekstyle.moc.cpp
  UIC    ui/equalizer.h
  UIC    ui/video_effects.h
  UIC    ui/open_file.h
  UIC    ui/open_disk.h
  UIC    ui/open_net.h
  UIC    ui/open_capture.h
  UIC    ui/open.h
  UIC    ui/vlm.h
  UIC    ui/podcast_configuration.h
  UIC    ui/profiles.h
  UIC    ui/sprefs_audio.h
  UIC    ui/sprefs_input.h
  UIC    ui/sprefs_interface.h
  UIC    ui/sprefs_subtitles.h
  UIC    ui/sprefs_video.h
  UIC    ui/streampanel.h
  UIC    ui/messages_panel.h
  UIC    ui/about.h
  UIC    ui/update.h
  UIC    ui/fingerprintdialog.h
  UIC    ui/sout.h
  GEN      resources.cpp
make  all-am
make[5]: 进入目录“/home/zhangbin/xlive/vlc/pc/vlc/modules/gui/qt4”
  CXX      libqt4_plugin_la-qt4.lo
  CXX      libqt4_plugin_la-menus.lo
  CXX      libqt4_plugin_la-main_interface.lo
  CXX      libqt4_plugin_la-dialogs_provider.lo
dialogs_provider.cpp: 在成员函数‘void DialogsProvider::SDMenuAction(const QString&)’中:
dialogs_provider.cpp:825:10: 警告：不建议使用‘bool playlist_IsServicesDiscoveryLoaded(playlist_t*, const char*)’(声明于 ../../../include/vlc_playlist.h:337) [-Wdeprecated-declarations]
     if( !playlist_IsServicesDiscoveryLoaded( THEPL, qtu( data ) ) )
          ^
dialogs_provider.cpp:825:65: 警告：不建议使用‘bool playlist_IsServicesDiscoveryLoaded(playlist_t*, const char*)’(声明于 ../../../include/vlc_playlist.h:337) [-Wdeprecated-declarations]
     if( !playlist_IsServicesDiscoveryLoaded( THEPL, qtu( data ) ) )
                                                                 ^
  CXX      libqt4_plugin_la-input_manager.lo
  CXX      libqt4_plugin_la-actions_manager.lo
  CXX      libqt4_plugin_la-extensions_manager.lo
  CXX      managers/libqt4_plugin_la-addons_manager.lo
  CXX      libqt4_plugin_la-recents.lo
  CXX      adapters/libqt4_plugin_la-seekpoints.lo
  CXX      adapters/libqt4_plugin_la-chromaprint.lo
  CXX      adapters/libqt4_plugin_la-variables.lo
  CXX      dialogs/libqt4_plugin_la-playlist.lo
  CXX      dialogs/libqt4_plugin_la-bookmarks.lo
  CXX      dialogs/libqt4_plugin_la-preferences.lo
  CXX      dialogs/libqt4_plugin_la-mediainfo.lo
  CXX      dialogs/libqt4_plugin_la-epg.lo
  CXX      dialogs/libqt4_plugin_la-extended.lo
  CXX      dialogs/libqt4_plugin_la-messages.lo
  CXX      dialogs/libqt4_plugin_la-errors.lo
  CXX      dialogs/libqt4_plugin_la-external.lo
  CXX      dialogs/libqt4_plugin_la-plugins.lo
  CXX      dialogs/libqt4_plugin_la-sout.lo
  CXX      dialogs/libqt4_plugin_la-convert.lo
  CXX      dialogs/libqt4_plugin_la-help.lo
  CXX      dialogs/libqt4_plugin_la-gototime.lo
  CXX      dialogs/libqt4_plugin_la-toolbar.lo
  CXX      dialogs/libqt4_plugin_la-open.lo
  CXX      dialogs/libqt4_plugin_la-openurl.lo
  CXX      dialogs/libqt4_plugin_la-vlm.lo
  CXX      dialogs/libqt4_plugin_la-firstrun.lo
dialogs/firstrun.cpp:53:2: 警告：#warning FIXME [-Wcpp]
 #warning FIXME
  ^
  CXX      dialogs/libqt4_plugin_la-podcast_configuration.lo
dialogs/podcast_configuration.cpp: 在成员函数‘virtual void PodcastConfigDialog::accept()’中:
dialogs/podcast_configuration.cpp:75:9: 警告：不建议使用‘bool playlist_IsServicesDiscoveryLoaded(playlist_t*, const char*)’(声明于 ../../../include/vlc_playlist.h:337) [-Wdeprecated-declarations]
     if( playlist_IsServicesDiscoveryLoaded( THEPL, "podcast" ) )
         ^
dialogs/podcast_configuration.cpp:75:62: 警告：不建议使用‘bool playlist_IsServicesDiscoveryLoaded(playlist_t*, const char*)’(声明于 ../../../include/vlc_playlist.h:337) [-Wdeprecated-declarations]
     if( playlist_IsServicesDiscoveryLoaded( THEPL, "podcast" ) )
                                                              ^
  CXX      dialogs/libqt4_plugin_la-extensions.lo
  CXX      dialogs/libqt4_plugin_la-fingerprintdialog.lo
  CXX      components/libqt4_plugin_la-extended_panels.lo
In file included from ../../../include/vlc_common.h:894:0,
                 from ./components/extended_panels.hpp:32,
                 from components/extended_panels.cpp:43:
components/extended_panels.cpp: 在函数‘void setup_vfilter(intf_thread_t*, const char*, QWidget*)’中:
../../../include/vlc_objects.h:61:5: 警告：不建议使用‘vlc_object_t* vlc_object_find_name(vlc_object_t*, const char*)’(声明于 ../../../include/vlc_objects.h:50) [-Wdeprecated-declarations]
     vlc_object_find_name( VLC_OBJECT(a),b)
     ^
components/extended_panels.cpp:84:9: 附注：in expansion of macro ‘vlc_object_find_name’
         vlc_object_find_name( p_intf->p_libvlc, psz_name );
         ^
../../../include/vlc_objects.h:61:42: 警告：不建议使用‘vlc_object_t* vlc_object_find_name(vlc_object_t*, const char*)’(声明于 ../../../include/vlc_objects.h:50) [-Wdeprecated-declarations]
     vlc_object_find_name( VLC_OBJECT(a),b)
                                          ^
components/extended_panels.cpp:84:9: 附注：in expansion of macro ‘vlc_object_find_name’
         vlc_object_find_name( p_intf->p_libvlc, psz_name );
         ^
components/extended_panels.cpp: 在成员函数‘void ExtVideo::setWidgetValue(QObject*)’中:
../../../include/vlc_objects.h:61:5: 警告：不建议使用‘vlc_object_t* vlc_object_find_name(vlc_object_t*, const char*)’(声明于 ../../../include/vlc_objects.h:50) [-Wdeprecated-declarations]
     vlc_object_find_name( VLC_OBJECT(a),b)
     ^
components/extended_panels.cpp:484:9: 附注：in expansion of macro ‘vlc_object_find_name’
         vlc_object_find_name( p_intf->p_libvlc, qtu( module ) );
         ^
../../../include/vlc_objects.h:61:42: 警告：不建议使用‘vlc_object_t* vlc_object_find_name(vlc_object_t*, const char*)’(声明于 ../../../include/vlc_objects.h:50) [-Wdeprecated-declarations]
     vlc_object_find_name( VLC_OBJECT(a),b)
                                          ^
components/extended_panels.cpp:484:9: 附注：in expansion of macro ‘vlc_object_find_name’
         vlc_object_find_name( p_intf->p_libvlc, qtu( module ) );
         ^
components/extended_panels.cpp: 在静态成员函数‘static void ExtVideo::setFilterOption(intf_thread_t*, const char*, const char*, int, double, QString)’中:
../../../include/vlc_objects.h:61:5: 警告：不建议使用‘vlc_object_t* vlc_object_find_name(vlc_object_t*, const char*)’(声明于 ../../../include/vlc_objects.h:50) [-Wdeprecated-declarations]
     vlc_object_find_name( VLC_OBJECT(a),b)
     ^
components/extended_panels.cpp:571:45: 附注：in expansion of macro ‘vlc_object_find_name’
     vlc_object_t *p_obj = ( vlc_object_t * )vlc_object_find_name( p_intf->p_libvlc, psz_module );
                                             ^
../../../include/vlc_objects.h:61:42: 警告：不建议使用‘vlc_object_t* vlc_object_find_name(vlc_object_t*, const char*)’(声明于 ../../../include/vlc_objects.h:50) [-Wdeprecated-declarations]
     vlc_object_find_name( VLC_OBJECT(a),b)
                                          ^
components/extended_panels.cpp:571:45: 附注：in expansion of macro ‘vlc_object_find_name’
     vlc_object_t *p_obj = ( vlc_object_t * )vlc_object_find_name( p_intf->p_libvlc, psz_module );
                                             ^
components/extended_panels.cpp: 在成员函数‘void ExtV4l2::Refresh()’中:
../../../include/vlc_objects.h:61:5: 警告：不建议使用‘vlc_object_t* vlc_object_find_name(vlc_object_t*, const char*)’(声明于 ../../../include/vlc_objects.h:50) [-Wdeprecated-declarations]
     vlc_object_find_name( VLC_OBJECT(a),b)
     ^
components/extended_panels.cpp:736:42: 附注：in expansion of macro ‘vlc_object_find_name’
     vlc_object_t *p_obj = (vlc_object_t*)vlc_object_find_name( THEPL, "v4l2" );
                                          ^
../../../include/vlc_objects.h:61:42: 警告：不建议使用‘vlc_object_t* vlc_object_find_name(vlc_object_t*, const char*)’(声明于 ../../../include/vlc_objects.h:50) [-Wdeprecated-declarations]
     vlc_object_find_name( VLC_OBJECT(a),b)
                                          ^
components/extended_panels.cpp:736:42: 附注：in expansion of macro ‘vlc_object_find_name’
     vlc_object_t *p_obj = (vlc_object_t*)vlc_object_find_name( THEPL, "v4l2" );
                                          ^
components/extended_panels.cpp: 在成员函数‘void ExtV4l2::ValueChange(int)’中:
../../../include/vlc_objects.h:61:5: 警告：不建议使用‘vlc_object_t* vlc_object_find_name(vlc_object_t*, const char*)’(声明于 ../../../include/vlc_objects.h:50) [-Wdeprecated-declarations]
     vlc_object_find_name( VLC_OBJECT(a),b)
     ^
components/extended_panels.cpp:899:42: 附注：in expansion of macro ‘vlc_object_find_name’
     vlc_object_t *p_obj = (vlc_object_t*)vlc_object_find_name( THEPL, "v4l2" );
                                          ^
../../../include/vlc_objects.h:61:42: 警告：不建议使用‘vlc_object_t* vlc_object_find_name(vlc_object_t*, const char*)’(声明于 ../../../include/vlc_objects.h:50) [-Wdeprecated-declarations]
     vlc_object_find_name( VLC_OBJECT(a),b)
                                          ^
components/extended_panels.cpp:899:42: 附注：in expansion of macro ‘vlc_object_find_name’
     vlc_object_t *p_obj = (vlc_object_t*)vlc_object_find_name( THEPL, "v4l2" );
                                          ^
components/extended_panels.cpp: 在成员函数‘void SyncControls::subsdelaySetFactor(double)’中:
../../../include/vlc_objects.h:61:5: 警告：不建议使用‘vlc_object_t* vlc_object_find_name(vlc_object_t*, const char*)’(声明于 ../../../include/vlc_objects.h:50) [-Wdeprecated-declarations]
     vlc_object_find_name( VLC_OBJECT(a),b)
     ^
components/extended_panels.cpp:1654:46: 附注：in expansion of macro ‘vlc_object_find_name’
     vlc_object_t *p_obj = ( vlc_object_t * ) vlc_object_find_name( p_intf->p_libvlc, "subsdelay" );
                                              ^
../../../include/vlc_objects.h:61:42: 警告：不建议使用‘vlc_object_t* vlc_object_find_name(vlc_object_t*, const char*)’(声明于 ../../../include/vlc_objects.h:50) [-Wdeprecated-declarations]
     vlc_object_find_name( VLC_OBJECT(a),b)
                                          ^
components/extended_panels.cpp:1654:46: 附注：in expansion of macro ‘vlc_object_find_name’
     vlc_object_t *p_obj = ( vlc_object_t * ) vlc_object_find_name( p_intf->p_libvlc, "subsdelay" );
                                              ^
  CXX      components/libqt4_plugin_la-info_panels.lo
  CXX      components/libqt4_plugin_la-info_widgets.lo
  CXX      components/libqt4_plugin_la-preferences_widgets.lo
  CXX      components/libqt4_plugin_la-complete_preferences.lo
  CXX      components/libqt4_plugin_la-simple_preferences.lo
  CXX      components/libqt4_plugin_la-open_panels.lo
  CXX      components/libqt4_plugin_la-interface_widgets.lo
  CXX      components/libqt4_plugin_la-controller.lo
  CXX      components/libqt4_plugin_la-controller_widget.lo
  CXX      components/epg/libqt4_plugin_la-EPGChannels.lo
  CXX      components/epg/libqt4_plugin_la-EPGItem.lo
  CXX      components/epg/libqt4_plugin_la-EPGRuler.lo
  CXX      components/epg/libqt4_plugin_la-EPGView.lo
  CXX      components/epg/libqt4_plugin_la-EPGWidget.lo
  CXX      components/playlist/libqt4_plugin_la-views.lo
  CXX      components/playlist/libqt4_plugin_la-vlc_model.lo
  CXX      components/playlist/libqt4_plugin_la-playlist_model.lo
  CXX      components/playlist/libqt4_plugin_la-playlist_item.lo
  CXX      components/playlist/libqt4_plugin_la-standardpanel.lo
  CXX      components/playlist/libqt4_plugin_la-playlist.lo
  CXX      components/playlist/libqt4_plugin_la-selector.lo
components/playlist/selector.cpp: 在成员函数‘void PLSelector::setSource(QTreeWidgetItem*)’中:
components/playlist/selector.cpp:362:21: 警告：不建议使用‘bool playlist_IsServicesDiscoveryLoaded(playlist_t*, const char*)’(声明于 ../../../include/vlc_playlist.h:337) [-Wdeprecated-declarations]
         sd_loaded = playlist_IsServicesDiscoveryLoaded( THEPL, qtu( qs ) );
                     ^
components/playlist/selector.cpp:362:74: 警告：不建议使用‘bool playlist_IsServicesDiscoveryLoaded(playlist_t*, const char*)’(声明于 ../../../include/vlc_playlist.h:337) [-Wdeprecated-declarations]
         sd_loaded = playlist_IsServicesDiscoveryLoaded( THEPL, qtu( qs ) );
                                                                          ^
  CXX      components/sout/libqt4_plugin_la-profile_selector.lo
  CXX      components/sout/libqt4_plugin_la-sout_widgets.lo
  CXX      util/libqt4_plugin_la-animators.lo
  CXX      util/libqt4_plugin_la-input_slider.lo
  CXX      util/libqt4_plugin_la-timetooltip.lo
  CXX      util/libqt4_plugin_la-customwidgets.lo
  CXX      util/libqt4_plugin_la-searchlineedit.lo
  CXX      util/libqt4_plugin_la-registry.lo
  CXX      util/libqt4_plugin_la-qmenuview.lo
  CXX      util/libqt4_plugin_la-qt_dirs.lo
  CXX      util/libqt4_plugin_la-pictureflow.lo
  CXX      util/libqt4_plugin_la-validators.lo
  CXX      util/buttons/libqt4_plugin_la-BrowseButton.lo
  CXX      util/buttons/libqt4_plugin_la-DeckButtonsLayout.lo
  CXX      util/buttons/libqt4_plugin_la-RoundButton.lo
  CXX      styles/libqt4_plugin_la-seekstyle.lo
  CXX      libqt4_plugin_la-main_interface.moc.lo
  CXX      libqt4_plugin_la-menus.moc.lo
  CXX      libqt4_plugin_la-dialogs_provider.moc.lo
  CXX      libqt4_plugin_la-input_manager.moc.lo
  CXX      libqt4_plugin_la-actions_manager.moc.lo
  CXX      libqt4_plugin_la-extensions_manager.moc.lo
  CXX      managers/libqt4_plugin_la-addons_manager.moc.lo
  CXX      libqt4_plugin_la-recents.moc.lo
  CXX      adapters/libqt4_plugin_la-seekpoints.moc.lo
  CXX      adapters/libqt4_plugin_la-chromaprint.moc.lo
  CXX      adapters/libqt4_plugin_la-variables.moc.lo
  CXX      dialogs/libqt4_plugin_la-playlist.moc.lo
  CXX      dialogs/libqt4_plugin_la-bookmarks.moc.lo
  CXX      dialogs/libqt4_plugin_la-mediainfo.moc.lo
  CXX      dialogs/libqt4_plugin_la-extended.moc.lo
  CXX      dialogs/libqt4_plugin_la-messages.moc.lo
  CXX      dialogs/libqt4_plugin_la-epg.moc.lo
  CXX      dialogs/libqt4_plugin_la-errors.moc.lo
  CXX      dialogs/libqt4_plugin_la-external.moc.lo
  CXX      dialogs/libqt4_plugin_la-plugins.moc.lo
  CXX      dialogs/libqt4_plugin_la-preferences.moc.lo
  CXX      dialogs/libqt4_plugin_la-sout.moc.lo
  CXX      dialogs/libqt4_plugin_la-convert.moc.lo
  CXX      dialogs/libqt4_plugin_la-help.moc.lo
  CXX      dialogs/libqt4_plugin_la-gototime.moc.lo
  CXX      dialogs/libqt4_plugin_la-toolbar.moc.lo
  CXX      dialogs/libqt4_plugin_la-open.moc.lo
  CXX      dialogs/libqt4_plugin_la-openurl.moc.lo
  CXX      dialogs/libqt4_plugin_la-podcast_configuration.moc.lo
  CXX      dialogs/libqt4_plugin_la-vlm.moc.lo
  CXX      dialogs/libqt4_plugin_la-firstrun.moc.lo
  CXX      dialogs/libqt4_plugin_la-extensions.moc.lo
  CXX      dialogs/libqt4_plugin_la-fingerprintdialog.moc.lo
  CXX      components/libqt4_plugin_la-extended_panels.moc.lo
  CXX      components/libqt4_plugin_la-info_panels.moc.lo
  CXX      components/libqt4_plugin_la-info_widgets.moc.lo
  CXX      components/libqt4_plugin_la-preferences_widgets.moc.lo
  CXX      components/libqt4_plugin_la-complete_preferences.moc.lo
  CXX      components/libqt4_plugin_la-simple_preferences.moc.lo
  CXX      components/libqt4_plugin_la-open_panels.moc.lo
  CXX      components/libqt4_plugin_la-interface_widgets.moc.lo
  CXX      components/libqt4_plugin_la-controller.moc.lo
  CXX      components/libqt4_plugin_la-controller_widget.moc.lo
  CXX      components/epg/libqt4_plugin_la-EPGChannels.moc.lo
  CXX      components/epg/libqt4_plugin_la-EPGRuler.moc.lo
  CXX      components/epg/libqt4_plugin_la-EPGView.moc.lo
  CXX      components/epg/libqt4_plugin_la-EPGWidget.moc.lo
  CXX      components/playlist/libqt4_plugin_la-views.moc.lo
  CXX      components/playlist/libqt4_plugin_la-vlc_model.moc.lo
  CXX      components/playlist/libqt4_plugin_la-playlist_model.moc.lo
  CXX      components/playlist/libqt4_plugin_la-playlist.moc.lo
  CXX      components/playlist/libqt4_plugin_la-standardpanel.moc.lo
  CXX      components/playlist/libqt4_plugin_la-selector.moc.lo
  CXX      components/sout/libqt4_plugin_la-profile_selector.moc.lo
  CXX      components/sout/libqt4_plugin_la-sout_widgets.moc.lo
  CXX      util/libqt4_plugin_la-animators.moc.lo
  CXX      util/libqt4_plugin_la-input_slider.moc.lo
  CXX      util/libqt4_plugin_la-timetooltip.moc.lo
  CXX      util/libqt4_plugin_la-customwidgets.moc.lo
  CXX      util/libqt4_plugin_la-searchlineedit.moc.lo
  CXX      util/libqt4_plugin_la-qmenuview.moc.lo
  CXX      util/libqt4_plugin_la-qvlcapp.moc.lo
  CXX      util/libqt4_plugin_la-pictureflow.moc.lo
  CXX      util/libqt4_plugin_la-validators.moc.lo
  CXX      util/buttons/libqt4_plugin_la-RoundButton.moc.lo
  CXX      util/buttons/libqt4_plugin_la-DeckButtonsLayout.moc.lo
  CXX      util/buttons/libqt4_plugin_la-BrowseButton.moc.lo
  CXX      styles/libqt4_plugin_la-seekstyle.moc.lo
  CXX      libqt4_plugin_la-resources.lo
  CXXLD    libqt4_plugin.la
make[5]: 离开目录“/home/zhangbin/xlive/vlc/pc/vlc/modules/gui/qt4”
make[4]: 离开目录“/home/zhangbin/xlive/vlc/pc/vlc/modules/gui/qt4”
make[3]: 离开目录“/home/zhangbin/xlive/vlc/pc/vlc/modules”
make[2]: 离开目录“/home/zhangbin/xlive/vlc/pc/vlc/modules”
Making all in lib
make[2]: 进入目录“/home/zhangbin/xlive/vlc/pc/vlc/lib”
  GEN      ../include/vlc/libvlc_version.h
config.status: creating src/../include/vlc/libvlc_version.h
make  all-am
make[3]: 进入目录“/home/zhangbin/xlive/vlc/pc/vlc/lib”
make[3]: 对“all-am”无需做任何事。
make[3]: 离开目录“/home/zhangbin/xlive/vlc/pc/vlc/lib”
make[2]: 离开目录“/home/zhangbin/xlive/vlc/pc/vlc/lib”
Making all in bin
make[2]: 进入目录“/home/zhangbin/xlive/vlc/pc/vlc/bin”
  GEN      ../modules/plugins.dat
make[2]: 离开目录“/home/zhangbin/xlive/vlc/pc/vlc/bin”
Making all in test
make[2]: 进入目录“/home/zhangbin/xlive/vlc/pc/vlc/test”
make[2]: 对“all”无需做任何事。
make[2]: 离开目录“/home/zhangbin/xlive/vlc/pc/vlc/test”
make[2]: 进入目录“/home/zhangbin/xlive/vlc/pc/vlc”
  GEN      cvlc
  GEN      rvlc
  GEN      qvlc
  GEN      nvlc
make[2]: 离开目录“/home/zhangbin/xlive/vlc/pc/vlc”
make[1]: 离开目录“/home/zhangbin/xlive/vlc/pc/vlc”
[root@c7 vlc]# 

```


