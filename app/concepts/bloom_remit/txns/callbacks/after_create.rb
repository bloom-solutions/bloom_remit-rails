module BloomRemit
  module Txns
    module Callbacks
      class AfterCreate < Disposable::Callback::Group

        on_change :enqueue!

        def enqueue!(form, **)
          PayoutJob.perform_async(form.model)
        end

      end
    end
  end
end
