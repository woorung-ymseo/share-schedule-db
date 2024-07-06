-- schedule 테이블 더미 데이터 삽입
INSERT INTO `calendar` (`id`, `is_public`, `title`, `content`, `image`, `created_by`, `created_at`, `modified_at`)
VALUES
    (1, TRUE, 'Work Calendar', 'Calendar for work-related events', 'work.png', 'admin', '2024-06-01 09:00:00', NULL),
    (2, FALSE, 'Personal Calendar', 'Calendar for personal events', 'personal.png', 'user1', '2024-06-02 10:00:00', NULL);

-- favorite_schedule 테이블 더미 데이터 삽입
INSERT INTO `user` (`id`, `nickname`, `method`, `ci`, `image`, `registered_at`, `modified_at`)
VALUES
    (1, 'admin', 'email', 'ci_admin', 'admin.png', '2024-06-01 08:00:00', NULL),
    (2, 'user1', 'email', 'ci_user1', 'user1.png', '2024-06-02 09:00:00', NULL);

-- calendar 테이블 더미 데이터 삽입
INSERT INTO `schedule` (`id`, `calendar_id`, `user_id`, `title`, `all_day`, `start_datetime`, `end_datetime`, `content`, `location`, `created_at`, `modified_at`, `deleted_at`)
VALUES
    (1, 1, 1, 'Team Meeting', FALSE, '2024-06-15 09:00:00', '2024-06-15 10:00:00', 'Discuss project updates', 'Meeting Room A', '2024-06-14 15:00:00', NULL, NULL),
    (2, 2, 2, 'Lunch Break', TRUE, '2024-06-16 12:00:00', '2024-06-16 13:00:00', 'Take a break with colleagues', 'Cafeteria', '2024-06-14 16:00:00', NULL, NULL);

-- subscribed_calendar 테이블 더미 데이터 삽입
INSERT INTO `favorite_schedule` (`id`, `user_id`, `schedule_id`, `calendar_id`, `schedule_end_date`, `created_at`)
VALUES
    (1, 1, 1, 1, '2024-06-15', '2024-06-14 15:00:00'),
    (2, 2, 2, 2, '2024-06-16', '2024-06-14 16:00:00');

-- calendar_user 테이블 더미 데이터 삽입
INSERT INTO `subscribed_calendar` (`id`, `calendar_id`, `user_id`, `created_at`)
VALUES
    (1, 1, 1, '2024-06-01 09:00:00'),
    (2, 2, 2, '2024-06-02 10:00:00');

-- user 테이블 더미 데이터 삽입
INSERT INTO `calendar_user` (`id`, `user_id`, `calendar_id`, `calendar_auth_id`, `is_black`, `created_at`, `modified_at`)
VALUES
    (1, 1, 1, 't1', FALSE, '2024-06-01 09:00:00', NULL),
    (2, 2, 2, 't2', FALSE, '2024-06-02 10:00:00', NULL);

-- schedule_tag 테이블 더미 데이터 삽입
INSERT INTO `schedule_tag` (`id`, `schedule_id`, `tag`)
VALUES
    (1, 1, 'meeting'),
    (2, 2, 'break');

-- calendar_tag 테이블 더미 데이터 삽입
INSERT INTO `calendar_tag` (`id`, `calendar_id`, `tag`)
VALUES
    (1, 1, 'work'),
    (2, 2, 'personal');

-- calendar_user_holiday 테이블 더미 데이터 삽입
INSERT INTO `calendar_user_holiday` (`id`, `calendar_id`, `user_id`, `holiday`, `created_at`)
VALUES
    ('1', 1, 1, '2024-06-17', '2024-06-01 09:00:00'),
    ('2', 2, 2, '2024-06-18', '2024-06-02 10:00:00');

-- schedule_user 테이블 더미 데이터 삽입
INSERT INTO `schedule_user` (`id`, `schedule_id`, `user_id`, `user_img`, `created_at`)
VALUES
    (1, 1, 1, 'admin.png', '2024-06-01 09:00:00'),
    (2, 2, 2, 'user1.png', '2024-06-02 10:00:00');

-- calendar_holiday 테이블 더미 데이터 삽입
INSERT INTO `calendar_holiday` (`id`, `calendar_id`, `holiday`, `created_at`, `created_by`)
VALUES
    (1, 1, '2024-06-17', '2024-06-01 09:00:00', 'admin'),
    (2, 2, '2024-06-18', '2024-06-02 10:00:00', 'user1');