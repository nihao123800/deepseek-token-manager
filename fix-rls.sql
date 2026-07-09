-- ============================================
-- 修复所有表的 RLS 策略
-- ============================================

-- 1. profiles 表策略（登录需要）
DROP POLICY IF EXISTS "用户可以查看自己的资料" ON profiles;
DROP POLICY IF EXISTS "用户可以更新自己的资料" ON profiles;
DROP POLICY IF EXISTS "用户可以插入自己的资料" ON profiles;

CREATE POLICY "用户可以查看自己的资料" ON profiles
  FOR SELECT USING (auth.uid() = id);

CREATE POLICY "用户可以更新自己的资料" ON profiles
  FOR UPDATE USING (auth.uid() = id);

CREATE POLICY "用户可以插入自己的资料" ON profiles
  FOR INSERT WITH CHECK (auth.uid() = id);

-- 2. api_keys 表策略
DROP POLICY IF EXISTS "用户可以创建自己的API密钥" ON api_keys;
DROP POLICY IF EXISTS "用户可以查看自己的API密钥" ON api_keys;
DROP POLICY IF EXISTS "用户可以删除自己的API密钥" ON api_keys;

CREATE POLICY "用户可以创建自己的API密钥" ON api_keys
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "用户可以查看自己的API密钥" ON api_keys
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "用户可以删除自己的API密钥" ON api_keys
  FOR DELETE USING (auth.uid() = user_id);

-- 3. recharges 表策略
DROP POLICY IF EXISTS "用户可以查看自己的充值记录" ON recharges;
DROP POLICY IF EXISTS "用户可以创建充值记录" ON recharges;

CREATE POLICY "用户可以查看自己的充值记录" ON recharges
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "用户可以创建充值记录" ON recharges
  FOR INSERT WITH CHECK (auth.uid() = user_id);

-- 4. usage_records 表策略
DROP POLICY IF EXISTS "用户可以查看自己的使用记录" ON usage_records;

CREATE POLICY "用户可以查看自己的使用记录" ON usage_records
  FOR SELECT USING (auth.uid() = user_id);
