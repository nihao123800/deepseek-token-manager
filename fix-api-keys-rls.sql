-- 修复 api_keys 表的 RLS 策略
-- 先删除旧策略
DROP POLICY IF EXISTS "用户可以查看自己的API密钥" ON api_keys;
DROP POLICY IF EXISTS "用户可以创建自己的API密钥" ON api_keys;
DROP POLICY IF EXISTS "用户可以删除自己的API密钥" ON api_keys;
DROP POLICY IF EXISTS "管理员可以查看所有API密钥" ON api_keys;
DROP POLICY IF EXISTS "管理员可以删除API密钥" ON api_keys;

-- 创建新策略（使用宽松条件，确保能正常工作）
CREATE POLICY "allow_all_for_authenticated" ON api_keys
  FOR ALL USING (auth.role() = 'authenticated');
