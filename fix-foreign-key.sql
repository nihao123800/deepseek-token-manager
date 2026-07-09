-- 删除 api_keys 表的外键约束
ALTER TABLE api_keys DROP CONSTRAINT IF EXISTS api_keys_user_id_fkey;

-- 重新添加外键约束，引用 auth.users 表
ALTER TABLE api_keys ADD CONSTRAINT api_keys_user_id_fkey 
  FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;

-- 确保 profiles 表存在当前用户的记录（替换 UUID）
-- 先查看你的用户 ID：在 Authentication → Users 里找到你的 UUID
-- 然后执行下面的 SQL（替换 YOUR_UUID 为你的实际 UUID）
-- INSERT INTO profiles (id, username, email, balance, role) 
-- VALUES ('YOUR_UUID', '管理员', '361383370@qq.com', 0, 'admin')
-- ON CONFLICT (id) DO NOTHING;
