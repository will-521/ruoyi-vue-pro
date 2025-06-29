DROP TABLE IF EXISTS `member_user`
CREATE TABLE IF NOT EXISTS `member_user`
(
    `id`          bigint       NOT NULL AUTO_INCREMENT COMMENT '编号',
    `nickname`    varchar(30)  NOT NULL DEFAULT '' COMMENT '用户昵称',
    `name`        varchar(30)  NULL COMMENT '真实名字',
    `sex`         tinyint      NULL COMMENT '性别',
    `birthday`    datetime     NULL COMMENT '出生日期',
    `area_id`     int          NULL COMMENT '所在地',
    `mark`        varchar(255) NULL COMMENT '用户备注',
    `point`       int          DEFAULT 0 NULL COMMENT '积分',
    `avatar`      varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
    `status`      tinyint      NOT NULL COMMENT '状态',
    `mobile`      varchar(11)  NOT NULL COMMENT '手机号',
    `password`    varchar(100) NOT NULL DEFAULT '' COMMENT '密码',
    `register_ip` varchar(32)  NOT NULL COMMENT '注册 IP',
    `login_ip`    varchar(50)  NULL     DEFAULT '' COMMENT '最后登录IP',
    `login_date`  datetime     NULL     DEFAULT NULL COMMENT '最后登录时间',
    `tag_ids`     varchar(255) NULL     DEFAULT NULL COMMENT '用户标签编号列表,以逗号分隔',
    `level_id`    bigint       NULL     DEFAULT NULL COMMENT '等级编号',
    `experience`  bigint       NULL     DEFAULT NULL COMMENT '经验',
    `group_id`    bigint       NULL     DEFAULT NULL COMMENT '用户分组编号',
    `register_terminal` tinyint NOT NULL DEFAULT '0' COMMENT '注册终端',
    `creator`     varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`     varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `create_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`     bit(1)       NOT NULL DEFAULT '0' COMMENT '是否删除',
    `tenant_id`   bigint       NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) COMMENT '会员表';

CREATE TABLE IF NOT EXISTS `member_address` (
                                                `id` bigint(20) NOT NULL AUTO_INCREMENT,
                                                `user_id` bigint(20) NOT NULL,
                                                `name` varchar(10) NOT NULL,
                                                `mobile` varchar(20) NOT NULL,
                                                `area_id` bigint(20) NOT NULL,
                                                `detail_address` varchar(250) NOT NULL,
                                                `default_status` bit NOT NULL,
                                                `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                `creator` varchar(64) DEFAULT '',
                                                `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                                `deleted` bit NOT NULL DEFAULT FALSE,
                                                `updater` varchar(64) DEFAULT '',
                                                PRIMARY KEY (`id`)
) COMMENT '用户收件地址';

CREATE TABLE IF NOT EXISTS `member_tag`
(
    `id`          bigint   NOT NULL AUTO_INCREMENT,
    `name`        varchar(255)  NOT NULL,
    `creator`     varchar(255)  DEFAULT '',
    `create_time` datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`     varchar(255)  DEFAULT '',
    `update_time` datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`     bit           NOT NULL DEFAULT FALSE,
    `tenant_id`   bigint        NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
) COMMENT '会员标签';

CREATE TABLE IF NOT EXISTS `member_level`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT,
    `name`           varchar(255)  NOT NULL,
    `experience`     int      NOT NULL,
    `level`          int      NOT NULL,
    `discount_percent`       int      NOT NULL,
    `icon`           varchar(255)  NOT NULL,
    `background_url` varchar(255)  NOT NULL,
    `creator`        varchar(255)  DEFAULT '',
    `create_time`    datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`        varchar(255)  DEFAULT '',
    `update_time`    datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`        bit(1)   NOT NULL DEFAULT 0,
    `tenant_id`      bigint   NOT NULL DEFAULT 0,
    `status`         tinyint  NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
) COMMENT '会员等级';

CREATE TABLE IF NOT EXISTS `member_group`
(
    `id`          bigint   NOT NULL AUTO_INCREMENT,
    `name`        varchar(255)  NOT NULL,
    `remark`      varchar(255)  NOT NULL,
    `status` tinyint NOT NULL DEFAULT '0',
    `creator`     varchar(255)           DEFAULT '',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`     varchar(255)           DEFAULT '',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`     bit      NOT NULL DEFAULT FALSE,
    `tenant_id`   bigint   NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) COMMENT '用户分组';

CREATE TABLE IF NOT EXISTS `member_brokerage_record`
(
    `id`            int      NOT NULL AUTO_INCREMENT,
    `user_id`       bigint   NOT NULL,
    `biz_id`        varchar(255)  NOT NULL,
    `biz_type`      varchar(255)  NOT NULL,
    `title`         varchar(255)  NOT NULL,
    `price`         int      NOT NULL,
    `total_price`   int      NOT NULL,
    `description`   varchar(255)  NOT NULL,
    `status`        varchar(255)  NOT NULL,
    `frozen_days`   int      NOT NULL,
    `unfreeze_time` varchar(255),
    `creator`       varchar(255)  DEFAULT '',
    `create_time`   datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`       varchar(255)  DEFAULT '',
    `update_time`   datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`       bit      NOT NULL DEFAULT FALSE,
    `tenant_id`     bigint   NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) COMMENT '佣金记录';