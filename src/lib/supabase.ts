import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || 'https://hfcnnznczylgceswoedl.supabase.co';
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhmY25uem5jenlsZ2Nlc3dvZWRsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzk4MDU5NjAsImV4cCI6MjA5NTM4MTk2MH0.9_CTZ6y-tsAgJBtrMHwJrVG9ZIE2UCI3zrOxgKF4rL4';

if (!supabaseAnonKey) {
  console.warn('NEXT_PUBLIC_SUPABASE_ANON_KEY is missing. Please set it in your environment variables.');
}

// Suppress Supabase GoTrue lock warnings to keep console clean
if (typeof console !== 'undefined') {
  const originalWarn = console.warn;
  console.warn = (...args) => {
    if (typeof args[0] === 'string' && (args[0].includes('@supabase/gotrue-js') || args[0].includes('Lock'))) {
      return;
    }
    originalWarn(...args);
  };
}

export const supabase = createClient(supabaseUrl, supabaseAnonKey);
