-- ============================================
-- 升级脚本：添加用量录入和余额预警功能
-- ============================================

-- 1. 给 profiles 表添加余额预警阈值字段
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS balance_warning DECIMAL(10,2) DEFAULT 10;

-- 2. 给 usage_records 表添加详细字段
ALTER TABLE usage_records ADD COLUMN IF NOT EXISTS model VARCHAR(50);
ALTER TABLE usage_records ADD COLUMN IF NOT EXISTS input_tokens_cache_hit BIGINT DEFAULT 0;
ALTER TABLE usage_records ADD COLUMN IF NOT EXISTS input_tokens_cache_miss BIGINT DEFAULT 0;
ALTER TABLE usage_records ADD COLUMN IF NOT EXISTS output_tokens BIGINT DEFAULT 0;
ALTER TABLE usage_records ADD COLUMN IF NOT EXISTS unit_price DECIMAL(10,4);
ALTER TABLE usage_records ADD COLUMN IF NOT EXISTS cost DECIMAL(10,4);
ALTER TABLE usage_records ADD COLUMN IF NOT EXISTS api_key VARCHAR(255);
ALTER TABLE usage_records ADD COLUMN IF NOT EXISTS recorded_by VARCHAR(255);

-- 3. 创建索引（如果不存在）
CREATE INDEX IF NOT EXISTS idx_usage_records_user_id ON usage_records(user_id);
CREATE INDEX IF NOT EXISTS idx_usage_records_api_key ON usage_records(api_key);
