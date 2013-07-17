module ApplicationHelper
  def humanize secs
    [[60, :seconds], [60, :minutes], [24, :hours], [365, :days], [1000, :years]].map{ |count, name|
      if secs > 0
        secs, n = secs.divmod(count)
        "#{n.to_i} #{name}"
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
end
