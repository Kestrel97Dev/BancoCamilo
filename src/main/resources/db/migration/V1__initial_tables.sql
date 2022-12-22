create table "personas"(
    psn_id serial primary key,
    psn_nombre varchar(50) not null,
    psn_genero varchar(1) not null,
    psn_edad integer not null,
    psn_identificación varchar(50) not null,
    psn_dirección varchar(100) not null,
    psn_teléfono varchar(15) not null
);

ALTER TABLE "personas" OWNER to postgres;

create table "clientes"(
    clt_id serial primary key,
    clt_contraseña varchar(50) not null,
    clt_estado varchar(50) not null,
    foreign key (clt_id) references personas(psn_id)
);

ALTER TABLE "clientes" OWNER to postgres;

create table "cuentas"(
    cnt_id serial primary key,
    cnt_número_cuenta varchar(50) not null,
    cnt_tipo_cuenta varchar(50) not null,
    cnt_saldo_inicial integer not null,
    cnt_estado varchar(50) not null,
    cnt_id_cliente integer not null,
    foreign key (cnt_id_cliente) references clientes(clt_id)
);

ALTER TABLE "cuentas" OWNER to postgres;

create table "movimientos"(
    mvmt_id serial primary key,
    mvmt_fecha date not null,
    mvmt_tipo_movimiento varchar(50) not null,
    mvmt_valor integer not null,
    mvmt_saldo integer not null,
    mvmt_id_cuenta integer not null,
    foreign key (mvmt_id_cuenta) references cuentas(cnt_id)
);

ALTER TABLE "movimientos" OWNER to postgres;
