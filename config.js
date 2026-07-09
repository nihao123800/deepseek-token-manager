// ============================================
// DeepSeek Token 转售管理系统 - 配置文件
// ============================================

const CONFIG = {
    // Supabase 配置（部署时替换为你的密钥）
    SUPABASE_URL: 'https://xeqjctecvwhadlpiwvpf.supabase.co',
    SUPABASE_ANON_KEY: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhlcWpjdGVjdndoYWRscGl3dnBmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODMzNTAwNzksImV4cCI6MjA5ODkyNjA3OX0.vCWpxv2mowZgfRU6o_bngHyINLHGbuB7VoZtXvrBEAo',

    // 管理员账号
    ADMIN_EMAIL: '361383370@qq.com',

    // 收款信息（多语言）
    PAYMENT: {
        BANK_ACCOUNT: '6212262013027306167',
        // SWIFT代码
        SWIFT_CODE: 'ICBKCNBJFSN',
        // 银行名称（三语）
        BANK_NAME: {
            zh: '中国工商银行佛山分行',
            en: 'INDUSTRIAL AND COMMERCIAL BANK OF CHINA, FOSHAN BRANCH',
            vi: 'NGÂN HÀNG CÔNG THƯƠNG TRUNG QUỐC, CHI NHÁNH PHẬT SƠN'
        },
        // 账户姓名（三语）
        ACCOUNT_NAME: {
            zh: '黄刚',
            en: 'HUANG GANG',
            vi: 'HOÀNG CƯƠNG'
        },
        // 开户支行地址（三语）
        BANK_BRANCH: {
            zh: '广东省佛山市汾江路12号',
            en: '12 FENJIANG WEST ROAD, FOSHAN, GUANGDONG, CHINA',
            vi: '12 ĐƯỜNG PHAN GIANG TÂY, PHẬT SƠN, QUANG ĐÔNG, TRUNG QUỐC'
        }
    },

    // 充值档位
    RECHARGE_TIERS: [10, 50, 100],

    // DeepSeek API 格式
    API_KEY_PREFIX: 'sk-',

    // 默认语言
    DEFAULT_LANG: 'zh',

    // 支持的语言
    SUPPORTED_LANGS: ['zh', 'en', 'vi'],

    // DeepSeek 定价配置（每百万 tokens）
    PRICING: {
        // 加价比例（50% = 乘以1.5）
        MARKUP_MULTIPLIER: 1.5,
        
        // deepseek-v4-flash 官方价格
        V4_FLASH: {
            INPUT_CACHE_HIT: 0.02,      // 0.02元/百万token
            INPUT_CACHE_MISS: 1,         // 1元/百万token
            OUTPUT: 2                    // 2元/百万token
        },
        // deepseek-v4-pro 官方价格
        V4_PRO: {
            INPUT_CACHE_HIT: 0.025,      // 0.025元/百万token
            INPUT_CACHE_MISS: 3,         // 3元/百万token
            OUTPUT: 6                    // 6元/百万token
        }
    },

    // 余额预警默认阈值（元）
    DEFAULT_BALANCE_WARNING: 10
};
