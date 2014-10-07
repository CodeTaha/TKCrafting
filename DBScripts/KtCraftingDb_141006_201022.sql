-- User [User]
create table `user` (
   `oid`  integer  not null,
   `email`  varchar(255),
   `password`  varchar(255),
   `username`  varchar(255),
  primary key (`oid`)
);


-- Worker [ent2]
create table `worker` (
   `user_oid`  integer  not null,
   `name`  varchar(255),
   `birthdate`  date,
   `bank`  integer,
   `accuracy`  double precision,
   `assessedtasks`  integer,
  primary key (`user_oid`)
);


-- AnnotationCampaign [ent5]
create table `annotationcampaign` (
   `ac_id`  integer  not null,
   `name`  varchar(255),
   `budget`  varchar(255),
   `status`  bit,
  primary key (`ac_id`)
);


-- Worker_AnnotationCampaign [rel9]
alter table `annotationcampaign`  add column  `worker_oid`  integer;
alter table `annotationcampaign`   add index fk_annotationcampaign_worker (`worker_oid`), add constraint fk_annotationcampaign_worker foreign key (`worker_oid`) references `worker` (`user_oid`);
create index `idx_annotationcampaign_worker` on `annotationcampaign`(`worker_oid`);


-- GEN FK: Worker --> User
alter table `worker`   add index fk_worker_user (`user_oid`), add constraint fk_worker_user foreign key (`user_oid`) references `user` (`oid`);


