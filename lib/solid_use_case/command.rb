module SolidUseCase
  class Command
    include Deterministic::CoreExt::Either
    include CommandUtil

    def self.run(input_hash={})
      self.new.run(input_hash)
    end

    # # # # # #
    # Helpers #
    # # # # # #

    def fail(type, data={})
      data[:type] = type
      Failure(ErrorStruct.new(data))
    end

    alias :next_step :Success
    alias :succeed :Success
  end
end
