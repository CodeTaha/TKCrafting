-- Item_Annotation [rel7]
alter table `annotation`  add column  `item_item_id`  integer;
alter table `annotation`   add index fk_annotation_item (`item_item_id`), add constraint fk_annotation_item foreign key (`item_item_id`) references `item` (`item_id`);


-- Worker_Annotation [rel8]
create table `worker_annotation` (
   `worker_worker_id`  integer not null,
   `annotation_annotation_id`  integer not null,
  primary key (`worker_worker_id`, `annotation_annotation_id`)
);
alter table `worker_annotation`   add index fk_worker_annotation_worker (`worker_worker_id`), add constraint fk_worker_annotation_worker foreign key (`worker_worker_id`) references `worker` (`worker_id`);
alter table `worker_annotation`   add index fk_worker_annotation_annotatio (`annotation_annotation_id`), add constraint fk_worker_annotation_annotatio foreign key (`annotation_annotation_id`) references `annotation` (`annotation_id`);


