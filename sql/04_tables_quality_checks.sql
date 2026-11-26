-- Verifying the Created Structure

-- Tables have been created

select
    table_name
from information_schema.tables
where table_schema = 'public'
  and table_type = 'BASE TABLE'
order by table_name;

-- Column Structure Check

select
    table_name,
    column_name,
    data_type,
    is_nullable
from information_schema.columns
where table_schema = 'public'
order by
    table_name,
    ordinal_position;

-- Primary and Foreign Keys Check

select
    tc.table_name,
    tc.constraint_name,
    tc.constraint_type,
    kcu.column_name,
    ccu.table_name as referenced_table,
    ccu.column_name as referenced_column  
from information_schema.table_constraints tc
left join information_schema.key_column_usage kcu
    on tc.constraint_name = kcu.constraint_name
    and tc.constraint_schema = kcu.constraint_schema
left join information_schema.constraint_column_usage ccu
    on tc.constraint_name = ccu.constraint_name
    and tc.constraint_schema = ccu.constraint_schema
where tc.table_schema = 'public'
and tc.constraint_type in (
      'PRIMARY KEY',
      'FOREIGN KEY'
  )
order by tc.table_name;


