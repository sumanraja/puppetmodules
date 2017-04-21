# Copyright (C) 2013 VMware, Inc.

module PuppetX
  module Puppetlabs
    module Transport
      @@instances = []

      # Accepts a puppet resource reference, resource catalog, and loads connetivity info.
      def self.retrieve(options={})
        unless res_hash = options[:resource_hash]
          catalog  = options[:catalog]
          res_ref  = options[:resource_ref].to_s
          name     = Puppet::Resource.new(nil, res_ref).title
          res      = catalog.resource(res_ref)
          res_hash = res.to_hash
          [:server, :username, :password, :options].each do |attr|
            res_hash[attr] ||= res.provider.send(attr)
          end
        end

        provider = options[:provider]

        unless transport = find(name, provider)
          transport = PuppetX::Puppetlabs::Transport::const_get(provider.to_s.capitalize).new(res_hash)
          transport.connect
          @@instances << transport
        end

        transport
      end

      def self.cleanup
        @@instances.each do |i|
          i.close if i.respond_to? :close
        end
      rescue
      end

      private

      def self.find(name, provider)
        @@instances.find{ |x| x.is_a? PuppetX::Puppetlabs::Transport::const_get(provider.to_s.capitalize) and x.name == name }
      end

      def self.included(base)
        base.extend(ClassMethods)
      end

      def transport
        self.class.transport(resource)
      end

      module ClassMethods
        def transport(resource)
          @transport ||= PuppetX::Puppetlabs::Transport.retrieve(
            :resource_ref => resource[:transport],
            :catalog => resource.catalog,
            :provider => resource.provider.class.name
          )
        end
      end
    end
  end
end
