DROP TABLE IF EXISTS bpm_category;

CREATE TABLE bpm_category
(
    `creator`   varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`   varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id` bigint       NOT NULL DEFAULT '0',
    `id`        bigint       NOT NULL AUTO_INCREMENT COMMENT '主键',
    create_time DATETIME     NOT NULL COMMENT '创建时间',
    update_time DATETIME     NOT NULL COMMENT '更新时间',
    deleted     INT          NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    name        VARCHAR(255) NOT NULL COMMENT '分类名',
    code        VARCHAR(255) NOT NULL COMMENT '分类标志',
    description TEXT COMMENT '分类描述',
    status      INT          NOT NULL COMMENT '状态',
    sort        INT          NOT NULL COMMENT '排序',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='BPM 流程分类表';

DROP TABLE IF EXISTS bpm_category;

DROP TABLE IF EXISTS bpm_form;

CREATE TABLE bpm_form
(
    `creator`   varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`   varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id` bigint       NOT NULL DEFAULT '0',
    `id`        bigint       NOT NULL AUTO_INCREMENT COMMENT '主键',
    create_time DATETIME     NOT NULL COMMENT '创建时间',
    update_time DATETIME     NOT NULL COMMENT '更新时间',
    deleted     INT          NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    name        VARCHAR(255) NOT NULL COMMENT '表单名',
    status      INT          NOT NULL COMMENT '状态',
    conf        TEXT         NOT NULL COMMENT '表单配置',
    fields      JSON         NOT NULL COMMENT '表单项数组',
    remark      TEXT COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='BPM 工作流表单定义';


DROP TABLE IF EXISTS bpm_process_definition_info;

CREATE TABLE bpm_process_definition_info
(
    `creator`                      varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`                      varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`                    bigint       NOT NULL DEFAULT '0',
    `id`                           bigint       NOT NULL AUTO_INCREMENT COMMENT '主键',
    create_time                    DATETIME     NOT NULL COMMENT '创建时间',
    update_time                    DATETIME     NOT NULL COMMENT '更新时间',
    deleted                        INT          NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除',
    process_definition_id          VARCHAR(255) NOT NULL COMMENT '流程定义编号',
    model_id                       VARCHAR(255) NOT NULL COMMENT '流程模型编号',
    model_type                     INT          NOT NULL COMMENT '流程模型类型',
    category                       VARCHAR(255) NOT NULL COMMENT '流程分类编码',
    icon                           VARCHAR(255) COMMENT '图标',
    description                    TEXT COMMENT '描述',
    form_type                      INT          NOT NULL COMMENT '表单类型',
    form_id                        BIGINT COMMENT '动态表单编号',
    form_conf                      TEXT COMMENT '表单配置',
    form_fields                    JSON COMMENT '表单项数组',
    form_custom_create_path        VARCHAR(255) COMMENT '自定义表单提交路径',
    form_custom_view_path          VARCHAR(255) COMMENT '自定义表单查看路径',
    simple_model                   TEXT COMMENT 'SIMPLE 模型数据',
    visible                        BOOLEAN      NOT NULL DEFAULT TRUE COMMENT '是否可见',
    sort                           BIGINT       NOT NULL COMMENT '排序值',
    start_user_ids                 JSON COMMENT '可发起用户编号数组',
    start_dept_ids                 JSON COMMENT '可发起部门编号数组',
    manager_user_ids               JSON COMMENT '可管理用户编号数组',
    allow_cancel_running_process   BOOLEAN      NOT NULL DEFAULT FALSE COMMENT '是否允许撤销审批中的申请',
    process_id_rule                JSON COMMENT '流程 ID 规则',
    auto_approval_type             INT COMMENT '自动去重类型',
    title_setting                  JSON COMMENT '标题设置',
    summary_setting                JSON COMMENT '摘要设置',
    process_before_trigger_setting JSON COMMENT '流程前置通知设置',
    process_after_trigger_setting  JSON COMMENT '流程后置通知设置',
    task_before_trigger_setting    JSON COMMENT '任务前置通知设置',
    task_after_trigger_setting     JSON COMMENT '任务后置通知设置',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='BPM 流程定义拓扑信息';

DROP TABLE IF EXISTS bpm_process_expression;

CREATE TABLE bpm_process_expression
(
    `creator`   varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`   varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id` bigint       NOT NULL DEFAULT '0',
    `id`        bigint       NOT NULL AUTO_INCREMENT COMMENT '主键',
    create_time DATETIME     NOT NULL COMMENT '创建时间',
    update_time DATETIME     NOT NULL COMMENT '更新时间',
    deleted     INT          NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    name        VARCHAR(255) NOT NULL COMMENT '表达式名称',
    status      INT          NOT NULL COMMENT '状态',
    expression  TEXT         NOT NULL COMMENT '表达式内容',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='BPM 流程表达式';


DROP TABLE IF EXISTS bpm_process_listener;

CREATE TABLE bpm_process_listener
(
    `creator`   varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`   varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id` bigint       NOT NULL DEFAULT '0',
    `id`        bigint       NOT NULL AUTO_INCREMENT COMMENT '主键',
    create_time DATETIME     NOT NULL COMMENT '创建时间',
    update_time DATETIME     NOT NULL COMMENT '更新时间',
    deleted     INT          NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    name        VARCHAR(255) NOT NULL COMMENT '监听器名称',
    status      INT          NOT NULL COMMENT '状态',
    type        VARCHAR(255) NOT NULL COMMENT '监听类型',
    event       VARCHAR(255) NOT NULL COMMENT '监听事件',
    value_type  VARCHAR(255) NOT NULL COMMENT '值类型',
    value       TEXT         NOT NULL COMMENT '值',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='BPM 流程监听器';

DROP TABLE IF EXISTS bpm_user_group;

CREATE TABLE bpm_user_group
(
    `creator`   varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`   varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id` bigint       NOT NULL DEFAULT '0',
    `id`        bigint       NOT NULL AUTO_INCREMENT COMMENT '主键',
    create_time DATETIME     NOT NULL COMMENT '创建时间',
    update_time DATETIME     NOT NULL COMMENT '更新时间',
    deleted     INT          NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    name        VARCHAR(255) NOT NULL COMMENT '组名',
    description TEXT COMMENT '描述',
    status      INT          NOT NULL COMMENT '状态',
    user_ids    JSON COMMENT '成员用户编号数组',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='BPM 用户组';


DROP TABLE IF EXISTS bpm_oa_leave;

CREATE TABLE bpm_oa_leave
(
    `creator`           varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`           varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`         bigint       NOT NULL DEFAULT '0',
    `id`                bigint       NOT NULL AUTO_INCREMENT COMMENT '主键',
    create_time         DATETIME     NOT NULL COMMENT '创建时间',
    update_time         DATETIME     NOT NULL COMMENT '更新时间',
    deleted             INT          NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    user_id             BIGINT       NOT NULL COMMENT '申请人用户编号',
    type                VARCHAR(255) NOT NULL COMMENT '请假类型',
    reason              TEXT         NOT NULL COMMENT '原因',
    start_time          DATETIME     NOT NULL COMMENT '开始时间',
    end_time            DATETIME     NOT NULL COMMENT '结束时间',
    day                 BIGINT       NOT NULL COMMENT '请假天数',
    status              INT          NOT NULL COMMENT '审批结果',
    process_instance_id VARCHAR(255) NOT NULL COMMENT '对应的流程编号',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='OA 请假申请';

DROP TABLE IF EXISTS bpm_process_instance_copy;

CREATE TABLE bpm_process_instance_copy
(
    `creator`             varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`             varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`           bigint       NOT NULL DEFAULT '0',
    `id`                  bigint       NOT NULL AUTO_INCREMENT COMMENT '主键',
    create_time           DATETIME     NOT NULL COMMENT '创建时间',
    update_time           DATETIME     NOT NULL COMMENT '更新时间',
    deleted               INT          NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    start_user_id         BIGINT       NOT NULL COMMENT '发起人 Id',
    process_instance_name VARCHAR(255) NOT NULL COMMENT '流程名',
    process_instance_id   VARCHAR(255) NOT NULL COMMENT '流程实例编号',
    process_definition_id VARCHAR(255) NOT NULL COMMENT '流程定义编号',
    category              VARCHAR(255) NOT NULL COMMENT '流程分类',
    activity_id           VARCHAR(255) NOT NULL COMMENT '流程活动编号',
    activity_name         VARCHAR(255) NOT NULL COMMENT '流程活动名称',
    task_id               VARCHAR(255) NOT NULL COMMENT '任务编号',
    user_id               BIGINT       NOT NULL COMMENT '被抄送的用户编号',
    reason                TEXT COMMENT '抄送意见',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='流程抄送记录';
