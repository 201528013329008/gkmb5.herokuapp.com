class RegistrationsController < Devise::RegistrationsController
    #
    # def update
    #     self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    #     prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
    #
    #     resource_updated = update_resource(resource, account_update_params)
    #     yield resource if block_given?
    #     if resource_updated
    #         if is_flashing_format?
    #             flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
    #                 :update_needs_confirmation : :updated
    #             set_flash_message :notice, flash_key
    #         end
    #         sign_in resource_name, resource, bypass: true
    #         respond_with resource, location: after_update_path_for(resource)
    #     else
    #         clean_up_passwords resource
    #         respond_with resource
    #     end
    # end
protected
    def after_resending_confirmation_instructions_path_for(resource)
        logger.debug "[INFO] after_resending_confirmation_instructions_path_for"
        super
    end

    def after_sign_in_path_for(resource)
        logger.debug "[INFO] after_sign_in_path_for"
        super
    end

    def after_sign_up_path_for(resource)
        logger.debug "[info] after_sign_up_path_for"
        home_thanks_path
    end

    def after_update_path_for(resource)
        logger.debug "[info] after_update_path_for"
        super
    end

    def after_inactive_sign_up_path_for(resource)
        logger.debug "[info] after_inactive_sign_up_path_for"
        home_confirm_path
    end


end
