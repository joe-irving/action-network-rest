module ActionNetworkRest
  class People < Base
    def base_path
      'people/'
    end

    def create(person_data, tags: [])
      post_body = {'person' => person_data}
      if tags.any?
        post_body['add_tags'] = tags
      end

      response = client.post_request base_path, post_body
      object_from_response(response)
    end

    def unsubscribe(id)
      request_body = {email_addresses: [{status: 'unsubscribed'}]}
      response = client.put_request "#{base_path}#{url_escape(id)}", request_body
      object_from_response(response)
    end
  end
end
