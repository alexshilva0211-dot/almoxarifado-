-- Cole este SQL no Supabase: SQL Editor > New query > Run

create table if not exists funcionarios (
  id bigint generated always as identity primary key,
  nome text not null,
  criado_em timestamptz default now()
);

create table if not exists ferramentas (
  id bigint generated always as identity primary key,
  nome text not null,
  tipo text not null,
  foto text,
  status text not null default 'Disponível',
  pessoa text,
  saida timestamptz
);

create table if not exists materiais (
  id bigint generated always as identity primary key,
  nome text not null,
  tipo text not null,
  status text not null default 'Disponível',
  pessoa text,
  saida timestamptz
);

create table if not exists epis (
  id bigint generated always as identity primary key,
  nome text not null,
  tipo text not null,
  status text not null default 'Disponível',
  pessoa text,
  data_retirada timestamptz
);

create table if not exists historico_ferramentas (
  id bigint generated always as identity primary key,
  ferramenta_id bigint references ferramentas(id) on delete cascade,
  ferramenta text not null,
  tipo text not null,
  pessoa text not null,
  saida timestamptz not null default now(),
  devolucao timestamptz
);

create table if not exists retiradas_materiais (
  id bigint generated always as identity primary key,
  material_id bigint references materiais(id) on delete cascade,
  material text not null,
  unidade text not null,
  pessoa text not null,
  saida timestamptz not null default now()
);

create table if not exists retiradas_epis (
  id bigint generated always as identity primary key,
  epi_id bigint references epis(id) on delete cascade,
  epi text not null,
  tipo text not null,
  pessoa text not null,
  saida timestamptz not null default now()
);

-- Permitir acesso pelo aplicativo usando a chave pública (anon key)
alter table funcionarios enable row level security;
alter table ferramentas enable row level security;
alter table materiais enable row level security;
alter table epis enable row level security;
alter table historico_ferramentas enable row level security;
alter table retiradas_materiais enable row level security;
alter table retiradas_epis enable row level security;

create policy "acesso publico funcionarios" on funcionarios for all using (true) with check (true);
create policy "acesso publico ferramentas" on ferramentas for all using (true) with check (true);
create policy "acesso publico materiais" on materiais for all using (true) with check (true);
create policy "acesso publico epis" on epis for all using (true) with check (true);
create policy "acesso publico historico" on historico_ferramentas for all using (true) with check (true);
create policy "acesso publico retiradas materiais" on retiradas_materiais for all using (true) with check (true);
create policy "acesso publico retiradas epis" on retiradas_epis for all using (true) with check (true);

-- Cadastrar os funcionários iniciais
insert into funcionarios (nome) values
('Wanderson'),('Alexandre'),('Leonardo'),('Matheus'),('Rafael'),
('Kaue'),('Romario'),('Adilson'),('Ryan'),('Gentil'),('Sidney')
on conflict do nothing;

-- Cadastrar as ferramentas iniciais
insert into ferramentas (nome, tipo, status) values
('Par Quadrada 1','Par Quadrada','Disponível'),('Par Quadrada 2','Par Quadrada','Disponível'),('Par Quadrada 3','Par Quadrada','Disponível'),('Par Quadrada 4','Par Quadrada','Disponível'),
('Chibanca 1','Chibanca','Disponível'),('Chibanca 2','Chibanca','Disponível'),
('Maleta Brocas & Fendas 1','Maleta Brocas & Fendas','Disponível'),('Maleta Brocas & Fendas 2','Maleta Brocas & Fendas','Disponível'),
('MaKita 1','MaKita','Disponível'),('MaKita 2','MaKita','Disponível'),
('Martelete 15K','Martelete 15K','Disponível'),
('Martelete 5Kg','Martelete 5Kg','Disponível'),
('Martelete 3Kg 1','Martelete 3Kg','Disponível'),('Martelete 3Kg 2','Martelete 3Kg','Disponível'),
('Lixadeira Dewalt 1','Lixadeira Dewalt','Disponível'),('Lixadeira Dewalt 2','Lixadeira Dewalt','Disponível'),
('Parafusadeira Elétrica 1','Parafusadeira Elétrica','Disponível'),('Parafusadeira Elétrica 2','Parafusadeira Elétrica','Disponível'),('Parafusadeira Elétrica 3','Parafusadeira Elétrica','Disponível'),
('Tripe Laser 1','Tripe Laser','Disponível'),('Tripe Laser 2','Tripe Laser','Disponível'),
('Laser 1','Laser','Disponível'),('Laser 2','Laser','Disponível'),
('Trena 1','Trena','Disponível'),('Trena 2','Trena','Disponível'),('Trena 3','Trena','Disponível'),('Trena 4','Trena','Disponível'),
('Jogos De Fenda & Philips 1','Jogos De Fenda & Philips','Disponível'),('Jogos De Fenda & Philips 2','Jogos De Fenda & Philips','Disponível'),
('Marreta 1','Marreta','Disponível'),('Marreta 2','Marreta','Disponível'),('Marreta 3','Marreta','Disponível'),('Marreta 4','Marreta','Disponível'),('Marreta 5','Marreta','Disponível'),('Marreta 6','Marreta','Disponível'),('Marreta 7','Marreta','Disponível'),('Marreta 8','Marreta','Disponível'),('Marreta 9','Marreta','Disponível'),
('Martelo 1','Martelo','Disponível'),('Martelo 2','Martelo','Disponível'),('Martelo 3','Martelo','Disponível'),
('Ponteiro 1','Ponteiro','Disponível'),('Ponteiro 2','Ponteiro','Disponível'),('Ponteiro 3','Ponteiro','Disponível'),('Ponteiro 4','Ponteiro','Disponível'),('Ponteiro 5','Ponteiro','Disponível'),('Ponteiro 6','Ponteiro','Disponível'),('Ponteiro 7','Ponteiro','Disponível'),('Ponteiro 8','Ponteiro','Disponível'),('Ponteiro 9','Ponteiro','Disponível'),('Ponteiro 10','Ponteiro','Disponível'),('Ponteiro 11','Ponteiro','Disponível'),
('Talhadeira 1','Talhadeira','Disponível'),('Talhadeira 2','Talhadeira','Disponível'),('Talhadeira 3','Talhadeira','Disponível'),('Talhadeira 4','Talhadeira','Disponível'),('Talhadeira 5','Talhadeira','Disponível'),('Talhadeira 6','Talhadeira','Disponível'),('Talhadeira 7','Talhadeira','Disponível'),('Talhadeira 8','Talhadeira','Disponível'),('Talhadeira 9','Talhadeira','Disponível'),('Talhadeira 10','Talhadeira','Disponível'),('Talhadeira 11','Talhadeira','Disponível'),
('Ponteiro Martelete 3kg 1','Ponteiro Martelete 3kg','Disponível'),('Ponteiro Martelete 3kg 2','Ponteiro Martelete 3kg','Disponível'),('Ponteiro Martelete 3kg 3','Ponteiro Martelete 3kg','Disponível'),('Ponteiro Martelete 3kg 4','Ponteiro Martelete 3kg','Disponível'),('Ponteiro Martelete 3kg 5','Ponteiro Martelete 3kg','Disponível'),
('Talhadeira Martelete 3kg 1','Talhadeira Martelete 3kg','Disponível'),('Talhadeira Martelete 3kg 2','Talhadeira Martelete 3kg','Disponível'),('Talhadeira Martelete 3kg 3','Talhadeira Martelete 3kg','Disponível'),('Talhadeira Martelete 3kg 4','Talhadeira Martelete 3kg','Disponível'),('Talhadeira Martelete 3kg 5','Talhadeira Martelete 3kg','Disponível'),
('Ponteiro Martelete 15kg 1','Ponteiro Martelete 15kg','Disponível'),('Ponteiro Martelete 15kg 2','Ponteiro Martelete 15kg','Disponível'),
('Jogo De Chave Ale 1','Jogo De Chave Ale','Disponível'),('Jogo De Chave Ale 2','Jogo De Chave Ale','Disponível'),
('Extensão 1','Extensão','Disponível'),('Extensão 2','Extensão','Disponível'),('Extensão 3','Extensão','Disponível'),
('Alicate 1','Alicate','Disponível'),('Alicate 2','Alicate','Disponível'),
('Estiletes 1','Estiletes','Disponível'),('Estiletes 2','Estiletes','Disponível'),
('Trena A Laser','Trena A Laser','Disponível'),
('Pe De Cabra','Pe De Cabra','Disponível'),
('Chave Bueiros','Chave Bueiros','Disponível'),
('Escada De Alumínio 1','Escada De Alumínio','Disponível'),('Escada De Alumínio 2','Escada De Alumínio','Disponível'),('Escada De Alumínio 3','Escada De Alumínio','Disponível'),('Escada De Alumínio 4','Escada De Alumínio','Disponível'),('Escada De Alumínio 5','Escada De Alumínio','Disponível'),
('Carrinho De Mao 1','Carrinho De Mao','Disponível'),('Carrinho De Mao 2','Carrinho De Mao','Disponível');

-- Cadastrar os materiais iniciais
insert into materiais (nome, tipo, status) values
('Rafia 1','Rafia','Disponível'),('Rafia 2','Rafia','Disponível'),('Rafia 3','Rafia','Disponível'),('Rafia 4','Rafia','Disponível'),('Rafia 5','Rafia','Disponível'),('Rafia 6','Rafia','Disponível'),('Rafia 7','Rafia','Disponível'),('Rafia 8','Rafia','Disponível'),('Rafia 9','Rafia','Disponível'),('Rafia 10','Rafia','Disponível'),
('Caps Rosqueavel 1/2 1','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 2','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 3','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 4','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 5','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 6','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 7','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 8','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 9','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 10','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 11','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 12','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 13','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 14','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 15','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 16','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 17','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 18','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 19','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 20','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 21','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 22','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 23','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 24','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 25','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 26','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 27','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 28','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 29','Caps Rosqueavel 1/2','Disponível'),('Caps Rosqueavel 1/2 30','Caps Rosqueavel 1/2','Disponível'),
('Cola 1','Cola','Disponível'),('Cola 2','Cola','Disponível'),('Cola 3','Cola','Disponível'),
('Fita Teflon 1','Fita Teflon','Disponível'),('Fita Teflon 2','Fita Teflon','Disponível'),('Fita Teflon 3','Fita Teflon','Disponível'),('Fita Teflon 4','Fita Teflon','Disponível'),
('Plug Rosqueavel 1/2 1','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 2','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 3','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 4','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 5','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 6','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 7','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 8','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 9','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 10','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 11','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 12','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 13','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 14','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 15','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 16','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 17','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 18','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 19','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 20','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 21','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 22','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 23','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 24','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 25','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 26','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 27','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 28','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 29','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 30','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 31','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 32','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 33','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 34','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 35','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 36','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 37','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 38','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 39','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 40','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 41','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 42','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 43','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 44','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 45','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 46','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 47','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 48','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 49','Plug Rosqueavel 1/2','Disponível'),('Plug Rosqueavel 1/2 50','Plug Rosqueavel 1/2','Disponível'),
('Lapis Carpinteiro 1','Lapis Carpinteiro','Disponível'),('Lapis Carpinteiro 2','Lapis Carpinteiro','Disponível'),('Lapis Carpinteiro 3','Lapis Carpinteiro','Disponível'),('Lapis Carpinteiro 4','Lapis Carpinteiro','Disponível'),('Lapis Carpinteiro 5','Lapis Carpinteiro','Disponível'),
('CapS Soldavel 20m 1','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 2','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 3','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 4','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 5','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 6','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 7','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 8','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 9','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 10','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 11','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 12','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 13','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 14','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 15','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 16','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 17','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 18','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 19','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 20','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 21','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 22','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 23','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 24','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 25','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 26','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 27','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 28','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 29','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 30','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 31','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 32','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 33','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 34','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 35','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 36','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 37','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 38','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 39','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 40','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 41','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 42','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 43','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 44','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 45','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 46','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 47','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 48','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 49','CapS Soldavel 20m','Disponível'),('CapS Soldavel 20m 50','CapS Soldavel 20m','Disponível'),
('Caps Soldavel 25m 1','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 2','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 3','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 4','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 5','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 6','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 7','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 8','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 9','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 10','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 11','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 12','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 13','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 14','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 15','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 16','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 17','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 18','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 19','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 20','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 21','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 22','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 23','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 24','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 25','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 26','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 27','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 28','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 29','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 30','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 31','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 32','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 33','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 34','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 35','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 36','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 37','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 38','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 39','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 40','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 41','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 42','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 43','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 44','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 45','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 46','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 47','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 48','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 49','Caps Soldavel 25m','Disponível'),('Caps Soldavel 25m 50','Caps Soldavel 25m','Disponível'),
('Caps Soldavel 32m 1','Caps Soldavel 32m','Disponível'),('Caps Soldavel 32m 2','Caps Soldavel 32m','Disponível'),('Caps Soldavel 32m 3','Caps Soldavel 32m','Disponível'),('Caps Soldavel 32m 4','Caps Soldavel 32m','Disponível'),('Caps Soldavel 32m 5','Caps Soldavel 32m','Disponível'),('Caps Soldavel 32m 6','Caps Soldavel 32m','Disponível'),('Caps Soldavel 32m 7','Caps Soldavel 32m','Disponível'),('Caps Soldavel 32m 8','Caps Soldavel 32m','Disponível'),('Caps Soldavel 32m 9','Caps Soldavel 32m','Disponível'),('Caps Soldavel 32m 10','Caps Soldavel 32m','Disponível'),('Caps Soldavel 32m 11','Caps Soldavel 32m','Disponível'),('Caps Soldavel 32m 12','Caps Soldavel 32m','Disponível'),('Caps Soldavel 32m 13','Caps Soldavel 32m','Disponível'),('Caps Soldavel 32m 14','Caps Soldavel 32m','Disponível'),('Caps Soldavel 32m 15','Caps Soldavel 32m','Disponível'),('Caps Soldavel 32m 16','Caps Soldavel 32m','Disponível'),('Caps Soldavel 32m 17','Caps Soldavel 32m','Disponível'),('Caps Soldavel 32m 18','Caps Soldavel 32m','Disponível'),('Caps Soldavel 32m 19','Caps Soldavel 32m','Disponível'),('Caps Soldavel 32m 20','Caps Soldavel 32m','Disponível'),('Caps Soldavel 32m 21','Caps Soldavel 32m','Disponível'),('Caps Soldavel 32m 22','Caps Soldavel 32m','Disponível'),('Caps Soldavel 32m 23','Caps Soldavel 32m','Disponível'),('Caps Soldavel 32m 24','Caps Soldavel 32m','Disponível'),('Caps Soldavel 32m 25','Caps Soldavel 32m','Disponível'),
('Fita 3M 1','Fita 3M','Disponível'),('Fita 3M 2','Fita 3M','Disponível'),('Fita 3M 3','Fita 3M','Disponível'),('Fita 3M 4','Fita 3M','Disponível'),
('Disco de Concreto 1','Disco de Concreto','Disponível'),('Disco de Concreto 2','Disco de Concreto','Disponível'),('Disco de Concreto 3','Disco de Concreto','Disponível'),
('Disco De Porcelanato 1','Disco De Porcelanato','Disponível'),('Disco De Porcelanato 2','Disco De Porcelanato','Disponível'),('Disco De Porcelanato 3','Disco De Porcelanato','Disponível'),('Disco De Porcelanato 4','Disco De Porcelanato','Disponível'),
('Disco De Madeiras 1','Disco De Madeiras','Disponível'),('Disco De Madeiras 2','Disco De Madeiras','Disponível'),('Disco De Madeiras 3','Disco De Madeiras','Disponível'),
('Disco De Ferro 1','Disco De Ferro','Disponível'),('Disco De Ferro 2','Disco De Ferro','Disponível'),('Disco De Ferro 3','Disco De Ferro','Disponível'),('Disco De Ferro 4','Disco De Ferro','Disponível'),('Disco De Ferro 5','Disco De Ferro','Disponível'),('Disco De Ferro 6','Disco De Ferro','Disponível'),('Disco De Ferro 7','Disco De Ferro','Disponível'),('Disco De Ferro 8','Disco De Ferro','Disponível'),('Disco De Ferro 9','Disco De Ferro','Disponível'),('Disco De Ferro 10','Disco De Ferro','Disponível'),
('Rolo De Fio 2.5 1','Rolo De Fio 2.5','Disponível'),('Rolo De Fio 2.5 2','Rolo De Fio 2.5','Disponível');

-- Cadastrar os EPIs iniciais
insert into epis (nome, tipo, status) values
('Luvas 1','Luvas','Disponível'),('Luvas 2','Luvas','Disponível'),('Luvas 3','Luvas','Disponível'),('Luvas 4','Luvas','Disponível'),('Luvas 5','Luvas','Disponível'),('Luvas 6','Luvas','Disponível'),('Luvas 7','Luvas','Disponível'),('Luvas 8','Luvas','Disponível'),('Luvas 9','Luvas','Disponível'),('Luvas 10','Luvas','Disponível'),('Luvas 11','Luvas','Disponível'),('Luvas 12','Luvas','Disponível'),('Luvas 13','Luvas','Disponível'),('Luvas 14','Luvas','Disponível'),('Luvas 15','Luvas','Disponível'),
('Capacete Azul 1','Capacete Azul','Disponível'),('Capacete Azul 2','Capacete Azul','Disponível'),('Capacete Azul 3','Capacete Azul','Disponível'),('Capacete Azul 4','Capacete Azul','Disponível'),('Capacete Azul 5','Capacete Azul','Disponível'),('Capacete Azul 6','Capacete Azul','Disponível'),('Capacete Azul 7','Capacete Azul','Disponível'),('Capacete Azul 8','Capacete Azul','Disponível'),
('Capacete Cinza 1','Capacete Cinza','Disponível'),('Capacete Cinza 2','Capacete Cinza','Disponível'),('Capacete Cinza 3','Capacete Cinza','Disponível'),('Capacete Cinza 4','Capacete Cinza','Disponível'),('Capacete Cinza 5','Capacete Cinza','Disponível'),('Capacete Cinza 6','Capacete Cinza','Disponível'),('Capacete Cinza 7','Capacete Cinza','Disponível'),('Capacete Cinza 8','Capacete Cinza','Disponível'),('Capacete Cinza 9','Capacete Cinza','Disponível'),('Capacete Cinza 10','Capacete Cinza','Disponível'),
('Capacete Branco 1','Capacete Branco','Disponível'),('Capacete Branco 2','Capacete Branco','Disponível'),('Capacete Branco 3','Capacete Branco','Disponível'),('Capacete Branco 4','Capacete Branco','Disponível'),('Capacete Branco 5','Capacete Branco','Disponível'),('Capacete Branco 6','Capacete Branco','Disponível'),('Capacete Branco 7','Capacete Branco','Disponível'),
('Óculos De Proteção 1','Óculos De Proteção','Disponível'),('Óculos De Proteção 2','Óculos De Proteção','Disponível'),('Óculos De Proteção 3','Óculos De Proteção','Disponível'),('Óculos De Proteção 4','Óculos De Proteção','Disponível'),('Óculos De Proteção 5','Óculos De Proteção','Disponível'),('Óculos De Proteção 6','Óculos De Proteção','Disponível'),('Óculos De Proteção 7','Óculos De Proteção','Disponível'),('Óculos De Proteção 8','Óculos De Proteção','Disponível'),('Óculos De Proteção 9','Óculos De Proteção','Disponível'),('Óculos De Proteção 10','Óculos De Proteção','Disponível'),('Óculos De Proteção 11','Óculos De Proteção','Disponível'),('Óculos De Proteção 12','Óculos De Proteção','Disponível'),('Óculos De Proteção 13','Óculos De Proteção','Disponível'),('Óculos De Proteção 14','Óculos De Proteção','Disponível'),('Óculos De Proteção 15','Óculos De Proteção','Disponível'),('Óculos De Proteção 16','Óculos De Proteção','Disponível'),('Óculos De Proteção 17','Óculos De Proteção','Disponível'),('Óculos De Proteção 18','Óculos De Proteção','Disponível'),('Óculos De Proteção 19','Óculos De Proteção','Disponível'),('Óculos De Proteção 20','Óculos De Proteção','Disponível'),
('Protetor Orecular 1','Protetor Orecular','Disponível'),('Protetor Orecular 2','Protetor Orecular','Disponível'),('Protetor Orecular 3','Protetor Orecular','Disponível'),('Protetor Orecular 4','Protetor Orecular','Disponível'),('Protetor Orecular 5','Protetor Orecular','Disponível'),('Protetor Orecular 6','Protetor Orecular','Disponível'),('Protetor Orecular 7','Protetor Orecular','Disponível'),('Protetor Orecular 8','Protetor Orecular','Disponível'),('Protetor Orecular 9','Protetor Orecular','Disponível'),('Protetor Orecular 10','Protetor Orecular','Disponível'),('Protetor Orecular 11','Protetor Orecular','Disponível'),('Protetor Orecular 12','Protetor Orecular','Disponível'),('Protetor Orecular 13','Protetor Orecular','Disponível'),('Protetor Orecular 14','Protetor Orecular','Disponível'),('Protetor Orecular 15','Protetor Orecular','Disponível'),('Protetor Orecular 16','Protetor Orecular','Disponível'),('Protetor Orecular 17','Protetor Orecular','Disponível'),('Protetor Orecular 18','Protetor Orecular','Disponível'),('Protetor Orecular 19','Protetor Orecular','Disponível'),('Protetor Orecular 20','Protetor Orecular','Disponível'),
('Bota 1','Bota','Disponível'),('Bota 2','Bota','Disponível'),('Bota 3','Bota','Disponível'),('Bota 4','Bota','Disponível'),('Bota 5','Bota','Disponível'),('Bota 6','Bota','Disponível'),('Bota 7','Bota','Disponível'),('Bota 8','Bota','Disponível'),('Bota 9','Bota','Disponível'),('Bota 10','Bota','Disponível'),('Bota 11','Bota','Disponível'),('Bota 12','Bota','Disponível'),('Bota 13','Bota','Disponível'),('Bota 14','Bota','Disponível'),('Bota 15','Bota','Disponível'),('Bota 16','Bota','Disponível'),('Bota 17','Bota','Disponível'),('Bota 18','Bota','Disponível'),('Bota 19','Bota','Disponível'),('Bota 20','Bota','Disponível');
