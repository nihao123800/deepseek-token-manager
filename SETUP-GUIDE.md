# AI Token 管理系统 - Supabase 初始化指南

## 第一步：创建数据库表

1. 打开 Supabase Dashboard: https://supabase.com/dashboard
2. 点击左侧菜单 **SQL Editor**
3. 点击 **New query**
4. 复制 `database-init.sql` 文件的全部内容，粘贴到编辑器中
5. 点击 **Run** 执行

执行成功后会显示 "Success. No rows returned"

## 第二步：设置管理员账号

1. 用管理员邮箱 `361383370@qq.com` 注册账号
2. 回到 Supabase Dashboard
3. 点击左侧菜单 **Table Editor**
4. 点击 **profiles** 表
5. 找到你的用户记录（通过邮箱查找）
6. 点击该行的 **role** 字段，把 `user` 改成 `admin`
7. 保存

## 第三步：启用邮件验证（可选）

如果你希望用户注册后需要验证邮箱：

1. 在 Supabase Dashboard 左侧菜单点击 **Authentication**
2. 点击 **Providers**
3. 确保 **Email** 已启用

如果不想让用户验证邮箱就能直接登录：
1. 在 **Authentication** → **Providers** → **Email**
2. 取消勾选 **Confirm email**

## 第四步：测试

1. 打开 http://localhost:8080
2. 用管理员邮箱注册/登录
3. 点击导航栏的 **管理后台**
4. 测试创建 API 密钥
5. 测试充值流程

## 常见问题

### 创建密钥失败？
- 确保已执行 `database-init.sql` 创建了 `api_keys` 表
- 检查浏览器控制台 (F12 → Console) 是否有错误信息

### 管理后台进不去？
- 确保用 `361383370@qq.com` 邮箱注册
- 确保在 profiles 表中把 role 改成了 `admin`
- 重新登录一次

### 二维码不显示？
- 确保网络能访问 `cdn.jsdelivr.net`
- 如果网络受限，可能需要换 CDN 或使用本地 QR 库
