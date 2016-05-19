class Reservation < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :diner
  belongs_to :timeslot

  validates :diner_name, presence: true
  validates :diner_phone, presence: true

  # after_create :reminder

  @@REMINDER_TIME = 1.day # minutes before appointment

  # Notify our appointment attendee X minutes before the appointment time
  def reminder
    @restaurant_name = self.restaurant.name
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    time_str = ((self.datetime).localtime).strftime("%I:%M%p on %b. %d, %Y")
    reminder = "Hi #{self.diner_name}. Please confirm your reservation for #{@restaurant_name} coming up at #{time_str}."
    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => self.diner_phone,
      :body => reminder
    )
  end

  def when_to_run
    datetime - @@REMINDER_TIME
  end

  handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }
end