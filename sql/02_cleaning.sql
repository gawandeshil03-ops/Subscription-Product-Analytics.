-- Subscription Product Analytics
-- 02_cleaning.sql
-- Creates stable cleaned tables without modifying raw inputs.

DROP TABLE IF EXISTS clean.users;
CREATE TABLE clean.users AS
SELECT DISTINCT
    CAST(user_id AS INTEGER) AS user_id,
    CAST(signup_date AS DATE) AS signup_date,
    NULLIF(TRIM(acquisition_channel), '') AS acquisition_channel,
    NULLIF(TRIM(country), '') AS country,
    NULLIF(TRIM(device), '') AS device,
    CASE WHEN pre_engagement_7d >= 0 THEN pre_engagement_7d ELSE NULL END AS pre_engagement_7d
FROM raw.users
WHERE user_id IS NOT NULL;

DROP TABLE IF EXISTS clean.subscriptions;
CREATE TABLE clean.subscriptions AS
SELECT DISTINCT
    CAST(subscription_id AS INTEGER) AS subscription_id,
    CAST(user_id AS INTEGER) AS user_id,
    NULLIF(TRIM(plan), '') AS plan,
    CASE WHEN monthly_price >= 0 THEN monthly_price ELSE NULL END AS monthly_price,
    CAST(trial_start_date AS DATE) AS trial_start_date,
    CAST(paid_start_date AS DATE) AS paid_start_date,
    CAST(end_date AS DATE) AS end_date,
    NULLIF(TRIM(status), '') AS status
FROM raw.subscriptions
WHERE subscription_id IS NOT NULL
  AND user_id IS NOT NULL;

DROP TABLE IF EXISTS clean.experiment_dataset;
CREATE TABLE clean.experiment_dataset AS
SELECT DISTINCT
    CAST(user_id AS INTEGER) AS user_id,
    NULLIF(TRIM(variant), '') AS variant,
    CAST(signup_date AS DATE) AS signup_date,
    NULLIF(TRIM(device), '') AS device,
    NULLIF(TRIM(country), '') AS country,
    NULLIF(TRIM(acquisition_channel), '') AS acquisition_channel,
    CASE WHEN pre_engagement_7d >= 0 THEN pre_engagement_7d ELSE NULL END AS pre_engagement_7d,
    CASE WHEN trial_started IN (0,1) THEN trial_started ELSE NULL END AS trial_started,
    CASE WHEN converted IN (0,1) THEN converted ELSE NULL END AS converted,
    CASE WHEN retained IN (0,1) THEN retained ELSE NULL END AS retained,
    NULLIF(TRIM(plan), '') AS plan,
    CASE WHEN monthly_price >= 0 THEN monthly_price ELSE NULL END AS monthly_price,
    CASE WHEN revenue >= 0 THEN revenue ELSE NULL END AS revenue
FROM raw.experiment_dataset
WHERE user_id IS NOT NULL;

DROP TABLE IF EXISTS clean.funnel_stages;
CREATE TABLE clean.funnel_stages AS
SELECT
    CAST(stage_order AS INTEGER) AS stage_order,
    NULLIF(TRIM(stage), '') AS stage,
    CASE WHEN users >= 0 THEN users ELSE NULL END AS users
FROM raw.funnel_stages;
