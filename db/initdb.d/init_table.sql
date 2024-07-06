CREATE TABLE `schedule`
(
    `id`    bigint    unsigned auto_increment  NOT NULL PRIMARY KEY,
    `calendar_id`    bigint      NOT NULL,
    `user_id`        bigint      NOT NULL,
    `title`          varchar(50) NOT NULL,
    `all_day`        Bool NULL default false,
    `start_datetime` datetime NOT NULL,
    `end_datetime`   datetime NULL,
    `content`        varchar(50) NULL,
    `location`       varchar(50) NULL,
    `created_at`     datetime    NOT NULL,
    `modified_at`    datetime NULL,
    `deleted_at`     datetime NULL
);

CREATE TABLE `favorite_schedule`
(
    `id`    bigint    unsigned auto_increment NOT NULL PRIMARY KEY,
    `user_id`              bigint NOT NULL,
    `schedule_id`          bigint NOT NULL,
    `calendar_id`          bigint NOT NULL,
    `schedule_end_date`    date NULL,
    `created_at`           datetime NOT NULL
);

CREATE TABLE `calendar`
(
    `id`    bigint    unsigned auto_increment NOT NULL PRIMARY KEY,
    `is_public`   Bool NULL default false,
    `title`       varchar(50) NOT NULL,
    `content`     varchar(50) NOT NULL,
    `image`       varchar(50) NULL,
    `created_by`  varchar(50) NOT NULL,
    `created_at`  datetime NOT NULL,
    `modified_at` datetime NULL
);

CREATE TABLE `subscribed_calendar`
(
    `id`    bigint    unsigned auto_increment NOT NULL PRIMARY KEY,
    `calendar_id`            bigint NOT NULL,
    `user_id`                bigint NOT NULL,
    `created_at`             datetime NOT NULL
);

CREATE TABLE `calendar_user`
(
    `id`    bigint    unsigned auto_increment NOT NULL PRIMARY KEY,
    `user_id`          bigint NOT NULL,
    `calendar_id`      bigint NOT NULL,
    `calendar_auth_id` enum('t1', 't2', 't3', 't4') DEFAULT 't4' NOT NULL,
    `is_black`         bool NULL default false,
    `created_at`       datetime NOT NULL,
    `modified_at`   datetime NULL
);

CREATE TABLE `user`
(
    `id`    bigint    unsigned auto_increment NOT NULL PRIMARY KEY,
    `nickname`      varchar(50) NOT NULL,
    `method`        varchar(50) NOT NULL,
    `ci`            varchar(50) NOT NULL,
    `image`         varchar(50) NULL,
    `registered_at` datetime NOT NULL,
    `modified_at`   datetime NULL
);

CREATE TABLE `schedule_tag`
(
    `id`    bigint    unsigned auto_increment NOT NULL PRIMARY KEY,
    `schedule_id`     bigint NOT NULL,
    `tag`             varchar(50) NULL
);

CREATE TABLE `calendar_tag`
(
    `id`    bigint    unsigned auto_increment NOT NULL PRIMARY KEY,
    `calendar_id`     bigint NOT NULL,
    `tag`             varchar(50) NULL
);

CREATE TABLE `calendar_user_holiday`
(
    `id`    bigint    unsigned auto_increment NOT NULL PRIMARY KEY,
    `calendar_id`              bigint       NOT NULL,
    `user_id`                  bigint       NOT NULL,
    `holiday`                  date NULL,
    `created_at`               datetime NOT NULL,
    `modified_at`               datetime NULL
);

CREATE TABLE `calendar_auth`
(
    `id`    bigint    unsigned auto_increment NOT NULL PRIMARY KEY,
    `name`             varchar(50) NULL,
    `sort_no`          int NULL
);

CREATE TABLE `schedule_user`
(
    `id`    bigint    unsigned auto_increment NOT NULL PRIMARY KEY,
    `schedule_id`      bigint NOT NULL,
    `user_id`          bigint NOT NULL,
    `user_img`         varchar(50) NULL,
    `created_at`       datetime NOT NULL
);

CREATE TABLE `calendar_holiday`
(
    `id`    bigint   unsigned auto_increment NOT NULL PRIMARY KEY,
    `calendar_id`         bigint NOT NULL,
    `holiday`             date NOT NULL,
    `created_at`          datetime NOT NULL,
    `created_by`          varchar(50) NOT NULL
);