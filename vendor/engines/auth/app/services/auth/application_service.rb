module Auth
  class ApplicationService < Dry::Operation
    protected

    def list(klass, search_params, where: {}, order: {})
      records = klass
        .where(where)
        .order(order)
        .ransack(search_params)
        .result

      Success records
    rescue StandardError
      Failure :error_on_load_records
    end

    def find(record_or_id, klass, error_message: :record_not_found)
      return Success record_or_id if record_or_id.is_a?(klass) && record_or_id.persisted?

      record = klass.find_by(id: record_or_id)
      if record
        Success record
      else
        Failure error_message
      end
    end

    def create(klass, create_params, error_message: :record_not_created)
      record = klass.create(create_params)
      if record
        Success record
      else
        Failure [ :record_not_created, record ]
      end
    end

    def update(record, update_params, error_message: :record_not_updated)
      if record.update(update_params)
        Success record
      else
        Failure [ :error_message, record ]
      end
    end

    def destroy(record, error_message: :record_not_destroyed)
      if record.destroy
        Success record
      else
        Failure [ :error_message, record ]
      end
    end
  end
end
