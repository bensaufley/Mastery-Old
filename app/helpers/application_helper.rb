module ApplicationHelper
  def humanize secs
    [[60, :second], [60, :minute], [24, :hour], [365, :day], [1000, :year]].map{ |count, name|
      if secs > 0
        secs, n = secs.divmod(count)
        pluralize(n.to_i, "#{name}")
      end
    }.compact.reverse.to_sentence
  end
  def humanize_short(secs, shorten = true)
    [[60, :seconds, 2], [60, :minutes, 2], [24, :hours, 2], [365, :days, 0], [1000, :years, 0]].map{ |count, name, pad|
      if secs > 0 && shorten
        secs, n = secs.divmod(count)
        "%0#{pad}d" % "#{n.to_i}"
      elsif name==:minutes
        '00'
      end
    }.compact.reverse.join(':')
  end

  def is_current_user?(user)
    user==current_user
  end

end
