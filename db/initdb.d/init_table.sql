create table if not exists calendar
(
    id          bigint unsigned auto_increment
    primary key,
    is_public   tinyint(1) default 0                 not null comment 'public/private',
    title       varchar(255)                         not null comment '캘린더 타이틀',
    content     varchar(255)                         not null comment '캘린더 설명',
    image       mediumblob                           null comment '캘린더 대표 이미지',
    created_by  bigint                               not null comment '등록자',
    created_at  datetime   default CURRENT_TIMESTAMP not null comment '등록일',
    modified_at datetime   default CURRENT_TIMESTAMP not null comment '수정일'
    );

create table if not exists calendar_auth
(
    id      bigint unsigned auto_increment
    primary key,
    name    varchar(255)  not null comment '캘린더 권한명',
    sort_no int default 1 not null comment '캘린더 권한 정렬 순서'
    );

create table if not exists calendar_holiday
(
    id          bigint unsigned auto_increment
    primary key,
    calendar_id bigint                             not null comment '캘린더 id',
    holiday     date                               not null comment '휴일',
    created_by  bigint                             not null comment '등록자',
    created_at  datetime default CURRENT_TIMESTAMP not null comment '등록일',
    constraint holiday_uk
    unique (holiday, calendar_id)
    );

create table if not exists calendar_tag
(
    id          bigint unsigned auto_increment
    primary key,
    calendar_id bigint      not null comment '캘린더 id',
    tag         varchar(50) not null comment '캘린더 태그',
    constraint calendar_tag_uk
    unique (calendar_id, tag)
    );

create table if not exists calendar_user
(
    id               bigint unsigned auto_increment
    primary key,
    user_id          bigint                               not null comment '유저 id',
    calendar_id      bigint                               not null comment '캘린더 id',
    calendar_auth_id bigint                               not null comment '캘린더 권한 id',
    is_black         tinyint(1) default 0                 not null comment '블랙 유저 여부',
    created_at       datetime   default CURRENT_TIMESTAMP not null comment '등록일',
    modified_at      datetime   default CURRENT_TIMESTAMP not null comment '수정일',
    constraint calendar_usr_uk
    unique (user_id, calendar_id)
    );

create table if not exists calendar_user_holiday
(
    id          bigint unsigned auto_increment
    primary key,
    calendar_id bigint                             not null comment '캘린더 id',
    user_id     bigint                             not null comment '유저 id',
    holiday     date                               not null comment '휴일',
    created_at  datetime default CURRENT_TIMESTAMP not null comment '등록일',
    modified_at datetime default CURRENT_TIMESTAMP not null comment '수정일',
    constraint calendar_user_holiday_uk
    unique (user_id, holiday, calendar_id)
    );

create table if not exists favorite_schedule
(
    id                      bigint unsigned auto_increment
    primary key,
    user_id                 bigint                               not null comment '유저 id',
    schedule_id             bigint                               not null comment '스케쥴 id',
    calendar_id             bigint                               not null comment '캘린더 id',
    is_allday               tinyint(1) default 0                 not null comment '종일 여부',
    schedule_start_datetime datetime                             not null comment '스케쥴 시작일시',
    schedule_end_datetime   datetime                             not null comment '스케쥴 종료일시',
    created_at              datetime   default CURRENT_TIMESTAMP not null comment '생성일'
    );

create table if not exists schedule
(
    id             bigint unsigned auto_increment
    primary key,
    calendar_id    bigint                               not null comment '캘린더 id',
    user_id        bigint                               not null comment '유저 Id',
    title          varchar(50)                          not null comment '스케쥴 명',
    is_allday      tinyint(1) default 0                 not null comment '종일 여부',
    start_datetime datetime                             not null comment '시작일시',
    end_datetime   datetime                             not null comment '종료일시',
    content        text                                 null comment '스케쥴 내용',
    location       varchar(255)                         null comment '위치',
    created_at     datetime   default CURRENT_TIMESTAMP not null comment '등록일',
    modified_at    datetime   default CURRENT_TIMESTAMP not null comment '수정일',
    deleted_at     datetime                             null comment '삭제일'
    );

create table if not exists schedule_tag
(
    id          bigint unsigned auto_increment
    primary key,
    schedule_id bigint      not null comment '스케쥴 id',
    tag         varchar(50) not null comment '태그',
    constraint schedule_tag_uk
    unique (schedule_id, tag)
    );

create table if not exists schedule_user
(
    id          bigint unsigned auto_increment
    primary key,
    schedule_id bigint                             not null comment '스케쥴 id',
    user_id     bigint                             not null comment '유저 id',
    user_img    mediumblob                         null comment '유저 프로필 이미지',
    created_at  datetime default CURRENT_TIMESTAMP not null comment '생성일',
    constraint schedule_user_uk
    unique (schedule_id, user_id)
    );

create table if not exists subscribed_calendar
(
    id          bigint unsigned auto_increment
    primary key,
    calendar_id bigint                             not null comment '캘린더 id',
    user_id     bigint                             not null comment '유저 id',
    created_at  datetime default CURRENT_TIMESTAMP not null comment '생성일'
);

create table if not exists user
(
    id            bigint unsigned auto_increment
    primary key,
    recent_calendar_id bigint      null,
    nickname           varchar(50) not null,
    method             varchar(50) not null,
    ci                 varchar(50) not null,
    image              varchar(50) null,
    registered_at      datetime    not null,
    modified_at        datetime    null
    );

