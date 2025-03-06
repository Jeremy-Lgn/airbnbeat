class Category < ApplicationRecord

  def sound_file
    sound_file = "#{title.downcase}.mp3"
    if File.file?("app/assets/audios/" + sound_file)
      sound_file
    else
      sound_default
    end
  end

  private

  def sound_default
    "app/assets/audios/default.mp3"
  end
end
