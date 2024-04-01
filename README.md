# 仿bilibili视频弹幕播放器

原作者：京都一只喵

一款防bilibili的播放器，支持弹幕和后台管理，主要是这个播放器是仿B站的，很简洁，特别合适用来web开发。

在线演示：[http://code.qkongtao.cn/video/player/?url=http://upyun.qkongtao.cn/AList/%E8%8D%89%E5%B8%BD%E4%B8%80%E4%BC%99%E6%82%AC%E8%B5%8F%E4%BB%A4%E4%BC%A0%E9%81%8D%E5%85%A8%E4%B8%96%E7%95%8C.mp4](http://code.qkongtao.cn/video/player/?url=http://upyun.qkongtao.cn/AList/%E8%8D%89%E5%B8%BD%E4%B8%80%E4%BC%99%E6%82%AC%E8%B5%8F%E4%BB%A4%E4%BC%A0%E9%81%8D%E5%85%A8%E4%B8%96%E7%95%8C.mp4)


## 功能特色
插件功能：弹幕后台、前置广告、暂停广告、会员去广告，记忆回放，自动下一集

插件支持：.m3u8、.mp4、.flv 等常见视频格式，注意：不支持 （MP4） H265 格式的视频

插件兼容：电脑、手机端

**注：**
原项目是基于php7x，而php8由于对语法更加严格，所以原项目在php8环境下运行时产生了很多Bug，基本导致全部页面都无法正常打开，我针对这些“新特性”的bug做了些调整，但由于我不了解PHP这个语言，整个修改过程都是磕磕绊绊，目前所有页面已经可以正常打开，数据记录正常，由于没有挨个功能测试所以避免不了还会有残留问题，如果你不想在这里浪费时间建议依然使用github中php7版本的，而这个项目我也会继续跟进调整。
github项目地址：[https://github.com/newcdn/bilibili](https://github.com/newcdn/bilibili)

## 运行环境
nginx或apache

PHP8.X

Mysql ≥ 5.5

## 安装步骤
1. 解压到网站根目录

2. 登录 你的域名/dmku 进行配置数据库

3. 修改播放器后台账号密码 dmku/config.inc.php

4. 登录后台 你的域名/admin 账号和密码为第3步修改的账号密码（默认账号：admin；默认密码：123456）

5. 播放器功能可后台设置


## 自定义设置
如何显示加载动画：player/index.php第 12 行删除【#loading-box,】就显示了

如何显示弹幕规则：player/index.php第 12 行删除【,.dmrules】就显示了

如何修改加载时的gif图片：player/css/yzmplayer.css第行 2648 行修改样式的imgurl地址

如何添加修改视频右击内容：player/js/yzmplayer.js的 977 行修改或追加内容

开启自动播放：player/js/setting.js 第 557 行，所有【autoplay】设置为tru


## 使用方法
参数说明（player/index.php）
```php
"av":'<?php echo($_GET['av']);?>',//B站av号，用于调用弹幕
"url":"<?php echo($_GET['url']);?>",//视频链接
"id":"<?php echo($_GET['url']);?>",//视频id
"sid":"<?php echo($_GET['sid']);?>",//集数id
"pic":"<?php echo($_GET['pic']);?>",//视频封面
"title":"<?php echo($_GET['name']);?>",//视频标题
"next":"<?php echo($_GET['next']);?>",//下一集链接
"user": '<?php echo($_GET['user']);?>',//用户名
"group": "<?php echo($_GET['group']);?>",//用户组
```


nginx配置
```
server {
        # 映射端口
	listen  	9100;
        # 这里可以设置为你的域名
        server_name localhost;
        # 项目根目录
        root html;
        # 默认首页
        index index.php login.php;
        location ~ \.php$ {
            # 设置监听端口 php默认端口9000
            fastcgi_pass   127.0.0.1:9000;
            # 配置首页 配置了index 这个不设置也可以
            fastcgi_index  index.php;
            # 设置脚本文件请求的路径
            fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
            # 引入fastcgi的配置文件
            include        fastcgi_params;
        }
    }

```

1. 基础请求
```
https://域名/player/?url=视频链接
如：
http://code.qkongtao.cn/video/player/?url=http://upyun.qkongtao.cn/AList/%E8%8D%89%E5%B8%BD%E4%B8%80%E4%BC%99%E6%82%AC%E8%B5%8F%E4%BB%A4%E4%BC%A0%E9%81%8D%E5%85%A8%E4%B8%96%E7%95%8C.mp4
```

2. 高级带参请求
除了 url 参数，其他都可以省略
`http://域名/player/?url=视频链接&next=下个视频链接&sid=1&pic=视频封面图片链接&user=游客&group=1&name=测试`
3. 在web页面中使用
```html
<iframe
        src="http://code.qkongtao.cn/video/player/?url=http://upyun.qkongtao.cn/AList/%E8%8D%89%E5%B8%BD%E4%B8%80%E4%BC%99%E6%82%AC%E8%B5%8F%E4%BB%A4%E4%BC%A0%E9%81%8D%E5%85%A8%E4%B8%96%E7%95%8C.mp4"
        allowfullscreen="allowfullscreen" mozallowfullscreen="mozallowfullscreen" msallowfullscreen="msallowfullscreen"
        oallowfullscreen="oallowfullscreen" webkitallowfullscreen="webkitallowfullscreen" width="750px" height="550px"
        frameborder="0">
</iframe>
```

示例如下：
```html
<!DOCTYPE html>
<html lang="en">
<style>
    iframe {
        display: block;
        margin: 50px auto;
    }
</style>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>测试哔哩播放器</title>
</head>

<body>
    <h2 style="text-align: center;">iframe测试哔哩播放器</h2>
    <iframe
        src="http://code.qkongtao.cn/video/player/?url=http://upyun.qkongtao.cn/AList/%E8%8D%89%E5%B8%BD%E4%B8%80%E4%BC%99%E6%82%AC%E8%B5%8F%E4%BB%A4%E4%BC%A0%E9%81%8D%E5%85%A8%E4%B8%96%E7%95%8C.mp4"
        allowfullscreen="allowfullscreen" mozallowfullscreen="mozallowfullscreen" msallowfullscreen="msallowfullscreen"
        oallowfullscreen="oallowfullscreen" webkitallowfullscreen="webkitallowfullscreen" width="750px" height="550px"
        frameborder="0">
    </iframe>
</body>
</html>
```