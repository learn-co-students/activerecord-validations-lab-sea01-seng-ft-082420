class TitleValidator < ActiveModel::Validator

    def title_validator
        if self.title.include! "Won't Believe" || "Secret" || "Top[number]" || "Guess"
            flash[:errors] = self.errors.all_messages
        end
    end

end