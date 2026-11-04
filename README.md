# Controle de Ferramentas, Materiais e EPIs

Aplicativo com dados compartilhados pelo Supabase.

## 1. Criar as tabelas

1. Abra o Supabase.
2. Vá em **SQL Editor**.
3. Clique em **New query**.
4. Cole todo o conteúdo de `database.sql`.
5. Clique em **Run**.

Isso cria as tabelas, libera o acesso pelo aplicativo e cadastra ferramentas, materiais, EPIs e funcionários.

## 2. Criar o bucket de fotos

1. No Supabase, vá em **Storage**.
2. Clique em **New bucket**.
3. Nome: `fotos`
4. Marque **Public bucket**.
5. Salve.

## 3. Publicar no GitHub e Netlify

1. Envie todos os arquivos desta pasta para a raiz do repositório no GitHub.
2. No Netlify, escolha **Add new site > Import an existing project > GitHub**.
3. Selecione o repositório.
4. Deixe **Build command** vazio.
5. Em **Publish directory**, informe `.`
6. Clique em **Deploy site**.

## Segurança

As regras SQL permitem acesso público de leitura e escrita usando a chave pública (`anon key`). Para um uso mais seguro, configure login no Supabase e restrinja as políticas.
