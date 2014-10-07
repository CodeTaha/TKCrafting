-- Skills [ent6]
create table `skills` (
   `skill_id`  integer  not null,
   `name`  varchar(255),
  primary key (`skill_id`)
);


-- Worker_Skills [rel2]
create table `skills` (
   `worker_worker_id`  integer not null,
   `skill_id`  integer not null,
  primary key (`worker_worker_id`, `skill_id`)
);
alter table `skills`   add index fk_skills_worker (`worker_worker_id`), add constraint fk_skills_worker foreign key (`worker_worker_id`) references `worker` (`worker_id`);
alter table `skills`   add index fk_skills_skills (`skill_id`), add constraint fk_skills_skills foreign key (`skill_id`) references `skills` (`skill_id`);


