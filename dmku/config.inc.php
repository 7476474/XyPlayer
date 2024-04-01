<?php return [
    'username'=>'admin',
    '后台密码' => '1a#1a#12',
    'tips' => [
        'time' => '6',
        'color' => '#fb7299',
        'text' => '请大家遵守弹幕礼仪，文明发送弹幕',
    ],
    '防窥' => '0',
    '数据库' => [
        '类型' => 'mysql',
        '方式' => 'pdo',
        '地址' => 'mysql.sqlpub.com:3306',
        '用户名' => 'liusicpp',
        '密码' => 'o9jvPwYnMeP7dJ7o',
        '名称' => 'liusicpp',
    ],

    'is_cdn' => 0,  //是否用了cdn
    '限制时间' => 60, //单位s
    '限制次数' => 20, //在限制时间内可以发送多少条弹幕
    '允许url' => ['https://www.dy.liusi.cloudns.org'],  //跨域  格式['https://abc.com','http://cba.com']   要加协议
    '安装' => 1
];
