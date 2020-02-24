class PostValidator < ActiveModel::Validator
    def validate(record)
        passes = false
        musts = ["Won't Believe", "Secret", "Top #{/[0-9]/}", "Guess"]
        musts.each do |phrase|
            if record.title != nil && record.title.match?(phrase)
                passes = true
            end
        end
        unless passes
            record.errors[:title] << "Title must contain Won't Believe, Secret, Top [number], Guess."
        end
    end
end