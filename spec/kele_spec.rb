require "spec_helper"

describe Kele, type: :request do
  describe '#initialize' do
    it 'authenticates the user', vcr: {cassette_name: :initialize} do
      kele = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
      expect(kele.instance_variable_get(:@auth_token)).to be_a String
    end
  end

  describe '#get_me' do
    it 'gets my info', vcr: {cassette_name: :get_me} do
      kele = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
      response = kele.get_me
      expect(response.instance_variable_get(:@user_data)).to be_a Object
    end
  end

  describe '#get_mentor_availability' do
    it 'gets mentor availability', vcr: {cassette_name: :get_mentor_availability} do
      kele = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
      response = kele.get_mentor_availability(623967)
      expect(response.instance_variable_get(:@user_data)).to be_a Object
    end
  end

  describe '#get_messages' do
    it 'gets messages', vcr: {cassette_name: :get_messages} do
      kele = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
      response = kele.get_messages(1)
      expect(response.instance_variable_get(:@user_data)).to be_a Object
    end
  end

  describe '#get_roadmap' do
    it 'gets roadmap', vcr: {cassette_name: :get_roadmap} do
      kele = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
      response = kele.get_roadmap(ENV['ROADMAP'])
      expect(response.instance_variable_get(:@user_data)).to be_a Object
    end
  end

  describe '#get_checkpoint' do
    it 'gets checkpoint info', vcr: {cassette_name: :get_checkpoint} do
      kele = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
      response = kele.get_checkpoint(ENV['CHECKPOINT'])
      expect(response.instance_variable_get(:@user_data)).to be_a Object
    end
  end

  describe '#create_message' do
    it 'creates message', vcr: {cassette_name: :create_message} do
      kele = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
      response = kele.create_message(ENV['SENDER'],ENV['MENTOR'],"A test subject","test text")
      expect(response.instance_variable_get(:@message)).to be_a Object
    end
  end

  describe '#create_submission' do
    it 'creates submission', vcr: {cassette_name: :create_submission} do
      kele = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
      response = kele.create_submission("submission","https://github.com/jmuldvp/kele/commit/e8036ab4b74f12abab5c8fdb98f54cc2703d6e25",1905,"CP 7 completed",2340268)
      expect(response.instance_variable_get(:@submission)).to be_a Object
    end
  end

end
