1. Create Supabase Projects
2. Get APP URL and ANON KEY
3. Configure lib/shared_app/config/config.dart
4. Go to Authentication/Rate Limit and
   set Rate limit for sign ups and sign ins to 31000
5. Copy all contents of input_with_drop_queries.sql to Supabase Sql EDITOR and execute
6. Go to Authentication/Users, 
   register these two accounts
   user@demo.com        123456
   admin@demo.com       123456
7. Go to Project Settings/Authentication,
    Setup up your SMTP (Required in 2024 or register wont work!)