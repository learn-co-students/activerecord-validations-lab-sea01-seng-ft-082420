class TitleValidator < ActiveModel::Validator
    def validate(record)
      if record.title && !record.title.match("Won't Believe") && !record.title.match("Secret") && !record.title.match("Guess") && !record.title.match(/Top [0-9]/)
        record.errors[:base] << "Not clickbait-y enough"
      end
    end
  end