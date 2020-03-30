class Consumption < ApplicationRecord

  validates :date, presence: true
  validates :description, presence: true
  #validates :win, presence: true
  validates :feeling_score, presence: true

  
  after_validation :downcase_description
  after_create :kill_untracked_record

##                        ##
## ##                  ## ##
## ## ## DATA QUERY ## ## ##
## ##                  ## ##
##                        ##

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

    def self.winning_day(date)
      !Consumption.where(date: date).pluck(:win).include?(false)
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

    def self.weekly_wins
      @start_date = Date.new(2019,12,30)
      @end_date = Date.today
      unless @end_date.sunday?
        until @end_date.sunday?
          @end_date += 1
        end
      end

      @weeks = []
      until @start_date > @end_date
        @weeks << [@start_date,@start_date+6]
        @start_date += 7
      end

      @return_data = []
      @weeks.each{|mon,sun|
        @return_data << win_loss_days_and_percents(Consumption.where("date >= ? and date <= ?", mon, sun)).slice(:wins).values[0]
      }

      @return_data
    end

    def self.todays_consumption
      @todays_consumptions = Consumption.where(date: Date.today)
      @total_consumptions_count = @todays_consumptions.count
      @todays_consumptions_wins = @todays_consumptions.where(win: true).count

      {total_count: @total_consumptions_count, wins: @todays_consumptions_wins}
    end

    def self.todays_consumption_records
      Consumption.where(date: Date.today)
    end

    def self.winning_days(startdate,enddate)
      summarize_days_to_wins_and_losses(Consumption.where('date >= ? and date <= ?', startdate, enddate)).select{|date,bool| bool == true }.count
    end

    def self.consumption_review_stats(startdate,enddate)
      @query = summarize_days_to_wins_and_losses(Consumption.where('date >= ? and date <= ?', startdate, enddate)).select{|date,bool| bool == true }
      @total_days = (enddate.to_date - startdate.to_date).to_i+1
      @winning_days = @query.count

      @hsh = {}
      @hsh[:total_days] = @total_days
      @hsh[:winning_days] = @winning_days
      @hsh[:percent_completed] = (@winning_days.to_f / @total_days.to_f * 100.0).round(0)
      @hsh[:avg_days_per_wk] =  (@winning_days / (@total_days / 7.0)).round(0)
      
      return @hsh
    end

    private

##                       ##
## ##                 ## ##
## ## ## CALLBACKS ## ## ##
## ##                 ## ##
##                       ##

    def downcase_description
      self.description = self.description.downcase
    end

    def kill_untracked_record
      @day_query = Consumption.where(date: self.date)
      @untracked_query = @day_query.where(description: "untracked")
      if @day_query.count > 1 and @untracked_query.count > 0
        @untracked_query.delete_all
      end
    end
end
