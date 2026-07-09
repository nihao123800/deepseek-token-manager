-- ============================================
-- 升级脚本：添加API Key分配功能
-- ============================================

-- 1. 给 api_keys 表添加分配相关字段
ALTER TABLE api_keys ADD COLUMN IF NOT EXISTS assigned_to UUID;
ALTER TABLE api_keys ADD COLUMN IF NOT EXISTS is_master BOOLEAN DEFAULT FALSE;
ALTER TABLE api_keys ADD COLUMN IF NOT EXISTS key_name VARCHAR(255);
ALTER TABLE api_keys ADD COLUMN IF NOT EXISTS assigned_at TIMESTAMP WITH TIME ZONE;

-- 2. 创建索引
CREATE INDEX IF NOT EXISTS idx_api_keys_assigned_to ON api_keys(assigned_to);
CREATE INDEX IF NOT EXISTS idx_api_keys_is_master ON api_keys(is_master);
