-- À exécuter dans Supabase > SQL Editor

create table if not exists items (
  id uuid default gen_random_uuid() primary key,
  text text not null,
  checked boolean default false,
  created_at timestamptz default now()
);

-- Activer le realtime pour les mises à jour en direct
alter publication supabase_realtime add table items;

-- Autoriser tout le monde à lire et écrire (accès public)
alter table items enable row level security;

create policy "Lecture publique" on items for select using (true);
create policy "Ajout public" on items for insert with check (true);
create policy "Validation publique" on items for update using (true);
