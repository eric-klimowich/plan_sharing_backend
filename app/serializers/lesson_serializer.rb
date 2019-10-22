class LessonSerializer < ActiveModel::Serializer
  attributes :lesson_data

  def lesson_data
    lesson_data_hash = {}

    lesson_data_hash["id"] = object.id
    lesson_data_hash["title"] = object.title
    lesson_data_hash["description"] = object.description
    lesson_data_hash["subject"] = object.user_grade_subject.subject.subject_name
    lesson_data_hash["grade"] = object.user_grade_subject.user_grade.grade.grade_name
    lesson_data_hash["user"] = object.user_grade_subject.user_grade.user.username

    lesson_data_hash
  end
end
