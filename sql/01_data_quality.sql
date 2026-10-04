-- Subscription Product Analytics
-- 01_data_quality.sql
-- PostgreSQL-compatible QA queries. Replace raw.* table names with your staging schema.

-- Duplicate users
SELECT user_id, COUNT(*) AS row_count
FROM raw.users
GROUP BY user_id
HAVING COUNT(*) > 1;

-- Nulls in critical user fields
SELECT
  COUNT(*) FILTER (WHERE user_id IS NULL) AS null_user_id,
  COUNT(*) FILTER (WHERE signup_date IS NULL) AS null_signup_date,
  COUNT(*) FILTER (WHERE device IS NULL) AS null_device,
  COUNT(*) FILTER (WHERE acquisition_channel IS NULL) AS null_channel
FROM raw.users;

-- Duplicate subscriptions
SELECT subscription_id, COUNT(*) AS row_count
FROM raw.subscriptions
GROUP BY subscription_id
HAVING COUNT(*) > 1;

-- Invalid subscription dates
SELECT *
FROM raw.subscriptions
WHERE (paid_start_date IS NOT NULL AND trial_start_date IS NOT NULL AND paid_start_date < trial_start_date)
   OR (end_date IS NOT NULL AND paid_start_date IS NOT NULL AND end_date < paid_start_date);

-- Impossible prices
SELECT *
FROM raw.subscriptions
WHERE monthly_price < 0;

-- Experiment flag validation
SELECT variant, converted, retained, COUNT(*)
FROM raw.experiment_dataset
GROUP BY variant, converted, retained
ORDER BY variant, converted, retained;

-- Funnel sanity
SELECT * FROM raw.funnel_stages ORDER BY stage_order;
