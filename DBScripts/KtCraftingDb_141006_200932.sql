-- AnnotationCampaign [ent5]
create table `annotationcampaign` (
   `ac_id`  integer  not null,
   `name`  varchar(255),
   `budget`  varchar(255),
   `status`  bit,
  primary key (`ac_id`)
);


-- Worker_Annotation [rel8]
create table `worker_annotation` (
   `worker_oid`  integer not null,
   `annotation_annotation_id`  integer not null,
  primary key (`worker_oid`, `annotation_annotation_id`)
);


-- Worker_AnnotationCampaign [rel9]
alter table `annotationcampaign`  add column  `worker_oid`  integer;


