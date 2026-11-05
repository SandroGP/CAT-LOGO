alter table public.productos
  add column if not exists codigo text,
  add column if not exists precio_mayor numeric(10,2),
  add column if not exists precio_caja numeric(10,2),
  add column if not exists unidades_caja int,
  add column if not exists orientacion text not null default 'vertical',
  add column if not exists fotos jsonb not null default '[]'::jsonb;
update public.productos set precio_mayor = round(precio_docena/12, 2) where precio_mayor is null;
create unique index if not exists productos_codigo_uq on public.productos (codigo) where codigo is not null;
