create or replace view v_answer as
  select
    a.id,
    a.question_id,
    a.content,
    a.against_count,
    a.agree_count,
    a.comment_count,
    a.uninterested_count,
    a.thanks_count,
    a.category_id,
    a.force_fold,
    a.anonymous,
    a.publish_source,
    a.created_at,
    b.user_name,
    b.avatar_file
  from answer a
  left join user_ex b
    on a.user_id = b.id;
--;;
create or replace view v_answer_comment as
  select
    a.id,
    a.user_id,
    a.message,
    a.created_at,
    b.user_name,
    b.avatar_file
  from comments a
  left join user_ex b
    on a.user_id = b.id
  where a.type = 'answer';
