title: 搭建hexo博客
---

# github pages的hexo博客

标签（空格分隔）： 未分类

---

>学习的热情总是一阵一阵的
>非常想搞懂android的编解码和图形系统，跑了下VLC和MediaCodec的app，发现硬解码在Nuf的板子上不行啊。顺藤摸瓜，感觉有必要记一笔。

## 1.commshare.github.io
## 2.windows上安装nodejs，这个是hexo的后台，会找到npm命令。
## 3.安装hexo
如果直接右键打开git bash，貌似找不到刚刚安装的npm，我只好用所有程序里头的git bash了。
[参考这个](http://wsgzao.github.io/post/hexo-guide/)

    npm install hexo-cli -g
    npm install hexo --save

    #如果命令无法运行，可以尝试更换taobao的npm源
    npm install -g cnpm --registry=https://registry.npm.taobao.org

## 4. hexo 测试
[参考](http://www.cnblogs.com/liulangmao/p/4323064.html),首先在磁盘
建立一个目录，叫做hexo吧，然后在此目录下，
``` bash
    hexo init

    npm install
    hexo generate #hexo g
    hexo server  #hexo s

    localhost:4000
```
## 5.部署
修改

    deploy:
    type: git
    repository: git@github.com:commshare/commshare.github.io.git
    branch: master
这里用git，而不是github，前提是得安装一个module： 
``` bash
    npm install hexo-deployer-git --save
```
hexo deploy 会把public目录上传到github上，前提是
``` bash
    ssh -T git@github.com     ##测试ssh。
```
可以在git下打开~.ssh/看下.pub文件，加入到github中。
## 6.域名
在source目录下加入CNAME文件，里头写blog.ixiaomo.net
这样github会把对commshare.github.io和blog.ixiaomo.net映射。
阿里云里CNMAE blog到commshare.github.io，此时，访问commshare.github.io会被github跳转到blog.ixiaomo.net，而blog.ixiaomo.net会被阿里云导入到github网站，github网站会按照CNAME文件找到为内部的commshare.github.io.



## 6.部署主题
 > 采用了著名的主题next 等后，发现配色暗淡，还是使用landscape，但又觉得不爽
 >  1. [stone的修改](http://shijiajie.com/2015/08/29/hexo-theme-landscape-plus-optimize/)
 >  2. 主题下面的config文件里头有推荐文章啥的，我改了下
 >  3. 部署的时候记得clean和g，然后deploy，否则有些主题样式不正确。

    hexo clean #删除public目录
    hexo g ##生成
    hexo server #调试
    hexo s --debug #也是调试
    hexo d #发布



