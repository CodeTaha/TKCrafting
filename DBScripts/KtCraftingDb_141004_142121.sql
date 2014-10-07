-- Worker_Skills [rel4]
create table `worker_skills` (
   `worker_worker_id`  integer not null,
   `skills_skill_id`  integer not null,
  primary key (`worker_worker_id`, `skills_skill_id`)
);
alter table `worker_skills`   add index fk_worker_skills_worker (`worker_worker_id`), add constraint fk_worker_skills_worker foreign key (`worker_worker_id`) references `worker` (`worker_id`);
alter table `worker_skills`   add index fk_worker_skills_skills (`skills_skill_id`), add constraint fk_worker_skills_skills foreign key (`skills_skill_id`) references `skills` (`skill_id`);


