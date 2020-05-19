class BaseService
  def build_response(entity, success)
    ServiceResponse.new(entity: entity, success: success)
  end

  def recover_from_exception(exception)
    Rails.logger.error "#{exception.class} #{exception.message}"
  end

  class ServiceResponse
    attr_reader :entity

    def initialize(entity:, success:)
      @entity = entity
      @success = success
    end

    def success?
      @success
    end
  end

end
