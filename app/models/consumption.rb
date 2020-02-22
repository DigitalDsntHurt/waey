class Consumption < ApplicationRecord

  ##
  ## ##
  ## ## ## DATA QUERIES
  ## ##
  ##

    def self.trailing_seven_days
      Consumption.all.where("date > ? and date < ?", Date.today - 8, Date.today)
    end

    def self.this_week
      @week_start = Date.today
      unless @week_start.monday?
        until @week_start.monday?
          @week_start -= 1
        end
      end

      @week_end = @week_start + 6

      Consumption.all.where("date >= ? and date <= ?", @week_start, @week_end)
    end

    def self.last_week
      @week_start = Date.today
      unless @week_start.monday?
        until @week_start.monday?
          @week_start -= 1
        end
      end

      @week_end = @week_start + 6

      Consumption.all.where("date >= ? and date <= ?", (@week_start - 7), (@week_end - 7))
    end

    def self.summarize_days_to_wins_and_losses(days_query)
      @payload = []
      days_query.group_by{|record| record.date }.to_a.each{|date,records|
        @check = [date, records.pluck(:win)]
        if @check[1].uniq.count == 1
          @payload << [date,@check[1].sample]
        else
          @payload << [date, false]
        end
      }

      @payload
    end

    def self.win_loss_days_and_percents(time_period)
      win_loss_summary = summarize_days_to_wins_and_losses(time_period)

      @payload = {}
      @payload[:start_date] = win_loss_summary.map{|date,winloss| date }.sort.first
      @payload[:end_date] = win_loss_summary.map{|date,winloss| date }.sort.last
      @payload[:days] = win_loss_summary.count
      @payload[:wins] = win_loss_summary.select{|date,winloss| winloss == true }.count
      @payload[:percent_win] = ((win_loss_summary.select{|date,winloss| winloss == true }.count / win_loss_summary.count.to_f) * 100.0).round(2)
      @payload[:losses] = win_loss_summary.select{|date,winloss| winloss == false }.count
      @payload[:percent_loss] = ((win_loss_summary.select{|date,winloss| winloss == false }.count / win_loss_summary.count.to_f) * 100.0).round(2)

      @payload
    end

    def self.avg_feeling_score(time_period)
      @feeling_scores = time_period.pluck(:feeling_score)
      @avg_feeling_score = (@feeling_scores.inject{|score,sum| score + sum } / @feeling_scores.count.to_f).round(2)
    end

end
